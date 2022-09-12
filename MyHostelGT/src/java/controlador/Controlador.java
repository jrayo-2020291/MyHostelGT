package controlador;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Clasificacion;
import modelo.ClasificacionDAO;
import modelo.Cliente;
import modelo.ClienteDAO;
import modelo.Empleado;
import modelo.EmpleadoDAO;
import modelo.Habitacion;
import modelo.HabitacionDAO;
import modelo.Sucursal;
import modelo.SucursalDAO;
import modelo.MetodoDePago;
import modelo.MetodoDePagoDAO;
import modelo.Region;
import modelo.RegionDAO;
import modelo.Reservacion;
import modelo.ReservacionDAO;
import modelo.TipoCliente;
import modelo.TipoClienteDAO;
import modelo.TipoEmpleado;
import modelo.TipoEmpleadoDAO;
import modelo.Volumen;
import modelo.VolumenDAO;

/**
 *
 * @author Familia_Rayo
 */

public class Controlador extends HttpServlet {
    
    int codSucursal;
    int codE;
    
    Clasificacion clasificacion = new Clasificacion();
    ClasificacionDAO clasificacionDAO = new ClasificacionDAO();
    
    Cliente cliente = new Cliente();
    ClienteDAO clienteDAO = new ClienteDAO();
    
    Empleado empleado = new Empleado();
    EmpleadoDAO empleadoDAO = new EmpleadoDAO();
    
    Habitacion habitacion = new Habitacion();
    HabitacionDAO habitacionDAO = new HabitacionDAO();
    
    Sucursal sucursal = new Sucursal();
    SucursalDAO sucursalDAO = new SucursalDAO();
       
    MetodoDePago metodoDePago = new MetodoDePago();
    MetodoDePagoDAO metodoDePagoDAO = new MetodoDePagoDAO();
    
    Region region = new Region();
    RegionDAO regionDAO = new RegionDAO();
    
    Reservacion reservacion = new Reservacion();
    ReservacionDAO reservacionDAO = new ReservacionDAO();
    
    TipoCliente tipoCliente = new TipoCliente();
    TipoClienteDAO tipoClienteDAO = new TipoClienteDAO();
    
    TipoEmpleado tipoEmpleado = new TipoEmpleado();
    TipoEmpleadoDAO tipoEmpleadoDAO = new TipoEmpleadoDAO();
    
