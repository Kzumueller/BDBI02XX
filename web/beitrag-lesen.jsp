<%-- 
    Document   : beitrag-lesen
    Created on : 15-Aug-2017, 16:32:54
    Author     : Kevin
--%>

<%@page import="com.zumueller.container.Container"%>
<%@page import="java.util.List"%>
<%@page import="com.zumueller.Post"%>
<%@page import="com.zumueller.DBConnection"%>
<% 
    DBConnection connection = (DBConnection) Container.getContainer().get(DBConnection.class.getCanonicalName());
    Post post = connection.getPostsByCondition(Post.ID, request.getParameter(Post.ID)).get(0);
    List<Post> responses = connection.getPostsByCondition(Post.RESPONSE_ID, post.getId());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="resources/head.html" %>
        <title>Beitrag lesen</title>
    </head>
    <body>
        <h1>Der Beitrag</h1>
        
        <table>
            <tr><td>Titel:</td><td><%= post.getTitle() %></td></tr>
            <tr><td>Geschrieben von:</td><td><%= post.getName() %></td></tr>
            <tr><td>Email:</td><td><%= post.getEmail() %></td></tr>
            <tr><td>Geschrieben am:</td><td><%= post.getTimestamp() %></td></tr>
        </table>

        <hr />
        <p><%= post.getContent() %></p>
        <hr />
        
        <h2>Antworten zum Beitrag</h2>
        
        <%for (Post responsePost : responses) {%>
            <div class="response__container">
                <table>
                    <tr><td>Titel:</td><td><%= responsePost.getTitle() %></td></tr>
                    <tr><td>Geschrieben von:</td><td><%= responsePost.getName() %></td></tr>
                    <tr><td>Email:</td><td><%= responsePost.getEmail() %></td></tr>
                    <tr><td>Geschrieben am:</td><td><%= responsePost.getTimestamp() %></td></tr>
                </table>

                <hr />
                <p><%= responsePost.getContent() %></p>
                <hr />
            </div>
        <% } %>    
        
        <div class="nav__button--bar">
            <div><a href="javascript:void(0);" onclick="javascript: window.history.back();">zurück</a></div>
            <div><a href="index.jsp">Übersicht</a></div>
            <div><a href="beitrag-antwort.jsp?<%= Post.ID %>=<%= post.getId() %>">Antworten</a></div>
        </div>
    </body>
</html>
