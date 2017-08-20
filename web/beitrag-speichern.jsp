<%-- 
    Document   : beitrag-speichern
    Created on : 15-Aug-2017, 18:03:55
    Author     : Kevin
--%>

<%@page import="com.zumueller.Post"%>
<% String backLinkId = request.getParameter(Post.ID); %>

<jsp:include page="savePost.jsp">
    <jsp:param name="backLinkId" value="<%= backLinkId %>" />
</jsp:include>