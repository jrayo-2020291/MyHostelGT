package modelo;

public class Habitacion {
    private int numHabitacion;
    private String estado;
    private int codigoClasificacion;
    private int codigoHotel;

    public Habitacion() {
    }

    public Habitacion(int numHabitacion, String estado, int codigoClasificacion, int codigoHotel) {
        this.numHabitacion = numHabitacion;
        this.estado = estado;
        this.codigoClasificacion = codigoClasificacion;
        this.codigoHotel = codigoHotel;
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

    public int getCodigoClasificacion() {
        return codigoClasificacion;
    }

    public void setCodigoClasificacion(int codigoClasificacion) {
        this.codigoClasificacion = codigoClasificacion;
    }

    public int getCodigoHotel() {
        return codigoHotel;
    }

    public void setCodigoHotel(int codigoHotel) {
        this.codigoHotel = codigoHotel;
    }
    
    
}
