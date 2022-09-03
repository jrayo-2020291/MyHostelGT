package modelo;

public class Empleado {
    
    private int acceso;
    private String nombreEmpleado;
    private String telefono;
    private String usuario;
    private int codigotipoEmpleado;

    public Empleado() {
    }

    public Empleado(int acceso, String nombreEmpleado, String telefono, String usuario, int codigotipoEmpleado) {
        this.acceso = acceso;
        this.nombreEmpleado = nombreEmpleado;
        this.telefono = telefono;
        this.usuario = usuario;
        this.codigotipoEmpleado = codigotipoEmpleado;
    }

    public int getAcceso() {
        return acceso;
    }

    public void setAcceso(int acceso) {
        this.acceso = acceso;
    }

    public String getNombreEmpleado() {
        return nombreEmpleado;
    }

    public void setNombreEmpleado(String nombreEmpleado) {
        this.nombreEmpleado = nombreEmpleado;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public int getCodigotipoEmpleado() {
        return codigotipoEmpleado;
    }

    public void setCodigotipoEmpleado(int codigotipoEmpleado) {
        this.codigotipoEmpleado = codigotipoEmpleado;
    }
    
}
