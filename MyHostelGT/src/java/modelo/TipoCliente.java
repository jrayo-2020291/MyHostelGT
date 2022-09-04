package modelo;

import java.util.List;

public class TipoCliente {
    
    private int codigoTipoCliente;
    private String descripcion;
    
    public TipoCliente(){
        
    }

    public TipoCliente(int codigoTipoCliente, String descripcion) {
        this.codigoTipoCliente = codigoTipoCliente;
        this.descripcion = descripcion;
    }

    public int getCodigoTipoCliente() {
        return codigoTipoCliente;
    }

    public void setCodigoTipoCliente(int codigoTipoCliente) {
        this.codigoTipoCliente = codigoTipoCliente;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    void add(List<TipoCliente> tipoCliente) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
}
