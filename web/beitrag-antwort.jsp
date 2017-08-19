<%-- 
    Document   : beitrag-antwort
    Created on : 15-Aug-2017, 21:19:38
    Author     : Kevin
--%>

<%@page import="com.zumueller.container.Container"%>
<%@page import="com.zumueller.DBConnection"%>
<%@page import="com.zumueller.Post"%>
<%
    DBConnection connection = (DBConnection) Container.getContainer().get(DBConnection.class.getCanonicalName());
    Post originalPost = connection.getPostsByCondition(Post.ID, request.getParameter(Post.ID)).get(0);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="resources/head.html" %>
        <title>Antworten</title>
    </head>
    <body>
        <h1>Auf Beitrag antworten</h1>
        
        <form action="beitrag-speichern.jsp" method="POST">
            <input type="hidden" name="<%= Post.RESPONSE_ID %>" value="<%= originalPost.getId() %>">
            <input type="hidden" name="<%= Post.IS_RESPONSE %>" value="1">
            
            <table>
                <tr>
                    <td><label for="name">Ihr Name </label></td>
                    <td><input id="name" name="<%= Post.NAME %>" /></td>
                </tr>
                <tr>
                    <td><label for="email">Ihre E-Mail-Adresse: </label></td>
                    <td><input id="email" name="<%= Post.EMAIL %>" /></td>
                </tr>
                <tr>
                    <td><label for="title">Titel-Zeile des Beitrags</label></td>
                    <td><input id="title" name="<%= Post.TITLE %>" value="AW: <%= originalPost.getTitle() %>" /></td>
                </tr>
                <tr>
                    <td><label for="content">Ihr Beitragstext</label></td>
                    <td><textarea id="content" name="<%= Post.CONTENT %>" /></textarea></td>
                </tr>
                <tr>
                    <td>
                        <button type="submit">Abschicken</button>
                        <button type="reset">Löschen</button>
                    </td>
                </tr>
            </table>
            
            <hr />
            
            <a href="index.jsp">Übersicht</a>
        </form>
    </body>
</html>
