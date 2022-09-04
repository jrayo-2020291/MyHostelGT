package modelo;


public class Clasificacion {
    
    private int codigoClasificacion;
    private String categoria;

    public Clasificacion() {
    }

    public Clasificacion(int codigoClasificacion, String categoria) {
        this.codigoClasificacion = codigoClasificacion;
        this.categoria = categoria;
    }

    public int getCodigoClasificacion() {
        return codigoClasificacion;
    }

    public void setCodigoClasificacion(int codigoClasificacion) {
        this.codigoClasificacion = codigoClasificacion;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
    
}

