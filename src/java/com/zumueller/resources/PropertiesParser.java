/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zumueller.resources;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * static parser for .properties files
 *
 * @author Kevin
 */
public class PropertiesParser {

    public static Properties parseFile(String fileName) throws IOException {
        ClassLoader loader = Thread.currentThread().getContextClassLoader();
        InputStream stream = loader.getResourceAsStream(fileName);
        Properties properties = new Properties();
        properties.load(stream);

        return properties;
    }
}
