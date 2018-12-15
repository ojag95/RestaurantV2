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
public class Usuario {

    int idUsuario;
    String nombre;
    String puesto;
    int edad;
    String domicilio;
    String usr;
    String contrasenia;

    public Usuario() {

    }

    public Usuario(int idUsuario, String nombre, String puesto, int edad, String domicilio, String usr, String contrasenia) {
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.puesto = puesto;
        this.edad = edad;
        this.domicilio = domicilio;
        this.usr = usr;
        this.contrasenia = contrasenia;

    }

    public void setedad(int edad) {
        this.edad = edad;
    }

    public void setnombre(String nombre) {
        this.nombre = nombre;
    }

    public void setpuesto(String puesto) {
        this.puesto = puesto;
    }

    public void setdomicilio(String domicilio) {
        this.domicilio = domicilio;
    }

    public void setusr(String usr) {
        this.usr = usr;
    }

    public void setcontrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public void setidUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getnombre() {
        return nombre;
    }

    public String getpuesto() {
        return puesto;
    }

    public int getedad() {
        return edad;
    }

    public String getdomicilio() {
        return domicilio;
    }

    public String getusr() {
        return usr;
    }

    public String getcontrasenia() {
        return contrasenia;
    }

    public int getidUsuario() {
        return idUsuario;
    }

}
