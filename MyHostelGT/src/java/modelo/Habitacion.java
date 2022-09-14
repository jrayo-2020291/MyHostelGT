package modelo;

public class Habitacion {
    private int numHabitacion;
    private String estado;
    private double saldoAPagar;
    private int codigoClasificacion;
    private int codigoSucursal;

    public Habitacion() {
    }

    public Habitacion(int numHabitacion, String estado, double saldoAPagar, int codigoClasificacion, int codigoSucursal) {
        this.numHabitacion = numHabitacion;
        this.estado = estado;
        this.saldoAPagar = saldoAPagar;
        this.codigoClasificacion = codigoClasificacion;
        this.codigoSucursal = codigoSucursal;
    }

    public int getNumHabitacion() {
        return numHabitacion;
    }

    public void setNumHabitacion(int numHabitacion) {
        this.numHabitacion = numHabitacion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public double getSaldoAPagar() {
        return saldoAPagar;
    }

    public void setSaldoAPagar(double saldoAPagar) {
        this.saldoAPagar = saldoAPagar;
    }

    public int getCodigoClasificacion() {
        return codigoClasificacion;
    }

    public void setCodigoClasificacion(int codigoClasificacion) {
        this.codigoClasificacion = codigoClasificacion;
    }

    public int getCodigoSucursal() {
        return codigoSucursal;
    }

    public void setCodigoSucursal(int codigoSucursal) {
        this.codigoSucursal = codigoSucursal;
    }

    
}
