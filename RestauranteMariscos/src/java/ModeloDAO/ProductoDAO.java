/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import CodeHelpers.ConexionesDB;
import Interfaces.CRUDProductos;
import Modelo.Producto;
import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL; 
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductoDAO implements CRUDProductos {

    ConexionesDB conector = new ConexionesDB();
    Producto p = new Producto();
    @Override
    public List listar() {
        ArrayList<Producto> listaProductos = new ArrayList<>();
        ResultSet resultadoConsulta = null;
        try {
            resultadoConsulta = conector.consulta("select * from Producto where tipo='"+"Platillo' order by idProducto");
            while (resultadoConsulta.next()) {
                System.out.println("imprime");
                Producto objetoProducto = new Producto();
                objetoProducto.setIdProducto(resultadoConsulta.getInt("idProducto"));
                objetoProducto.setNombreProducto(resultadoConsulta.getString("nombreProducto"));
                objetoProducto.setDescripcionProducto(resultadoConsulta.getString("descripcionProducto"));
                objetoProducto.setPrecioProducto(resultadoConsulta.getFloat("precioProducto"));
                objetoProducto.setTipo(resultadoConsulta.getString("tipo"));
                objetoProducto.setCategoria(resultadoConsulta.getString("categoria"));
                listaProductos.add(objetoProducto);

            }

        } catch (Exception e) {

        }
        return listaProductos;
    }
 public List listar2() {
        ArrayList<Producto> listaProductos = new ArrayList<>();
        ResultSet resultadoConsulta = null;
        try {
            resultadoConsulta = conector.consulta("select * from Producto where tipo='"+"Bebida' order by categoria");
            while (resultadoConsulta.next()) {
                System.out.println("imprime");
                Producto objetoProducto = new Producto();
                objetoProducto.setIdProducto(resultadoConsulta.getInt("idProducto"));
                objetoProducto.setNombreProducto(resultadoConsulta.getString("nombreProducto"));
                objetoProducto.setDescripcionProducto(resultadoConsulta.getString("descripcionProducto"));
                objetoProducto.setPrecioProducto(resultadoConsulta.getFloat("precioProducto"));
                objetoProducto.setTipo(resultadoConsulta.getString("tipo"));
                objetoProducto.setCategoria(resultadoConsulta.getString("categoria"));
                listaProductos.add(objetoProducto);

            }

        } catch (Exception e) {

        }
        return listaProductos;
    }

    @Override
    public Producto listar(int idProducto) {
        ArrayList<Producto> listaProductos = new ArrayList<>();
        ResultSet resultadoConsulta = null;
        try {
            resultadoConsulta = conector.consulta("select * from Producto where idProducto=" + idProducto);
            while (resultadoConsulta.next()) {
                p.setIdProducto(resultadoConsulta.getInt("idProducto"));
                p.setNombreProducto(resultadoConsulta.getString("nombreProducto"));
                p.setDescripcionProducto(resultadoConsulta.getString("descripcionProducto"));
                p.setPrecioProducto(resultadoConsulta.getFloat("precioProducto"));
                p.setTipo(resultadoConsulta.getString("tipo"));
                p.setCategoria(resultadoConsulta.getString("categoria"));
            }

        } catch (Exception e) {
        }
        return p;
    }

    public boolean Producto(Producto producto) {

        try {
            System.out.println("agregar");
            System.out.println(producto.getNombreProducto());
            String inser = "insert into Producto (nombreProducto, descripcionProducto, precioProducto, tipo, categoria)values('" + producto.getNombreProducto() + "','" + producto.getDescripcionProducto() + "'," + producto.getPrecioProducto()  + ",'" + producto.getTipo() + "','" + producto.getCategoria()+"')";
            System.out.println(inser);
            conector.registrar(inser);
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean editar(Producto producto) {
        try {
            System.out.println("actualizar");
            String sql = "update Producto set nombreProducto='" + producto.getNombreProducto() + "',descripcionProducto='" + producto.getDescripcionProducto() + "',precioProducto=" + producto.getPrecioProducto()+ ",tipo='" + producto.getTipo()+ "',categoria='" + producto.getCategoria() + "' where idProducto=" + producto.getIdProducto();
            conector.registrar(sql);
        } catch (Exception e) {

        }
        return false;
    }
    @Override
    public boolean eliminar(int idProducto) {
        try {
            System.out.println("eliminar");
            conector.eliminar("delete from Producto where idProducto=" + idProducto);
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    @Override
    public boolean agregar(Producto producto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    public void obtenerJSONCategorias(HttpServletRequest request, HttpServletResponse response) throws Exception {
    String tipo="";
    if(request.getParameter("tipo")==null)
    {
    
    }
    else{
        tipo=request.getParameter("tipo");
    }
        
    JsonArray jsonArray = new JsonArray(); 
    ResultSet resultadoConsulta = null;
        System.out.println("select Categoria from Producto where tipo='"+tipo+"' group by Categoria");
            try {
            resultadoConsulta = conector.consulta("select Categoria from Producto where tipo='"+tipo+"' group by Categoria");
            while (resultadoConsulta.next()) {
                JsonObject jsonObject = new JsonObject();
                jsonObject.addProperty("nombre", resultadoConsulta.getString("Categoria"));
                jsonArray.add(jsonObject);
            }  
        String json =jsonArray.toString();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);    
        } catch (Exception e) {
                System.out.println("Error"+e);
        }
   }
    
    public void obtenerJSONTipos(HttpServletRequest request, HttpServletResponse response) throws Exception {
    JsonArray jsonArray = new JsonArray(); 
    ResultSet resultadoConsulta = null;
            try {
            resultadoConsulta = conector.consulta("select Tipo from Producto group by Tipo");
            while (resultadoConsulta.next()) {
                JsonObject jsonObject = new JsonObject();
                jsonObject.addProperty("nombre", resultadoConsulta.getString("Tipo"));
                jsonArray.add(jsonObject);
            }  
        String json =jsonArray.toString();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);    
        } catch (Exception e) {
                System.out.println("Error"+e);
        }
   }
    
    public void obtenerJSONProductosXCategorias(HttpServletRequest request, HttpServletResponse response) throws Exception {
    JsonArray jsonArray = new JsonArray(); 
    ResultSet resultadoConsulta = null;
    String categoria="";
    if(request.getParameter("categoria")==null)
    {
    
    }
    else{
        categoria=request.getParameter("categoria");
    }
    System.out.println("Atributo "+categoria);

    //String categoria="Coctel";
            try {
            resultadoConsulta = conector.consulta("select * from Producto where categoria='"+categoria+"'");
            while (resultadoConsulta.next()) {
                JsonObject jsonObject = new JsonObject();
                jsonObject.addProperty("idProducto", resultadoConsulta.getString("idProducto"));
                jsonObject.addProperty("nombreProducto", resultadoConsulta.getString("nombreProducto"));
                jsonObject.addProperty("descripcionProducto", resultadoConsulta.getString("descripcionProducto"));
                jsonObject.addProperty("precioProducto", resultadoConsulta.getString("precioProducto"));
                jsonObject.addProperty("tipo", resultadoConsulta.getString("tipo"));
                jsonObject.addProperty("categoria", resultadoConsulta.getString("categoria"));


                jsonArray.add(jsonObject);
            }  
        String json =jsonArray.toString();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);    
        } catch (Exception e) {
                System.out.println("Error"+e);
        }
   }
    
    public void obtenerOrden(HttpServletRequest request, HttpServletResponse response) throws Exception {
    
    String orden=request.getParameter("orden");
    String empleado=request.getParameter("empleado");
    String operacion=request.getParameter("operacion");

    if(orden==null||empleado==null||operacion==null)
    {
        System.out.println("La informacion no llego de manera correcta");
    }
    else{
        if(operacion.equals("nueva"))
        {
            ResultSet resultado=conector.consulta("select MAX(idOrden) as valor from Orden;");
            int numeromaximo=0;
            int numeroOrden=0;
            while(resultado.next())
            {
                numeromaximo=resultado.getInt("valor");                
            }
            numeroOrden=numeromaximo+1;
            
            JsonParser jsonParser = new JsonParser();
            JsonArray jsonArray = (JsonArray) jsonParser.parse(orden);
            String json =jsonArray.toString();
            //System.out.println(json);
            int tamanioJson =jsonArray.size();
            String salida1=conector.registrar("insert into Orden (idOrden,noEmpleado,subtotal,total,estado)values("+numeroOrden+","+empleado+","+0+","+0+",\"abierta\");");
            System.out.println(salida1);
                for (int i = 1; i < tamanioJson; i++) {
                    if(i<tamanioJson-1)
                    {
                        //System.out.println(jsonArray.get(i).toString());
                        JsonObject objetoJson=(JsonObject) jsonArray.get(i);
                        //System.out.println(objetoJson.get(" ID ").toString());
                        //System.out.println(objetoJson.get(" ID ").getAsString());
                        //System.out.println(objetoJson.get("Producto").getAsString());
                        //System.out.println(objetoJson.get("cantidad").getAsString());
                        int idProducto=objetoJson.get(" ID ").getAsInt();
                        int cantidad=objetoJson.get("cantidad").getAsInt();
                        float precio=obtenerPrecio(idProducto);
                        float subtotal=precio*cantidad;
                        System.out.println("id "+idProducto+" precio "+precio+" sutotal "+subtotal );

                        //System.out.println(objetoJson);
                        
                        String salida=conector.registrar("insert into OrdenProducto (idOrden,idProducto,subtotal)values("+numeroOrden+","+idProducto+","+subtotal+")");
                        System.out.println(salida);
                    }

                }
        }


    }
        
    
   }
    
    
   public float obtenerPrecio(int id)
   {
       String idProducto=""+id;
       float precio=0;
        try {
            ResultSet resultado=conector.consulta("select precioProducto from Producto where idProducto="+idProducto+";");
            while(resultado.next())
            {
                precio=resultado.getFloat("precioProducto");
            }
            
        } catch (ClassNotFoundException ex) {
            System.out.println("No se puedo obtener el precio: "+ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return precio;
   }

}
