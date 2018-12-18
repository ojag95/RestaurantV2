/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import CodeHelpers.ConexionesDB;
import Interfaces.CRUDPlatillos;
import Modelo.Platillo;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PlatilloDAO implements CRUDPlatillos {

    ConexionesDB conector = new ConexionesDB();
    Platillo p=new Platillo();
    @Override
    public List listar() {
        ArrayList<Platillo> listaPlatillos = new ArrayList<>();
        ResultSet resultadoConsulta = null;
        try {
            resultadoConsulta = conector.consulta("select * from Platillos order by idPlatillo");
            while (resultadoConsulta.next()) {
                System.out.println("imprime");
                Platillo objetoPlatillo = new Platillo();
                objetoPlatillo.setIdPlatillo(resultadoConsulta.getInt("idPlatillo"));
                objetoPlatillo.setNombrePlatillo(resultadoConsulta.getString("nombrePlatillo"));
                objetoPlatillo.setDescripcionPlatillo(resultadoConsulta.getString("descripcion"));
                objetoPlatillo.setPrecioPlatillo(resultadoConsulta.getFloat("precioPlatillo"));
                listaPlatillos.add(objetoPlatillo);

            }

        } catch (Exception e) {

        }
        return listaPlatillos;
    }

    @Override
    public Platillo listar(int idPlatillo) {
        ArrayList<Platillo> listaPlatillos = new ArrayList<>();
        ResultSet resultadoConsulta = null;
        try {
            resultadoConsulta = conector.consulta("select * from Platillos where idPlatillo=" + idPlatillo);
            while (resultadoConsulta.next()) {
                p.setIdPlatillo(resultadoConsulta.getInt("idPlatillo"));
                p.setNombrePlatillo(resultadoConsulta.getString("nombrePlatillo"));
                p.setDescripcionPlatillo(resultadoConsulta.getString("descripcion"));
                p.setPrecioPlatillo(resultadoConsulta.getFloat("precioPlatillo"));

            }

        } catch (Exception e) {
        }
        return p;
    }

    public boolean Platillo(Platillo platillo) {

        try {
            System.out.println("agregar");
            System.out.println(platillo.getNombrePlatillo());
            String inser="insert into Platillos (nombrePlatillo, descripcion, precioPlatillo)values('" + platillo.getNombrePlatillo() + "','" + platillo.getDescripcionPlatillo() + "'," + platillo.getPrecioPlatillo() + ")";
            System.out.println(inser);
            conector.registrar(inser);
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean editar(Platillo platillo) {
       try {
            System.out.println("actualizar");
            String sql= "update Platillos set nombrePlatillo='"+ platillo.getNombrePlatillo()+"',descripcion='"+platillo.getDescripcionPlatillo()+"',precioPlatillo="+ platillo.getPrecioPlatillo() + " where idPlatillo=" + platillo.getIdPlatillo();
            conector.registrar(sql);
        } catch (Exception e) {

        }
        return false; 
    }

    @Override
    public boolean eliminar(int idPlatillo) {
        try {
            System.out.println("eliminar");
            conector.eliminar("delete from Platillos where idPlatillo="+ idPlatillo);
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    @Override
    public boolean agregar(Platillo platillo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
