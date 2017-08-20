/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zumueller.servlet;

import com.zumueller.container.Container;
import javax.servlet.annotation.WebServlet;

/**
 * startup servlet which should be compatible with several application servers,
 * or so the Internet says
 * @author Kevin
 */

@WebServlet(name="startup", loadOnStartup=0)
public class StartUpServlet extends javax.servlet.http.HttpServlet {

    @Override
    public void init() {
        Container.initializeContainer();
    }
    
}
