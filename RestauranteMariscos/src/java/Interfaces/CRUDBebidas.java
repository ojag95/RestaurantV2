/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Modelo.Bebida;
import java.util.List;
public interface CRUDBebidas {
    public List listar();
    public Bebida listar (int idBebida);
    public boolean agregar(Bebida bebida);
    public boolean editar(Bebida bebida);
    public boolean eliminar (int idBebida);

    
}
