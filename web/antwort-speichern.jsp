<%-- 
    Document   : antwort-speichern
    Created on : 15-Aug-2017, 21:22:04
    Author     : Kevin
--%>

<%@page import="com.zumueller.Post"%>
<% String backLinkId = request.getParameter(Post.RESPONSE_ID); %>

<jsp:include page="savePost.jsp">
    <jsp:param name="backLinkId" value="<%= backLinkId %>" />
</jsp:include>
