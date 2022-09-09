package modelo;

public class Sucursal {
    private int codigoSucursal;
    private String descripcion;
    private String puntuacion;
    private String direccion;
    private String codigoRegion;
    private String codigoVolumen;

    public Sucursal() {
        
    }

    public Sucursal(int codigoSucursal, String descripcion, String puntuacion, String direccion, String codigoRegion, String codigoVolumen) {
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

    public String getPuntuacion() {
        return puntuacion;
    }

    public void setPuntuacion(String puntuacion) {
        this.puntuacion = puntuacion;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCodigoRegion() {
        return codigoRegion;
    }

    public void setCodigoRegion(String codigoRegion) {
        this.codigoRegion = codigoRegion;
    }

    public String getCodigoVolumen() {
        return codigoVolumen;
    }

    public void setCodigoVolumen(String codigoVolumen) {
        this.codigoVolumen = codigoVolumen;
    }
}

    