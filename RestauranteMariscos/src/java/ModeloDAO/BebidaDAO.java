/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import CodeHelpers.ConexionesDB;
import Interfaces.CRUDBebidas;
import Modelo.Bebida;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BebidaDAO implements CRUDBebidas {

    ConexionesDB conector = new ConexionesDB();
    Bebida p=new Bebida();
    @Override
    public List listar() {
        ArrayList<Bebida> listaBebidas = new ArrayList<>();
        ResultSet resultadoConsulta = null;
        try {
            resultadoConsulta = conector.consulta("select * from Bebida");
            while (resultadoConsulta.next()) {
                System.out.println("imprime");
                Bebida objetoBebida = new Bebida();
                objetoBebida.setIdBebida(resultadoConsulta.getInt("idBebida"));
                objetoBebida.setNombreBebida(resultadoConsulta.getString("nombreBebida"));
                objetoBebida.setDescripcionBebida(resultadoConsulta.getString("descripcion"));
                objetoBebida.setPrecioBebida(resultadoConsulta.getFloat("precioBebida"));
                objetoBebida.setTipo(resultadoConsulta.getString("Tipo"));
                listaBebidas.add(objetoBebida);

            }

        } catch (Exception e) {

        }
        return listaBebidas;
    }


    @Override
    public Bebida listar(int idBebida) {
        ArrayList<Bebida> listaBebida = new ArrayList<>();
        ResultSet resultadoConsulta = null;
        try {
            resultadoConsulta = conector.consulta("select * from Bebida where idBebida=" + idBebida);
            while (resultadoConsulta.next()) {
                p.setIdBebida(resultadoConsulta.getInt("idBebida"));
                p.setNombreBebida(resultadoConsulta.getString("nombreBebida"));
                p.setDescripcionBebida(resultadoConsulta.getString("descripcion"));
                p.setPrecioBebida(resultadoConsulta.getFloat("precioBebida"));
                p.setTipo(resultadoConsulta.getString("Tipo"));
            }

        } catch (Exception e) {
        }
        return p;
    }

    public boolean Bebida(Bebida bebida) {

        try {
            System.out.println("agregar");
            conector.registrar("insert into Bebida (nombreBebida, descripcion, precioBebida, Tipo)values('" + bebida.getNombreBebida() + "','" + bebida.getDescripcionBebida() + "','" + bebida.getPrecioBebida() + "','" + bebida.getTipo() +"');");
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean editar(Bebida bebida) {
        try {
            System.out.println("actualizar");
            String sql = "update Bebida set nombreBebida='" + bebida.getNombreBebida() + "',descripcion='" + bebida.getDescripcionBebida() + "',precioBebida='" + bebida.getPrecioBebida() + "',Tipo='" + bebida.getTipo() + "'where idBebida=" + bebida.getIdBebida();
            conector.registrar(sql);
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean eliminar(int idBebida) {
        try {
            System.out.println("eliminar");
            conector.eliminar("delete from Bebida where idBebida=" + idBebida);
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean agregar(Bebida bebida) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
