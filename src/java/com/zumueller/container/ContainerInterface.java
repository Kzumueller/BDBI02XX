package com.zumueller.container;

/**
 * interface for a very simple dependency injection container
 * @author Kevin
 */
public interface ContainerInterface {
    
    /**
     * gets an entry from the container
     * @param identifier
     * @return 
     * @throws com.zumueller.container.NoSuchEntryException 
     */
    Object get(String identifier) throws NoSuchEntryException;
    
    /**
     * sets or overrides an entry at run time
     * @param identifier
     * @param entry 
     */
    void set(String identifier, Object entry);
}
