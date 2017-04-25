<%-- 
    Document   : response
    Created on : Apr 25, 2017, 1:50:27 PM
    Author     : raojha
--%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Welcome</title>
    </head>
    <body>
        <h1>Welcome to your college</h1>
        <h4>These are the teachers who teach this course</h4>
        <%
            InitialContext initialContext = new InitialContext();
            Context context = (Context) initialContext.lookup("java:comp/env");
            //The JDBC Data source that we just created
            DataSource ds = (DataSource) context.lookup("connpool");
            Connection connection = ds.getConnection();

            if (connection == null)
            {
                throw new SQLException("Error establishing connection!");
            }
            String query = "SELECT * FROM counselor as c inner join subject as s on c.counselor_id=s.counselor_idfk where s.subject_id="+request.getParameter("subject_id");

            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet rs = statement.executeQuery();
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
                    <td><strong>Course Description: </strong></td>
                    <td><span style="font-size:smaller; font-style:italic;"><% out.print(rs.getString("description")); %>%></span></td>
                </tr>
                
                <tr>
                    <td><strong>Teacher: </strong></td>
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
