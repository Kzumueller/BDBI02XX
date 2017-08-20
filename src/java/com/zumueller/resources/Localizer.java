/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zumueller.resources;

import com.zumueller.container.Container;
import com.zumueller.container.ContainerInterface;
import com.zumueller.container.NoSuchEntryException;
import java.io.IOException;
import java.util.Collection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * Resource providing translations
 *
 * @author Kevin
 */
public class Localizer implements Resource {

    private Map<String, Map<String, String>> bundle = null;
    private ContainerInterface container = null;

    /**
     *
     */
    public Localizer() {
        container = Container.getContainer();
        bundle = new HashMap();
        try {
            Properties languages = PropertiesParser.parseFile("languages.properties");

            for(Object localizationLanguage : languages.values()) {
                String language = (String) localizationLanguage;
                Map<String, String> languageMap = new HashMap();

                Properties properties = PropertiesParser.parseFile(String.format("%s.properties", language));
                Enumeration keys = properties.keys();
                Collection values = properties.values();

                values.forEach((value) -> {
                    languageMap.put((String) keys.nextElement(), (String) value);
                });

                bundle.put(language, languageMap);
            }
        } catch (IOException exception) {
            System.err.println(exception.getMessage());
        }
    }

    /**
     * gets the translation corresponding to the provided key
     *
     * @param key
     * @return
     */
    @Override
    public String get(String key) {
        String language;
        try {
            language = (String) container.get("currentLanguage");
        } catch (NoSuchEntryException exception) {
            return key;
        }

        if (bundle.containsKey(language) && bundle.get(language).containsKey(key)) {
            return bundle.get(language).get(key);
        }

        return key;
    }

}
