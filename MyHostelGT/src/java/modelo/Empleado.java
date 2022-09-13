package modelo;

public class Empleado {
    
    private int acceso;
    private String dpiEmpleado;
    private String nombreEmpleado;
    private String apellidoEmpleado;
    private String correoEmpleado;
    private String telefono;
    private String usuario;
    private int codigotipoEmpleado;

    public Empleado() {
    }

    public Empleado(int acceso, String dpiEmpleado, String nombreEmpleado, String apellidoEmpleado, String correoEmpleado, String telefono, String usuario, int codigotipoEmpleado) {
        this.acceso = acceso;
        this.dpiEmpleado = dpiEmpleado;
        this.nombreEmpleado = nombreEmpleado;
        this.apellidoEmpleado = apellidoEmpleado;
        this.correoEmpleado = correoEmpleado;
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

    public String getDpiEmpleado() {
        return dpiEmpleado;
    }

    public void setDpiEmpleado(String dpiEmpleado) {
        this.dpiEmpleado = dpiEmpleado;
    }

    public String getNombreEmpleado() {
        return nombreEmpleado;
    }

    public void setNombreEmpleado(String nombreEmpleado) {
        this.nombreEmpleado = nombreEmpleado;
    }

    public String getApellidoEmpleado() {
        return apellidoEmpleado;
    }

    public void setApellidoEmpleado(String apellidoEmpleado) {
        this.apellidoEmpleado = apellidoEmpleado;
    }

    public String getCorreoEmpleado() {
        return correoEmpleado;
    }

    public void setCorreoEmpleado(String correoEmpleado) {
        this.correoEmpleado = correoEmpleado;
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
