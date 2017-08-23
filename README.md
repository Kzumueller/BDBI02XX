# BDBI02XX

A little project in the course of my B.Sc.  
This beautifully named repo contains a forum using JSP, though I doubt anyone still uses that for new projects.  
Some file names I did not choose so they are in German but the project features home-brewed localization.  
There is also a rudimentary dependency injection container I've been playing around with (hence the 'kata' tag).  

## Setup & Configuration

This has never run productively but all it needs is an Apache Glassfish sever (similar JEE servers might well work)  
and a DB service (either Apache Derby or good old MySQL), URLs and credentials can be managed in dependencies.properties.

### Dependency Injection / Inversion of Control

dependencies.properties can also hold DI configurations (so far, only POJOs are supported), the key can/should, the value must hold a fully qualified class name.  
Automatically instantiated objects can be retrieved at runtime using  
```java
com.zumueller.container.Container.getContainer().get(/*String key*/)
```  
Or implement com.zumueller.container.ContainerInterface to create your own

### Adding language support

languages.properties holds all supported languages as a comma-separated value, the translations themselves are located in their respective files:  
ISOCODE.properties, e.g. "en.properties".  
The current/default language is currently held in the DI container via dependencies.properties