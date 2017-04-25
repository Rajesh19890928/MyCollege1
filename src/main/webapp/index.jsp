<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Home Page - Phoenix</title>
    </head>
    <body>
        <h1>Welcome to Phoenix Consulting</h1>
        <br>
        <%
            JavaClasses.DBConnection obj = new JavaClasses.DBConnection();
            ResultSet rs = obj.getSubjects();
        %>

        
            <table border="0">
                <thead>
                    <tr>
                        <th>Please select an area you need help in </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td height="0">
                            <br>
                            <form action="response.jsp" method="post">
                                <span class="plain-select">
                                <select name="subject_id">
                                    <%
                                    while (rs.next())
                                    {
                                    %>
                                    <option value="<% out.print(rs.getString("subject_id")); %>"> 
                                    <% out.print(rs.getString("name")); %>
                                    </option>
                                    <%
                                    }%>
                                </select>
                                </span>
                                <br>
                                <br>
                                <input type="submit" value="Submit" name="submit" />                                
                            </form>                            
                        </td>
                    </tr>
                </tbody>
            </table>
    </body>
</html>
