<%-- 
    Document   : beitrag-speichern
    Created on : 15-Aug-2017, 18:03:55
    Author     : Kevin
--%>

<%@page import="com.zumueller.container.Container"%>
<%@page import="com.zumueller.DBConnection"%>
<% 
    DBConnection connection = (DBConnection) Container.getContainer().get(DBConnection.class.getCanonicalName());
    boolean success = connection.insert(request.getParameterMap());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="resources/head.html" %>
        <title>Beitrag speichern</title>
    </head>
    <body>
        <% if (success) { %>
            <p>Vielen Dank für Ihren Beitrag!</p>
        <% } else { %>
            <p>Speichern war nicht erfolgreich, Ihr Beitrag ist für immer verloren!!</p>
        <% } %>
        
        <a href="index.jsp">Zum Forumsüberblick</a>
    </body>
</html>
