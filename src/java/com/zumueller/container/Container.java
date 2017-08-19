package com.zumueller.container;

import com.zumueller.resources.PropertiesParser;
import java.io.IOException;
import java.util.Collection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * very simple dependency injection container
 *
 * @author Kevin
 */
public class Container implements ContainerInterface {

    private Map<String, Object> entries = null;

    private static ContainerInterface container = null;

    static {
        initializeContainer();
    }

    /**
     * Initialization of the container singleton
     */
    private static void initializeContainer() {
        container = new Container();
        
        Enumeration keys = null;
        Collection values = null;

        try {
            Properties properties = PropertiesParser.parseFile("dependencies.properties");
            keys = properties.keys();
            values = properties.values();
        } catch (IOException exception) {
            System.err.println(exception.getMessage());
            System.exit(1); //if the container fails, all else is doomed
        }

        for (Object value : values) {
            String key = (String) keys.nextElement();
            Object entry = null;
                    
            try {
                entry = Class.forName((String) value).newInstance();
            } catch (Exception exception) {
                entry = value;
            }
            
            container.set(key, entry);
        }

    }

    /**
     * static method for accessing the container singleton
     *
     * @return
     */
    public static ContainerInterface getContainer() {
        return container;
    }

    public Container() {
        entries = new HashMap();
    }
    
    /**
     * gets an entry from the container
     *
     * @param identifier
     * @return
     * @throws NoSuchEntryException
     */
    @Override
    public Object get(String identifier) throws NoSuchEntryException {
        if (entries.containsKey(identifier)) {
            return entries.get(identifier);
        }

        throw new NoSuchEntryException(String.format("No Entry found for identifier %s", identifier));
    }

    /**
     * sets or overrides an entry at run time
     *
     * @param identifier
     * @param entry
     */
    @Override
    public void set(String identifier, Object entry) {
        entries.put(identifier, entry);
    }

}
