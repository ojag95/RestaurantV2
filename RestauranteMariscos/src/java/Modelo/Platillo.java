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
public class Platillo {
    int idPlatillo;
    String nombrePlatillo;
    String descripcionPlatillo;
    Float precioPlatillo;
    
    public Platillo(){
    
    }
    
    public Platillo(int idPlatillo, String nombrePlatillo, String descripcionPlatillo, Float precioPlatillo) {
        this.idPlatillo = idPlatillo;
        this.nombrePlatillo = nombrePlatillo;
        this.descripcionPlatillo = descripcionPlatillo;
        this.precioPlatillo = precioPlatillo;
    }

    public int getIdPlatillo() {
        return idPlatillo;
    }

    public void setIdPlatillo(int idPlatillo) {
        this.idPlatillo = idPlatillo;
    }

    public String getNombrePlatillo() {
        return nombrePlatillo;
    }

    public void setNombrePlatillo(String nombrePlatillo) {
        this.nombrePlatillo = nombrePlatillo;
    }

    public String getDescripcionPlatillo() {
        return descripcionPlatillo;
    }

    public void setDescripcionPlatillo(String descripcionPlatillo) {
        this.descripcionPlatillo = descripcionPlatillo;
    }

    public Float getPrecioPlatillo() {
        return precioPlatillo;
    }

    public void setPrecioPlatillo(Float precioPlatillo) {
        this.precioPlatillo = precioPlatillo;
    }
    
}
