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
            resultadoConsulta = conector.consulta("select * from Usuario order by idUsuario");
            while (resultadoConsulta.next()) {
                System.out.println("imprime");
                Usuario objetoUsuario = new Usuario();
                objetoUsuario.setidUsuario(resultadoConsulta.getInt("idUsuario"));
                objetoUsuario.setnombre(resultadoConsulta.getString("nombre"));
                objetoUsuario.setpuesto(resultadoConsulta.getString("puesto"));
                objetoUsuario.setedad(resultadoConsulta.getInt("edad"));
                objetoUsuario.setdomicilio(resultadoConsulta.getString("domicilio"));
                objetoUsuario.setusr(resultadoConsulta.getString("usr"));
                objetoUsuario.setcontrasenia(resultadoConsulta.getString("contrasenia"));
                listaUsuarios.add(objetoUsuario);

            }

        } catch (Exception e) {

        }
        return listaUsuarios;
    }

    @Override
    public Usuario listar(int idUsuario) {
        ArrayList<Usuario> listaUsuarios = new ArrayList<>();
        ResultSet resultadoConsulta = null;
        try {
            resultadoConsulta = conector.consulta("select * from Usuario where idUsuario=" + idUsuario);
            while (resultadoConsulta.next()) {
                p.setidUsuario(resultadoConsulta.getInt("idUsuario"));
                p.setnombre(resultadoConsulta.getString("nombre"));
                p.setpuesto(resultadoConsulta.getString("puesto"));
                p.setedad(resultadoConsulta.getInt("edad"));
                p.setdomicilio(resultadoConsulta.getString("domicilio"));
                p.setusr(resultadoConsulta.getString("usr"));
                p.setcontrasenia(resultadoConsulta.getString("contrasenia"));
            }

        } catch (Exception e) {
        }
        return p;
    }

    public boolean Usuario(Usuario usuario) {

        try {
            System.out.println("agregar");
            conector.registrar("insert into Usuario (nombre, puesto, edad, domicilio, usr, contrasenia)values('" + usuario.getnombre() + "','" + usuario.getpuesto() + "'," + usuario.getedad() + ",'" + usuario.getdomicilio() + "','" + usuario.getusr() + "','" + usuario.getcontrasenia() + "')");
        } catch (Exception e) {

        }
        return false;
    }

@Override
    public boolean editar(Usuario usuario) {
        try {
            System.out.println("actualizar");
            String sql = "update Usuario set nombre='" + usuario.getnombre() + "',puesto='" + usuario.getpuesto() + "',edad='" + usuario.getedad() +"',domicilio='" + usuario.getdomicilio() +"',usr='" + usuario.getusr() +"',contrasenia='" + usuario.getcontrasenia() + "'where idUsuario=" + usuario.getidUsuario();
            conector.registrar(sql);
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean eliminar(int idUsuario) {
        try {
            System.out.println("eliminar");
            conector.eliminar("delete from Usuario where idUsuario=" + idUsuario);
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean agregar(Usuario usuario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
