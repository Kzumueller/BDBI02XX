<%-- 
    Document   : beitrag-erstellen
    Created on : 15-Aug-2017, 17:32:45
    Author     : Kevin
--%>

<%@page import="com.zumueller.container.Container"%>
<%@page import="com.zumueller.resources.Resource"%>
<%@page import="com.zumueller.Post"%>
<%
    Resource translations = (Resource) Container.getContainer().get(Resource.class.getCanonicalName());
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="resources/head.html" %>
        <title><%= translations.get("createPost") %></title>
    </head>
    <body>
        <h1><%= translations.get("createPost") %></h1>

        <form action="beitrag-speichern.jsp" method="POST">
            <input type="hidden" name="<%= Post.RESPONSE_ID %>" value="0">
            <input type="hidden" name="<%= Post.IS_RESPONSE %>" value="0">
            
            <table>
                <tr>
                    <td><label for="name"><%= translations.get("name") %>:&nbsp;</label></td>
                    <td><input id="name" name="<%= Post.NAME %>" /></td>
                </tr>
                <tr>
                    <td><label for="email"><%= translations.get("email") %>:&nbsp;</label></td>
                    <td><input id="email" name="<%= Post.EMAIL %>" /></td>
                </tr>
                <tr>
                    <td><label for="title"><%= translations.get("title") %></label></td>
                    <td><input id="title" name="<%= Post.TITLE %>" /></td>
                </tr>
                <tr>
                    <td><label for="content"><%= translations.get("post") %></label></td>
                    <td><textarea id="content" name="<%= Post.CONTENT %>" /></textarea></td>
                </tr>
                <tr>
                    <td><button type="submit"><%= translations.get("button.submit") %></button></td>
                </tr>
            </table>
            
            <hr />
            
            <a href="index.jsp"><%= translations.get("index") %></a>
        </form>
    </body>
</html>
