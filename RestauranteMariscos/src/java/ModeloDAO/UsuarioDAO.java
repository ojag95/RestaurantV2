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
            resultadoConsulta = conector.consulta("select * from Usuario where nivel=3 order by noEmpleado");
            while (resultadoConsulta.next()) {
                System.out.println("imprime");
                Usuario objetoUsuario = new Usuario();
                objetoUsuario.setnoEmpleado(resultadoConsulta.getInt("noEmpleado"));
                objetoUsuario.setUsuario(resultadoConsulta.getString("usuario"));
                objetoUsuario.setEdad(resultadoConsulta.getInt("edad"));
                objetoUsuario.setDomicilio(resultadoConsulta.getString("domicilio"));
                objetoUsuario.setContra(resultadoConsulta.getString("contra"));
                listaUsuarios.add(objetoUsuario);

            }

        } catch (Exception e) {

        }
        return listaUsuarios;
    }

    @Override
    public Usuario listar(int noEmpleado) {
        ArrayList<Usuario> listaUsuarios = new ArrayList<>();
        ResultSet resultadoConsulta = null;
        try {
            resultadoConsulta = conector.consulta("select * from Usuario where noEmpleado='" + noEmpleado + "'");
            while (resultadoConsulta.next()) {
                p.setnoEmpleado(resultadoConsulta.getInt("noEmpleado"));
                p.setUsuario(resultadoConsulta.getString("usuario"));
                p.setEdad(resultadoConsulta.getInt("edad"));
                p.setDomicilio(resultadoConsulta.getString("domicilio"));
                p.setContra(resultadoConsulta.getString("contra"));
            }

        } catch (Exception e) {
        }
        return p;
    }

    public boolean Usuario(Usuario usuario) {

        try {
            System.out.println("agregar");
            conector.registrar("insert into Usuario (usuario, edad, domicilio, contrasenia)values('" + usuario.getUsuario() + "'," + usuario.getEdad() + ",'" + usuario.getDomicilio() + "','" + usuario.getContra() + "')");
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean editar(Usuario usuario) {
        try {
            System.out.println("actualizar");
            String sql = "update Usuario set usuario='" + usuario.getUsuario() + "',edad=" + usuario.getEdad() + ",domicilio='" + usuario.getDomicilio() + "',contra='" + usuario.getContra() + "' where noEmpleado='" + usuario.getnoEmpleado() + "'";
            System.out.println(sql);
            conector.registrar(sql);
        } catch (Exception e) {

        }
        return false;
    }
}
