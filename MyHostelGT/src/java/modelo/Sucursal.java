package modelo;

public class Sucursal {
    private int codigoSucursal;
    private String descripcion;
    private int puntuacion;
    private String direccion;
    private int codigoRegion;
    private int codigoVolumen;

    public Sucursal() {
        
    }

    public Sucursal(int codigoSucursal, String descripcion, int puntuacion, String direccion, int codigoRegion, int codigoVolumen) {
        this.codigoSucursal = codigoSucursal;
        this.descripcion = descripcion;
        this.puntuacion = puntuacion;
        this.direccion = direccion;
        this.codigoRegion = codigoRegion;
        this.codigoVolumen = codigoVolumen;
    }

    public int getCodigoSucursal() {
        return codigoSucursal;
    }

    public void setCodigoSucursal(int codigoSucursal) {
        this.codigoSucursal = codigoSucursal;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getPuntuacion() {
        return puntuacion;
    }

    public void setPuntuacion(int puntuacion) {
        this.puntuacion = puntuacion;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getCodigoRegion() {
        return codigoRegion;
    }

    public void setCodigoRegion(int codigoRegion) {
        this.codigoRegion = codigoRegion;
    }

    public int getCodigoVolumen() {
        return codigoVolumen;
    }

    public void setCodigoVolumen(int codigoVolumen) {
        this.codigoVolumen = codigoVolumen;
    }

    
}

    