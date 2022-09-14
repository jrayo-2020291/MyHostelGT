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
    int idCliente;
    int codTipoCliente;
    int codE;
    int codMetoPa;
    int codReservacion;
    int codTipoEmpleado;
    int nHabitacion;

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
    int codVolumen;
    int codRegion;
    int codClasificacion;
    
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
                case "Agregar":
                    String categoria = request.getParameter("txtCategoria");
                    clasificacion.setCategoria(categoria);
                    clasificacionDAO.agregar(clasificacion);
                    request.getRequestDispatcher("Controlador?menu=Clasificacion&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    codClasificacion = Integer.parseInt(request.getParameter("codigoClasificacion"));
                    Clasificacion c = clasificacionDAO.listarCodigoClasificacion(codClasificacion);
                    request.setAttribute("Clasificacion", c);
                    request.getRequestDispatcher("Controlador?menu=Clasificacion&accion=Listar").forward(request, response);
                    break;
                case"Actualizar":
                    String categoriaClas = request.getParameter("txtCategoria");
                    clasificacion.setCategoria(categoriaClas);
                    clasificacion.setCodigoClasificacion(codClasificacion);
                    clasificacionDAO.actualizar(clasificacion);
                    request.getRequestDispatcher("Controlador?menu=Clasificacion&accion=Listar").forward(request, response);
                    break;
                case"Eliminar":
                    codClasificacion = Integer.parseInt(request.getParameter("codigoClasificacion"));
                    clasificacionDAO.eliminar(codClasificacion);
                    request.getRequestDispatcher("Controlador?menu=Clasificacion&accion=Listar").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("Clasificacion.jsp").forward(request, response);
        }else if(menu.equals("Cliente")){
            switch(accion){
                case "Listar":
                    List listaCliente = clienteDAO.listar();
                    request.setAttribute("clientes", listaCliente);
                    break;
                    case "Agregar":
                    String clNombre = request.getParameter("txtNombreClientes");
                    String clApellido = request.getParameter("txtApellidoClientes");
                    String clTelefono = request.getParameter("txtTelefono");
                    String clDPI = request.getParameter("txtDPI");
                    String clDireccion = request.getParameter("txtDireccion");
                    String clCorreo = request.getParameter("txtCorreo");
                    int clMetodoPago = Integer.parseInt(request.getParameter("txtMetodoDePago")) ;
                    int clTipoCliente = Integer.parseInt(request.getParameter("txtTipoDeCliente")) ;
                    cliente.setNombreCliente(clNombre);
                    cliente.setApellidoCliente(clApellido);
                    cliente.setTelefono(clTelefono);
                    cliente.setDPI(clDPI);
                    cliente.setDireccion(clDireccion);
                    cliente.setCorreo(clCorreo);
                    cliente.setCodigoMetodoPago(clMetodoPago);
                    cliente.setCodigoTipoCliente(clTipoCliente);
                    clienteDAO.agregar(cliente);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    idCliente = Integer.parseInt(request.getParameter("ID"));
                    Cliente c = clienteDAO.listarIDCliente(idCliente);
                    request.setAttribute("cliente", c);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    String nombCl = request.getParameter("txtNombreClientes");
                    String apeCL = request.getParameter("txtApellidoClientes");
                    String telCl = request.getParameter("txtTelefono");
                    String dpiCl = request.getParameter("txtDPI");
                    String direcCl = request.getParameter("txtDireccion");
                    String correoCl = request.getParameter("txtCorreo");
                    int metodoPagoCl = Integer.parseInt(request.getParameter("txtMetodoDePago")) ;
                    int tipoClienteCl = Integer.parseInt(request.getParameter("txtTipoDeCliente")) ;
                    cliente.setNombreCliente(nombCl);
                    cliente.setApellidoCliente(apeCL);
                    cliente.setTelefono(telCl);
                    cliente.setDPI(dpiCl);
                    cliente.setDireccion(direcCl);
                    cliente.setCorreo(correoCl);
                    cliente.setCodigoMetodoPago(metodoPagoCl);
                    cliente.setCodigoTipoCliente(tipoClienteCl);
                    cliente.setID(idCliente);
                    clienteDAO.actualizar(cliente);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    idCliente = Integer.parseInt(request.getParameter("ID"));
                    clienteDAO.eliminar(idCliente);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
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
                case "Agregar":
                    String est = request.getParameter("txtEstado");
                    double saldoPagar = Double.parseDouble(request.getParameter("txtSaldoAPagar"));
                    int codiClasificacion = Integer.parseInt(request.getParameter("txtCodigoClasificacion"));
                    int codiSucursal = Integer.parseInt(request.getParameter("txtCodigoSucursal"));
                    habitacion.setEstado(est);
                    habitacion.setSaldoAPagar(saldoPagar);
                    habitacion.setCodigoClasificacion(codiClasificacion);
                    habitacion.setCodigoSucursal(codiSucursal);
                    habitacionDAO.agregar(habitacion);
                    request.getRequestDispatcher("Controlador?menu=Habitacion&accion=Listar").forward(request, response);
                    break;

                case "Editar":
                    nHabitacion = Integer.parseInt(request.getParameter("numHabitacion"));
                    Habitacion hb = habitacionDAO.listarCodigoHabitacion(nHabitacion);
                    request.setAttribute("Habitacion", hb);
                    request.getRequestDispatcher("Controlador?menu=Habitacion&accion=Listar").forward(request, response);
                    break;
                    
                case "Actualizar":
                    est = request.getParameter("txtEstado");
                    saldoPagar = Double.parseDouble(request.getParameter("txtSaldoAPagar"));
                    codiClasificacion = Integer.parseInt(request.getParameter("txtCodigoClasificacion"));
                    codiSucursal = Integer.parseInt(request.getParameter("txtCodigoSucursal"));
                    habitacion.setEstado(est);
                    habitacion.setSaldoAPagar(saldoPagar);
                    habitacion.setCodigoClasificacion(codiClasificacion);
                    habitacion.setCodigoSucursal(codiSucursal);
                    habitacion.setNumHabitacion(nHabitacion);
                    habitacionDAO.actualizar(habitacion);
                    request.getRequestDispatcher("Controlador?menu=Habitacion&accion=Listar").forward(request, response);
                    break;
                    
                case "Eliminar":
                    nHabitacion = Integer.parseInt(request.getParameter("numHabitacion"));
                    habitacionDAO.eliminar(nHabitacion);
                    request.getRequestDispatcher("Controlador?menu=Habitacion&accion=Listar").forward(request, response);
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
                    int puntuacion = Integer.parseInt(request.getParameter("txtPuntuacion"));
                    String direccion = request.getParameter("txtDireccion");
                    int SUregion = Integer.parseInt(request.getParameter("txtRegion"));
                    int SUvolumen = Integer.parseInt(request.getParameter("txtVolumen"));
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
                    int puntuacionSuc = Integer.parseInt(request.getParameter("txtPuntuacion"));
                    String direccionSuc = request.getParameter("txtDireccion");
                    int SUregionSuc = Integer.parseInt(request.getParameter("txtRegion"));
                    int SUvolumenSuc = Integer.parseInt(request.getParameter("txtVolumen"));
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
                case "Agregar":
                    String descripcion = request.getParameter("txtDescripcion");
                    metodoDePago.setDescripcion(descripcion);
                    metodoDePagoDAO.agregar(metodoDePago);
                    request.getRequestDispatcher("Controlador?menu=MetodoDePago&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    codMetoPa = Integer.parseInt(request.getParameter("codigoMetodoPago"));
                    MetodoDePago mdp = metodoDePagoDAO.listarCodigoMetodoPago(codMetoPa);
                    request.setAttribute("MetodoDePago", mdp);/*La palabra que estaba adentro la tenia minuscula al principio despues la cambie a minuscula*/
                    request.getRequestDispatcher("Controlador?menu=MetodoDePago&accion=Listar").forward(request, response);
                    break;
                case"Actualizar":
                    String descripcionMePago = request.getParameter("txtDescripcion");
                    metodoDePago.setDescripcion(descripcionMePago);
                    metodoDePago.setCodigoMetodoPago(codMetoPa);
                    metodoDePagoDAO.actualizar(metodoDePago);
                    request.getRequestDispatcher("Controlador?menu=MetodoDePago&accion=Listar").forward(request, response);
                    break;
                case"Eliminar":
                    codMetoPa = Integer.parseInt(request.getParameter("codigoMetodoPago"));
                    metodoDePagoDAO.eliminar(codMetoPa);
                    request.getRequestDispatcher("Controlador?menu=MetodoDePago&accion=Listar").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("MetodoDePago.jsp").forward(request, response);
        }else if(menu.equals("Region")){
            switch(accion){
                case "Listar":
                    List listaRegion = regionDAO.listar();
                    request.setAttribute("regiones", listaRegion);
                    break;
                case "Agregar":
                    String regi = request.getParameter("txtRegion");
                    region.setRegion(regi);
                    regionDAO.agregar(region);
                    request.getRequestDispatcher("Controlador?menu=Region&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    codRegion = Integer.parseInt(request.getParameter("codigoRegion"));
                    Region rg = regionDAO.listarCodigoRegion(codRegion);
                    request.setAttribute("region", rg);
                    request.getRequestDispatcher("Controlador?menu=Region&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    String regiRegion = request.getParameter("txtRegion");
                    region.setRegion(regiRegion);
                    region.setCodigoRegion(codRegion);
                    regionDAO.actualizar(region);
                    request.getRequestDispatcher("Controlador?menu=Region&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    codRegion = Integer.parseInt(request.getParameter("codigoRegion"));
                    regionDAO.eliminar(codRegion);
                    request.getRequestDispatcher("Controlador?menu=Region&accion=Listar").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("Region.jsp").forward(request, response);
        }else if(menu.equals("Reservacion")){
            switch(accion){
                case "Listar":
                    List listaReservacion = reservacionDAO.listar();
                    request.setAttribute("reservacion", listaReservacion);
                    List listaCliente = clienteDAO.listar();
                    request.setAttribute("clientes", listaCliente);
                    List listaEmpleado = empleadoDAO.listar();
                    request.setAttribute("empleados", listaEmpleado);
                    List listaHabitacion = habitacionDAO.listar();
                    request.setAttribute("habitacion", listaHabitacion);
                    break;
                    case "Agregar":
                    String FeEntrada = request.getParameter("txtFechaEntrada");
                    String FeSalida = request.getParameter("txtFechaSalida");
                    double costReservacion =  Double.parseDouble(request.getParameter("txtCostReservacion"));
                    int ID = Integer.parseInt(request.getParameter("txtID"));
                    int numHabitacion = Integer.parseInt(request.getParameter("txtNumHabitacion"));
                    int acceso = Integer.parseInt(request.getParameter("txtAcceso"));
                    reservacion.setFechaEntrada(FeEntrada);
                    reservacion.setFechaSalida(FeSalida);
                    reservacion.setCostReservacion(costReservacion);
                    reservacion.setID(ID);
                    reservacion.setNumHabitacion(numHabitacion);
                    reservacion.setAcceso(acceso);
                    reservacionDAO.agregar(reservacion);
                    request.getRequestDispatcher("Controlador?menu=Reservacion&accion=Listar").forward(request, response);
                    break;
                    
                case "Editar":
                    codReservacion = Integer.parseInt(request.getParameter("codigoReservacion"));
                    Reservacion re = reservacionDAO.listarCodigoReservacion(codReservacion);
                    request.setAttribute("Reservacion", re);
                    request.getRequestDispatcher("Controlador?menu=Reservacion&accion=Listar").forward(request, response);
                    break;
                    
                case "Actualizar":
                    String FeEnt = request.getParameter("txtFechaEntrada");
                    String FeSa = request.getParameter("txtFechaSalida");
                    costReservacion =  Double.parseDouble(request.getParameter("txtCostReservacion"));
                    ID = Integer.parseInt(request.getParameter("txtID"));
                    numHabitacion = Integer.parseInt(request.getParameter("txtNumHabitacion"));
                    acceso = Integer.parseInt(request.getParameter("txtAcceso"));
                    reservacion.setFechaEntrada(FeEnt);
                    reservacion.setFechaSalida(FeSa);
                    reservacion.setCostReservacion(costReservacion);
                    reservacion.setID(ID);
                    reservacion.setNumHabitacion(numHabitacion);
                    reservacion.setAcceso(acceso);
                    reservacion.setCodigoReservacion(codReservacion);
                    reservacionDAO.actualizar(reservacion);
                    request.getRequestDispatcher("Controlador?menu=Reservacion&accion=Listar").forward(request, response);
                    break;
                    
                case "Eliminar":
                    codReservacion = Integer.parseInt(request.getParameter("codigoReservacion"));
                    reservacionDAO.eliminar(codReservacion);
                    request.getRequestDispatcher("Controlador?menu=Reservacion&accion=Listar").forward(request, response);
                    break;
                    
            }
            request.getRequestDispatcher("Reservacion.jsp").forward(request, response);
        }else if(menu.equals("TipoCliente")){
            switch(accion){
                case "Listar":
                    List listaTipoCliente = tipoClienteDAO.listar();
                    request.setAttribute("tipoCliente", listaTipoCliente);
                    break;
                case "Agregar":
                    String dscrptc = request.getParameter("txtDescripcionTipoCliente");
                    tipoCliente.setDescripcion(dscrptc);
                    tipoClienteDAO.agregar(tipoCliente);
                    request.getRequestDispatcher("Controlador?menu=TipoCliente&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    codTipoCliente = Integer.parseInt(request.getParameter("codigoTipoCliente"));
                    TipoCliente tipclien = tipoClienteDAO.listarCodigoTipoCliente(codTipoCliente);
                    request.setAttribute("TipoCliente", tipclien);
                    request.getRequestDispatcher("Controlador?menu=TipoCliente&accion=Listar").forward(request, response);
                    break;
                case"Actualizar":
                    String dscrpTipClien = request.getParameter("txtDescripcionTipoCliente");
                    tipoCliente.setDescripcion(dscrpTipClien);
                    tipoCliente.setCodigoTipoCliente(codTipoCliente);
                    tipoClienteDAO.actualizar(tipoCliente);
                    request.getRequestDispatcher("Controlador?menu=TipoCliente&accion=Listar").forward(request, response);
                    break;
                case"Eliminar":
                    codTipoCliente = Integer.parseInt(request.getParameter("codigoTipoCliente"));
                    tipoClienteDAO.eliminar(codTipoCliente);
                    request.getRequestDispatcher("Controlador?menu=TipoCliente&accion=Listar").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("TipoCliente.jsp").forward(request, response);
        }else if(menu.equals("TipoEmpleado")){
            switch(accion){
                case "Listar":
                    List listaTipoEmpleado = tipoEmpleadoDAO.listar();
                    request.setAttribute("tipoEmpleado", listaTipoEmpleado);
                    break;
                case "Agregar":
                    String Desc = request.getParameter("txtDescripcion");
                    tipoEmpleado.setDescripcion(Desc);
                    tipoEmpleadoDAO.agregar(tipoEmpleado);
                    request.getRequestDispatcher("Controlador?menu=TipoEmpleado&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    codTipoEmpleado = Integer.parseInt(request.getParameter("codigoTipoEmpleado"));
                    TipoEmpleado tipoEmple = tipoEmpleadoDAO.listaCodigoTipoEmpleado(codTipoEmpleado);
                    request.setAttribute("TipoEmpleado", tipoEmple);
                    request.getRequestDispatcher("Controlador?menu=TipoEmpleado&accion=Listar").forward(request, response);
                    break;
                case"Actualizar":
                    String descrip = request.getParameter("txtDescripcion");
                    tipoEmpleado.setDescripcion(descrip);
                    tipoEmpleado.setCodigoTipoEmpleado(codTipoEmpleado);
                    tipoEmpleadoDAO.actualizar(tipoEmpleado);
                    request.getRequestDispatcher("Controlador?menu=TipoEmpleado&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    codTipoEmpleado = Integer.parseInt(request.getParameter("codigoTipoEmpleado"));
                    tipoEmpleadoDAO.eliminar(codTipoEmpleado);
                    request.getRequestDispatcher("Controlador?menu=TipoEmpleado&accion=Listar").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("TipoEmpleado.jsp").forward(request, response);
        }else if(menu.equals("Volumen")){
            switch(accion){
                    case "Listar":
                            List listaVolumen = volumenDAO.listar();
                            request.setAttribute("volumen", listaVolumen);
                            break;
                    case "Agregar":
                            String volumenes = request.getParameter("txtVolumen");
                            volumen.setVolumen(volumenes);
                            volumenDAO.agregar(volumen);
                            request.getRequestDispatcher("Controlador?menu=Volumen&accion=Listar").forward(request, response);
                            break;
                    case "Editar":
                            codVolumen = Integer.parseInt(request.getParameter("codigoVolumen"));
                            Volumen v = volumenDAO.listarCodigoVolumen(codVolumen);
                            request.setAttribute("Volumen", v);
                            request.getRequestDispatcher("Controlador?menu=Volumen&accion=Listar").forward(request, response);
                            break;
                    case "Actualizar":
                            String Vol = request.getParameter("txtVolumen");
                            volumen.setVolumen(Vol);
                            volumen.setCodigoVolumen(codVolumen);
                            volumenDAO.actualizar(volumen);
                            request.getRequestDispatcher("Controlador?menu=Volumen&accion=Listar").forward(request, response);
                            break;
                    case "Eliminar":
                            codVolumen = Integer.parseInt(request.getParameter("codigoVolumen"));
                            volumenDAO.eliminar(codVolumen);
                            request.getRequestDispatcher("Controlador?menu=Volumen&accion=Listar").forward(request, response);
                            break;
            }request.getRequestDispatcher("Volumen.jsp").forward(request, response);
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
