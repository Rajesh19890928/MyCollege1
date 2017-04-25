<%-- 
    Document   : response
    Created on : Apr 25, 2017, 1:50:27 PM
    Author     : raojha
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Phoenix Consulting - Details</title>
    </head>
    <body>
        <h1>Welcome to Phoenix Consulting</h1>
        <h4>These are the counselors who can help you</h4>
        <%
            int subject_id = Integer.parseInt(request.getParameter("subject_id"));
            JavaClasses.DBConnection obj = new JavaClasses.DBConnection();
            ResultSet rs = obj.getDetails(subject_id);
            while (rs.next())
            {
            %>
            
        <table border="0">
            <thead>
                <tr>
                    <th colspan="2"><% out.print(rs.getString("name")); %></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><strong>Service Description: </strong></td>
                    <td><span style="font-size:smaller; font-style:italic;"><% out.print(rs.getString("description")); %>%></span></td>
                </tr>
                
                <tr>
                    <td><strong>Counselor: </strong></td>
                    <td><% out.print(rs.getString("first_name"));%> <%out.print(rs.getString("last_name")); %>
                        <br>
                        <span style="font-size:smaller; font-style:italic;">
                        Member since: <% out.print(rs.getString("member_since")); %></span>
                    </td>
                </tr>
                <tr>
                    <td><strong>Contact Details: </strong></td>
                    <td><strong>Email: </strong>
                        <a href="mailto:<% out.print(rs.getString("email")); %>"><% out.print(rs.getString("email")); %></a>
                        <br><strong>Phone: </strong><% out.print(rs.getString("telephone")); %>
                    </td>
                </tr>
            </tbody>
        </table>
        <%}%>
        <br>
        <a href="index.jsp">Go back</a>
    </body>
</html>
