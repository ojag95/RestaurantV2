/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Modelo.Platillo;
import java.util.List;
public interface CRUDPlatillos {
    public List listar();
    public Platillo listar (int id);
    public boolean agregar(Platillo platillo);
    public boolean editar(Platillo platillo);
    public boolean eliminar (int id);

    
}
