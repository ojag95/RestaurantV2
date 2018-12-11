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
public class PlatilloDAO implements CRUDPlatillos{
    ConexionesDB conector = new ConexionesDB();
    @Override
    public List listar() {
        ArrayList<Platillo>listaPlatillos = new ArrayList<>();
        ResultSet resultadoConsulta=null;
        try{
            resultadoConsulta= conector.consulta("select * from Platillos;");
            while(resultadoConsulta.next())
            {
                Platillo objetoPlatillo = new Platillo();
                objetoPlatillo.setIdPlatillo(resultadoConsulta.getInt("idPlatillo"));
                objetoPlatillo.setNombrePlatillo(resultadoConsulta.getString("nombrePlatillo"));
                objetoPlatillo.setDescripcionPlatillo(resultadoConsulta.getString("descripcion"));
                objetoPlatillo.setPrecioPlatillo(resultadoConsulta.getFloat("precioPlatillo"));
                listaPlatillos.add(objetoPlatillo);
                
            }
        
        }catch(Exception e)
        {
            
        }
        return listaPlatillos;
    }

    @Override
    public Platillo listar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean agregar(Platillo platillo) {
        try{
            System.out.println("Agregar");
            conector.registrar("call registroPlatillo('" + platillo.getNombrePlatillo() + "','" + platillo.getDescripcionPlatillo() + "'," + platillo.getPrecioPlatillo() + ");");
        }catch(Exception e)
        {
        
        }
        return false;
    }

    @Override
    public boolean editar(Platillo platillo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
