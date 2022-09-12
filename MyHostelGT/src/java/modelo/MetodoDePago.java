package modelo;

public class MetodoDePago {
    private int codigoMetodoPago;
    private String descripcion;

    public MetodoDePago() {
    }

    public MetodoDePago(int codigoMetodoPago, String descripcion) {
        this.codigoMetodoPago = codigoMetodoPago;
        this.descripcion = descripcion;
    }

    public int getCodigoMetodoPago() {
        return codigoMetodoPago;
    }

    public void setCodigoMetodoPago(int codigoMetodoPago) {
        this.codigoMetodoPago = codigoMetodoPago;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    
}
