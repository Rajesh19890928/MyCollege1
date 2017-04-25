/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JavaClasses;

/**
 *
 * @author raojha
 */

import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public ResultSet getSubjects()
    {
        //InitialContext initialContext = new InitialContext();
        //Context context = (Context) initialContext.lookup("java:comp/env");
        //The JDBC Data source that we just created
        //DataSource ds = (DataSource) context.lookup("connpool");
        //Connection connection = ds.getConnection();
        ResultSet rs = null;
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://20.0.1.245:3306/mynewdatabase","root","tiger");
            String query = "SELECT DISTINCT subject_id, name FROM subject";
            PreparedStatement statement = con.prepareStatement(query);
            rs = statement.executeQuery();
        }
        catch(ClassNotFoundException cnfex)
        {
            System.out.println("Error: " + cnfex);
        }
        catch(SQLException ex) 
        {
            // handle any errors
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }
        return rs;
    }
    
    public ResultSet getDetails(int subject_id)
    {
        ResultSet rs = null;
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://20.0.1.245:3306/mynewdatabase","root","tiger");
            String query = "SELECT * FROM counselor AS c INNER JOIN subject AS s ON c.counselor_id=s.counselor_idfk WHERE s.subject_id="+subject_id;
            PreparedStatement statement = con.prepareStatement(query);
            rs = statement.executeQuery();
        }
        catch(ClassNotFoundException cnfex)
        {
            System.out.println("Error: " + cnfex);
        }
        catch(SQLException ex) 
        {
            // handle any errors
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }
        return rs;
    }
}
