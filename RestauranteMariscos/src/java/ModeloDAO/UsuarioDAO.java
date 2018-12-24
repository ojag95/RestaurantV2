/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import CodeHelpers.ConexionesDB;
import Modelo.Usuario;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import Interfaces.CRUDUsuarios;

public class UsuarioDAO implements CRUDUsuarios {

    ConexionesDB conector = new ConexionesDB();
    Usuario p = new Usuario();

    @Override
    public List listar() {
        ArrayList<Usuario> listaUsuarios = new ArrayList<>();
        ResultSet resultadoConsulta = null;
        try {
            resultadoConsulta = conector.consulta("select * from Usuario order by puesto");
            while (resultadoConsulta.next()) {
                System.out.println("imprime");
                Usuario objetoUsuario = new Usuario();
                objetoUsuario.setUsuario(resultadoConsulta.getString("usuario"));
                objetoUsuario.setApellido(resultadoConsulta.getString("apellido"));
                objetoUsuario.setPuesto(resultadoConsulta.getString("puesto"));
                objetoUsuario.setEdad(resultadoConsulta.getInt("edad"));
                objetoUsuario.setDomicilio(resultadoConsulta.getString("domicilio"));
                objetoUsuario.setContrasenia(resultadoConsulta.getString("contrasenia"));
                listaUsuarios.add(objetoUsuario);

            }

        } catch (Exception e) {

        }
        return listaUsuarios;
    }

    @Override
    public Usuario listar(String usuario) {
        ArrayList<Usuario> listaUsuarios = new ArrayList<>();
        ResultSet resultadoConsulta = null;
        try {
            resultadoConsulta = conector.consulta("select * from Usuario where usuario='" + usuario+"'");
            while (resultadoConsulta.next()) {
                p.setUsuario(resultadoConsulta.getString("usuario"));
                p.setApellido(resultadoConsulta.getString("apellido"));
                p.setPuesto(resultadoConsulta.getString("puesto"));
                p.setEdad(resultadoConsulta.getInt("edad"));
                p.setDomicilio(resultadoConsulta.getString("domicilio"));
                p.setContrasenia(resultadoConsulta.getString("contrasenia"));
            }

        } catch (Exception e) {
        }
        return p;
    }

    public boolean Usuario(Usuario usuario) {

        try {
            System.out.println("agregar");
            conector.registrar("insert into Usuario (usuario, apellido, puesto, edad, domicilio, contrasenia)values('" + usuario.getUsuario() + "','" + usuario.getApellido() + "','" + usuario.getPuesto() + "'," + usuario.getEdad() + ",'" + usuario.getDomicilio() + "','" + usuario.getContrasenia() + "')");
        } catch (Exception e) {

        }
        return false;
    }

@Override
    public boolean editar(Usuario usuario) {
        try {
            System.out.println("actualizar");
            String sql = "update Usuario set apellido='" + usuario.getApellido() + "',puesto='" + usuario.getPuesto() + "',edad=" + usuario.getEdad() +",domicilio='" + usuario.getDomicilio() +"',contrasenia='" + usuario.getContrasenia() + "'where usuario='" + usuario.getUsuario()+"'";
            conector.registrar(sql);
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean eliminar(String usuario) {
        try {
            System.out.println("eliminar");
            conector.eliminar("delete from Usuario where usuario='"+usuario+"'");
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean agregar(Usuario usuario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
