/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zumueller.container;

/**
 * Exception for not retrievable container entries
 * @author Kevin
 */
public class NoSuchEntryException extends Exception {
    
    public NoSuchEntryException(String message) {
        super(message);
    }
    
    
}
