package modelo;

public class Reservacion {
    private int codigoReservacion;
    private String fechaEntrada;
    private String fechaSalida;
    private double costReservacion;
    private int ID;
    private int numHabitacion;
    private int acceso;

    public Reservacion() {
    }

    public Reservacion(int codigoReservacion, String fechaEntrada, String fechaSalida, double costReservacion, int ID, int numHabitacion, int acceso) {
        this.codigoReservacion = codigoReservacion;
        this.fechaEntrada = fechaEntrada;
        this.fechaSalida = fechaSalida;
        this.costReservacion = costReservacion;
        this.ID = ID;
        this.numHabitacion = numHabitacion;
        this.acceso = acceso;
    }

    public int getCodigoReservacion() {
        return codigoReservacion;
    }

    public void setCodigoReservacion(int codigoReservacion) {
        this.codigoReservacion = codigoReservacion;
    }

    public String getFechaEntrada() {
        return fechaEntrada;
    }

    public void setFechaEntrada(String fechaEntrada) {
        this.fechaEntrada = fechaEntrada;
    }

    public String getFechaSalida() {
        return fechaSalida;
    }

    public void setFechaSalida(String fechaSalida) {
        this.fechaSalida = fechaSalida;
    }

    public double getCostReservacion() {
        return costReservacion;
    }

    public void setCostReservacion(double costReservacion) {
        this.costReservacion = costReservacion;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getNumHabitacion() {
        return numHabitacion;
    }

    public void setNumHabitacion(int numHabitacion) {
        this.numHabitacion = numHabitacion;
    }

    public int getAcceso() {
        return acceso;
    }

    public void setAcceso(int acceso) {
        this.acceso = acceso;
    }

    
}
