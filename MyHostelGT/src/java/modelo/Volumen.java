package modelo;

public class Volumen {
    private int codigoVolumen;
    private String volumen;

    public Volumen() {
    }

    public Volumen(int codigoVolumen, String volumen) {
        this.codigoVolumen = codigoVolumen;
        this.volumen = volumen;
    }

    public int getCodigoVolumen() {
        return codigoVolumen;
    }

    public void setCodigoVolumen(int codigoVolumen) {
        this.codigoVolumen = codigoVolumen;
    }

    public String getVolumen() {
        return volumen;
    }

    public void setVolumen(String volumen) {
        this.volumen = volumen;
    }
}
