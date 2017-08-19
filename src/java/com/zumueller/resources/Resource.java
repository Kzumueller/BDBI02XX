/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zumueller.resources;

/**
 * interface for configurable resources
 * @author Kevin
 */
public interface Resource {
    
    /**
     * gets a String in an otherwise defined language
     * @param key
     * @return 
     */
    String get(String key);
}
