<%-- 
    Document   : savePost
    Created on : 20-Aug-2017, 14:42:43
    Author     : Kevin
--%>
<%@page import="com.zumueller.Post"%>
<%@page import="com.zumueller.resources.Resource"%>
<%@page import="com.zumueller.container.Container"%>
<%@page import="com.zumueller.DBConnection"%>
<% 
    DBConnection connection = (DBConnection) Container.getContainer().get(DBConnection.class.getCanonicalName());
    boolean success = connection.insert(request.getParameterMap());
    Resource translations = (Resource) Container.getContainer().get(Resource.class.getCanonicalName());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="resources/head.html" %>
        <title><%= translations.get("savePost") %></title>
    </head>
    <body>
        <% if (success) { %>
            <p><%= translations.get("savePost.success") %></p>
        <% } else { %>
            <p><%= translations.get("savePost.ohNoes") %></p>
        <% } %>
        
        <div class="nav__button--bar">
            <div><a href="index.jsp"><%= translations.get("index") %></a></div>
            <% if(!"null".equals(request.getParameter("backLinkId"))) { %>
            <div><a href="beitrag-lesen.jsp?<%= Post.ID %>=${param.backLinkId}"><%= translations.get("savePost.backToPost") %></a></div>
            <% } %>
        </div>
    </body>
</html>

