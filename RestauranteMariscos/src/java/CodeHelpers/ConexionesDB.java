
package CodeHelpers;

/**
 *
 * @author oscar
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConexionesDB {
     /*
        import java.sql.*;
 class dbAccess {
  public static void main (String args []) throws SQLException
  {    

    DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());

    Connection conn = DriverManager.getConnection
          ("jdbc:oracle:thin:@WIN01:1521:oracleBD", "user", "passw");
         // driver@machineName:port:SID           ,  userid,  password

    Statement stmt = conn.createStatement();
    ResultSet rset = 
              stmt.executeQuery("select BANNER from SYS.V_$VERSION");
    while (rset.next())
         System.out.println (rset.getString(1));   // Print col 1
    stmt.close();
    

  }
 }*/ 
    String conexion="jdbc:oracle:thin:@127.0.0.1:1521:xe";
    String userdb="Restaurant";
    String passdb="sasa";
    Connection conn;
    PreparedStatement sentencia;
    public String probarConexion() throws ClassNotFoundException{
        String estado="";
    try {
       DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
           Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(conexion, userdb, passdb);
           // Connection conn = DriverManager.getConnection(bdurl, userdb, passdb);
            if (conn != null) {
                conn.close();
                estado="Conectado a la base de datos";

            }   
         } catch (SQLException ex) {
            //JOptionPane.showMessageDialog(null,"Ha ocurrido un error al conectar a la base de datos, la informacion siguiente puede ayudar a diagnosticar el problema:\n"+ ex);
            estado="No ha sido posible establecer conexión con la base de datos " +ex;
        }
        return estado;
    }
    
    
    public String registrar(String SQL) throws ClassNotFoundException
    {
        String estado="";
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(conexion, userdb, passdb);
            if (conn != null) {
                sentencia = conn.prepareStatement(SQL);
                sentencia.execute();  
                conn.close();
                estado="El registro se ha realizado satisfactoriamente";              
            }   
         } catch (SQLException ex) {
                estado="No se ha posido realizar el registro el error ha sido el siguiente:\n"+ex;
        }   
                return estado;
    
    }
    
     public ResultSet consulta(String SQL) throws ClassNotFoundException
    {
        ResultSet resultado=null;
        try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(conexion, userdb, passdb);
             Statement sentencia = conn.createStatement();
             resultado =sentencia.executeQuery(SQL);
           
        } 
        catch (SQLException ex) 
        {
              //JOptionPane.showMessageDialog(null, "No se pudo realizar la consulta con la base de datos:\n"+ex);
            System.out.println(ex);
        }
        
        return resultado;
}
     
     public String eliminar(String SQL) throws ClassNotFoundException
    {
        String estado="";
        try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(conexion, userdb, passdb);
            if (conn != null) {
                sentencia = conn.prepareStatement(SQL);
                sentencia.execute(SQL);  
                conn.close();
                estado="La eliminacion se ha realizado exitosamente";              
            }   
         } catch (SQLException ex) {
                estado="No se ha podido realizar la eliminación el error ha sido el siguiente:\n"+ex;
        }   
                return estado;
    
    }
     
     public void cerrarConexion()
     {
        try {
            conn = DriverManager.getConnection(conexion, userdb, passdb);
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(ConexionesDB.class.getName()).log(Level.SEVERE, null, ex);
        }

         
     } 
    
}
