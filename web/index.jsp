<%-- 
    Document   : index
    Created on : 15-Aug-2017, 14:45:46
    Author     : Kevin
--%>

<%@page import="com.zumueller.resources.Resource"%>
<%@page import="com.zumueller.container.Container"%>
<%@page import="java.util.List"%>
<%@page import="com.zumueller.Post"%>
<%@page import="com.zumueller.DBConnection"%>
<%
    DBConnection connection = (DBConnection) Container.getContainer().get(DBConnection.class.getCanonicalName());
    List<Post> posts = connection.getAllPosts();
    Resource translations = (Resource) Container.getContainer().get(Resource.class.getCanonicalName());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="resources/head.html" %>
        <title><%= translations.get("index.headline")%></title>
    </head>
    <body>
        <h1><%= translations.get("index.headline")%></h1>

        <table>
            <thead>
            <th><%= translations.get("title")%></th>
            <th><%= translations.get("index.author")%></th>
            <th><%= translations.get("index.postDate")%></th>
        </thead>
        <tbody>
            <% for (Post post : posts) {%>
            <tr>
                <td><a href="beitrag-lesen.jsp?<%= Post.ID%>=<%= post.getId()%>"><%= post.getTitle()%></a></td>
                <td><%= post.getName()%></td>
                <td><%= post.getTimestamp()%></td>
            </tr>
            <% }%>
        </tbody>
    </table>
    <hr />
    <a href="beitrag-erstellen.jsp"><%= translations.get("createPost")%></a>
</body>
</html>