    Volumen volumen = new Volumen();
    VolumenDAO volumenDAO = new VolumenDAO();
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        
        if(menu.equals("Principal")){
            request.getRequestDispatcher("Principal.jsp").forward(request, response);
        }else if(menu.equals("Clasificacion")){
            switch(accion){
                case "Listar":
                    List listaClasificacion = clasificacionDAO.listar();
                    request.setAttribute("clasificacion", listaClasificacion);
                    break;
            }
            request.getRequestDispatcher("Clasificacion.jsp").forward(request, response);
        }else if(menu.equals("Cliente")){
            switch(accion){
                case "Listar":
                    List listaCliente = clienteDAO.listar();
                    request.setAttribute("cliente", listaCliente);
                    break;
            }
            request.getRequestDispatcher("Cliente.jsp").forward(request, response);
        }else if(menu.equals("Empleado")){
            switch(accion){
                case "Listar":
                    List listaEmpleado = empleadoDAO.listar();
                    request.setAttribute("empleados", listaEmpleado);
                    break;
                case "Agregar":
                    int accesoE = Integer.parseInt(request.getParameter("txtAcceso"));
                    String dpiE = request.getParameter("txtDpi");
                    String nombreE = request.getParameter("txtNombreEmpleado");
                    String apellidoE = request.getParameter("txtApellidoEmpleado");
                    String correoE = request.getParameter("txtCorreoEmpleado");
                    String telefonoE = request.getParameter("txtTelefono");
                    String usuarioE = request.getParameter("txtUsuario");
                    int tipoE = Integer.parseInt(request.getParameter("txtTipoEmpleado"));
                    empleado.setAcceso(accesoE);
                    empleado.setDpiEmpleado(dpiE);
                    empleado.setNombreEmpleado(nombreE);
                    empleado.setApellidoEmpleado(apellidoE);
                    empleado.setCorreoEmpleado(correoE);
                    empleado.setTelefono(telefonoE);
                    empleado.setUsuario(usuarioE);
                    empleado.setCodigotipoEmpleado(tipoE);
                    empleadoDAO.agregar(empleado);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    codE = Integer.parseInt(request.getParameter("accesoE"));
                    Empleado e = empleadoDAO.listarAcceso(codE);
                    request.setAttribute("empleado", e);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                    break;
                case"Actualizar":
                    
                    String dpiEmp = request.getParameter("txtDpi");
                    String nombreEmp = request.getParameter("txtNombreEmpleado");
                    String apellidoEmp = request.getParameter("txtApellidoEmpleado");
                    String correoEmp = request.getParameter("txtCorreoEmpleado");
                    String telefonoEmp = request.getParameter("txtTelefono");
                    String usuarioEmp = request.getParameter("txtUsuario");
                    int tipoEmp = Integer.parseInt(request.getParameter("txtTipoEmpleado"));
                    empleado.setDpiEmpleado(dpiEmp);
                    empleado.setNombreEmpleado(nombreEmp);
                    empleado.setApellidoEmpleado(apellidoEmp);
                    empleado.setCorreoEmpleado(correoEmp);
                    empleado.setTelefono(telefonoEmp);
                    empleado.setUsuario(usuarioEmp);
                    empleado.setCodigotipoEmpleado(tipoEmp);
                    empleado.setAcceso(codE);
                    empleadoDAO.actualizar(empleado);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                    break;
                case"Eliminar":
                    codE = Integer.parseInt(request.getParameter("accesoE"));
                    empleadoDAO.eliminar(codE);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("Empleado.jsp").forward(request, response);
        }else if(menu.equals("Habitacion")){
            switch(accion){
                case "Listar":
                    List listaHabitacion = habitacionDAO.listar();
                    request.setAttribute("habitacion", listaHabitacion);
                    break;
            }
            request.getRequestDispatcher("Habitacion.jsp").forward(request, response);
        }else if(menu.equals("Sucursal")){
            switch(accion){
                case "Listar":
                    List listaSucursales = sucursalDAO.listar();
                    request.setAttribute("sucursales", listaSucursales);
                    break;
                case "Agregar":
                    String descripcion = request.getParameter("txtDescripcion");
                    String puntuacion = request.getParameter("txtPuntuacion");
                    String direccion = request.getParameter("txtDireccion");
                    String SUregion = request.getParameter("txtRegion");
                    String SUvolumen = request.getParameter("txtVolumen");
                    sucursal.setDescripcion(descripcion);
                    sucursal.setPuntuacion(puntuacion);
                    sucursal.setDireccion(direccion);
                    sucursal.setCodigoRegion(SUregion);
                    sucursal.setCodigoVolumen(SUvolumen);
                    sucursalDAO.agregar(sucursal);
                    request.getRequestDispatcher("Controlador?menu=Sucursal&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    codSucursal = Integer.parseInt(request.getParameter("codigoSucursal"));
                    Sucursal s = sucursalDAO.listarCodigoSucursal(codSucursal);
                    request.setAttribute("sucursal", s);
                    request.getRequestDispatcher("Controlador?menu=Sucursal&accion=Listar").forward(request, response);
                    break;
                case"Actualizar":
                    String descripcionSuc = request.getParameter("txtDescripcion");
                    String puntuacionSuc = request.getParameter("txtPuntuacion");
                    String direccionSuc = request.getParameter("txtDireccion");
                    String SUregionSuc = request.getParameter("txtRegion");
                    String SUvolumenSuc = request.getParameter("txtVolumen");
                    sucursal.setDescripcion(descripcionSuc);
                    sucursal.setPuntuacion(puntuacionSuc);
                    sucursal.setDireccion(direccionSuc);
                    sucursal.setCodigoRegion(SUregionSuc);
                    sucursal.setCodigoVolumen(SUvolumenSuc);
                    sucursal.setCodigoSucursal(codSucursal);
                    sucursalDAO.actualizar(sucursal);
                    request.getRequestDispatcher("Controlador?menu=Sucursal&accion=Listar").forward(request, response);
                    break;
                case"Eliminar":
                    codSucursal = Integer.parseInt(request.getParameter("codigoSucursal"));
                    sucursalDAO.eliminar(codSucursal);
                    request.getRequestDispatcher("Controlador?menu=Sucursal&accion=Listar").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("Sucursal.jsp").forward(request, response);
        }else if(menu.equals("MetodoDePago")){
            switch(accion){
                case "Listar":
                    List listaMetodoDePago = metodoDePagoDAO.listar();
                    request.setAttribute("metodoDePago", listaMetodoDePago);
                    break;
            }
            request.getRequestDispatcher("MetodoDePago.jsp").forward(request, response);
        }else if(menu.equals("Region")){
            switch(accion){
                case "Listar":
                    List listaRegion = regionDAO.listar();
                    request.setAttribute("region", listaRegion);
                    break;
            }
            request.getRequestDispatcher("Region.jsp").forward(request, response);
        }else if(menu.equals("Reservacion")){
            switch(accion){
                case "Listar":
                    List listaReservacion = reservacionDAO.listar();
                    request.setAttribute("reservacion", listaReservacion);
                    break;
            }
            request.getRequestDispatcher("Reservacion.jsp").forward(request, response);
        }else if(menu.equals("TipoCliente")){
            switch(accion){
                case "Listar":
                    List listaTipoCliente = tipoClienteDAO.listar();
                    request.setAttribute("tipoCliente", listaTipoCliente);
                    break;
            }
            request.getRequestDispatcher("TipoCliente.jsp").forward(request, response);
        }else if(menu.equals("TipoEmpleado")){
            switch(accion){
                case "Listar":
                    List listaTipoEmpleado = tipoEmpleadoDAO.listar();
                    request.setAttribute("tipoEmpleado", listaTipoEmpleado);
                    break;
            }
            request.getRequestDispatcher("TipoEmpleado.jsp").forward(request, response);
        }else if(menu.equals("Volumen")){
            switch(accion){
                case "Listar":
                    List listaVolumen = volumenDAO.listar();
                    request.setAttribute("volumen", listaVolumen);
                    break;
            }
            request.getRequestDispatcher("Volumen.jsp").forward(request, response);
        }else if(menu.equals("Home")){
            request.getRequestDispatcher("Principal.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
