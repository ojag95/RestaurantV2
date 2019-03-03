/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Modelo.Producto;
import java.util.List;
public interface CRUDProductos {
    public List listar();
    public Producto listar (int idProducto);
    public boolean agregar(Producto producto);
    public boolean editar(Producto producto);
    public boolean eliminar (int idProducto);
    
}
