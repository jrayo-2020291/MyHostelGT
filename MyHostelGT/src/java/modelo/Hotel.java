package modelo;

public class Hotel {
    private int codigoHotel;
    private String nombreHotel;
    private String puntuacion;
    private String codigoRegion;
    private String codigoVolumen;

    public Hotel() {
    }

    public Hotel(int codigoHotel, String nombreHotel, String puntuacion, String codigoRegion, String codigoVolumen) {
        this.codigoHotel = codigoHotel;
        this.nombreHotel = nombreHotel;
        this.puntuacion = puntuacion;
        this.codigoRegion = codigoRegion;
        this.codigoVolumen = codigoVolumen;
    }

    public int getCodigoHotel() {
        return codigoHotel;
    }

    public void setCodigoHotel(int codigoHotel) {
        this.codigoHotel = codigoHotel;
    }

    public String getNombreHotel() {
        return nombreHotel;
    }

    public void setNombreHotel(String nombreHotel) {
        this.nombreHotel = nombreHotel;
    }

    public String getPuntuacion() {
        return puntuacion;
    }

    public void setPuntuacion(String puntuacion) {
        this.puntuacion = puntuacion;
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
