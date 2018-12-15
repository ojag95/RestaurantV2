/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author oscar
 */
public class Bebida {
    int idBebida;
    String nombreBebida;
    String descripcionBebida;
    Float precioBebida;
    String Tipo;
    
    public Bebida(){
    
    }
    
    public Bebida(int idBebida, String nombreBebida, String descripcionBebida, Float precioBebida, String Tipo) {
        this.idBebida = idBebida;
        this.nombreBebida = nombreBebida;
        this.descripcionBebida = descripcionBebida;
        this.precioBebida = precioBebida;
        this.Tipo = Tipo;
    }

    public int getIdBebida() {
        return idBebida;
    }

    public void setIdBebida(int idBebida) {
        this.idBebida = idBebida;
    }

    public String getNombreBebida() {
        return nombreBebida;
    }

    public void setNombreBebida(String nombreBebida) {
        this.nombreBebida = nombreBebida;
    }

    public String getDescripcionBebida() {
        return descripcionBebida;
    }

    public void setDescripcionBebida(String descripcionBebida) {
        this.descripcionBebida = descripcionBebida;
    }

    public Float getPrecioBebida() {
        return precioBebida;
    }

    public void setPrecioBebida(Float precioBebida) {
        this.precioBebida = precioBebida;
    }

    public String getTipo() {
    return Tipo;
    }

    public void setTipo(String Tipo) {
     this.Tipo = Tipo;
    }

 
}
