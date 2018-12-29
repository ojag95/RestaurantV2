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
    int noEmpleado;
    String usuario;
    String domicilio;
    String contra;
    int edad;
    public Usuario() {

    }

    public Usuario(int noEmpleado, String usuario,  int edad, String domicilio, String contrasenia) {
        this.noEmpleado=noEmpleado;
        this.usuario = usuario;
        this.edad=edad;
        this.domicilio = domicilio;
        this.contra = contra;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getDomicilio() {
        return domicilio;
    }

    public void setDomicilio(String domicilio) {
        this.domicilio = domicilio;
    }

    public String getContra() {
        return contra;
    }

    public void setContra (String contra) {
        this.contra = contra;
    }

    public int getnoEmpleado() {
        return noEmpleado;
    }
    
    public void setnoEmpleado(int noEmpleado){
        this.noEmpleado=noEmpleado;
    }
    
      public int getEdad() {
        return edad;
    }
    
    public void setEdad(int edad){
        this.edad=edad;
    }

    

}
