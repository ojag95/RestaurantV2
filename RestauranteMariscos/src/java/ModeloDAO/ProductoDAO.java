/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import CodeHelpers.ConexionesDB;
import Interfaces.CRUDProductos;
import Modelo.Producto;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

}
