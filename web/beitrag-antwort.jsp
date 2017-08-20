<%-- 
    Document   : beitrag-antwort
    Created on : 15-Aug-2017, 21:19:38
    Author     : Kevin
--%>

<%@page import="com.zumueller.resources.Resource"%>
<%@page import="com.zumueller.container.Container"%>
<%@page import="com.zumueller.DBConnection"%>
<%@page import="com.zumueller.Post"%>
<%
    DBConnection connection = (DBConnection) Container.getContainer().get(DBConnection.class.getCanonicalName());
    Post originalPost = connection.getPostsByCondition(Post.ID, request.getParameter(Post.ID)).get(0);
    Resource translations = (Resource) Container.getContainer().get(Resource.class.getCanonicalName());
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="resources/head.html" %>
        <title><%= translations.get("respond") %></title>
    </head>
    <body>
        <h1>Auf Beitrag antworten</h1>
        
        <form action="antwort-speichern.jsp" method="POST">
            <input type="hidden" name="<%= Post.RESPONSE_ID %>" value="<%= originalPost.getId() %>">
            <input type="hidden" name="<%= Post.IS_RESPONSE %>" value="1">
            
            <table>
                <tr>
                    <td><label for="name"><%= translations.get("name") %>&nbsp;</label></td>
                    <td><input id="name" name="<%= Post.NAME %>" /></td>
                </tr>
                <tr>
                    <td><label for="email"><%= translations.get("email") %>&nbsp;</label></td>
                    <td><input id="email" name="<%= Post.EMAIL %>" /></td>
                </tr>
                <tr>
                    <td><label for="title"><%= translations.get("title") %>&nbsp;</label></td>
                    <td><input id="title" name="<%= Post.TITLE %>" value="<%= translations.get("respond.re") %>: <%= originalPost.getTitle() %>" /></td>
                </tr>
                <tr>
                    <td><label for="content"><%= translations.get("post") %>&nbsp;</label></td>
                    <td><textarea id="content" name="<%= Post.CONTENT %>" /></textarea></td>
                </tr>
                <tr>
                    <td>
                        <button><%= translations.get("button.submit") %></button>
                        <button type="reset"><%= translations.get("button.reset") %></button>
                    </td>
                </tr>
            </table>
            
            <hr />
            
            <a href="index.jsp"><%= translations.get("index") %></a>
        </form>
    </body>
</html>
