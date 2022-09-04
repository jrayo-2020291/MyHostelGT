/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Grupo 3
 */
public class Cliente {
    private int ID;
    private String nombreCliente;
    private String telefono;
    private int codigoMetodoPago;
    private int codigoTipoCliente;

    public Cliente() {
    }

    public Cliente(int ID, String nombreCliente, String telefono, int codigoMetodoPago, int codigoTipoCliente) {
        this.ID = ID;
        this.nombreCliente = nombreCliente;
        this.telefono = telefono;
        this.codigoMetodoPago = codigoMetodoPago;
        this.codigoTipoCliente = codigoTipoCliente;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public int getCodigoMetodoPago() {
        return codigoMetodoPago;
    }

    public void setCodigoMetodoPago(int codigoMetodoPago) {
        this.codigoMetodoPago = codigoMetodoPago;
    }

    public int getCodigoTipoCliente() {
        return codigoTipoCliente;
    }

    public void setCodigoTipoCliente(int codigoTipoCliente) {
        this.codigoTipoCliente = codigoTipoCliente;
    }
    
    
}
