<%-- 
    Document   : Principal
    Created on : 30/08/2022, 07:53:21 PM
    Author     : Ian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>MyHosteGT</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg" style="background-color: #7e3e17">
                <img src="./img/Hotel_California.png" style="width: 90px; height: 65px;">
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle border border-dark text-white" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Menu de opciones
                    </a>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item border border-secondary" href="Controlador?menu=MetodoDePago&accion=Listar" target="myFrame">Metodo de Pago</a></li>
                      <li><a class="dropdown-item border border-secondary" href="Controlador?menu=Clasificacion&accion=Listar" target="myFrame">Clasificacion</a></li>
                      <li><a class="dropdown-item border border-secondary" href="Controlador?menu=Volumen&accion=Listar" target="myFrame">Volumen</a></li>
                      <li><a class="dropdown-item border border-secondary" href="Controlador?menu=Region&accion=Listar" target="myFrame">Region</a></li>
                      <li><a class="dropdown-item border border-secondary" href="Controlador?menu=TipoEmpleado&accion=Listar" target="myFrame">Tipo Empleado</a></li>
                      <li><a class="dropdown-item border border-secondary" href="Controlador?menu=TipoCliente&accion=Listar" target="myFrame">Tipo Cliente</a></li>
                      <li><a class="dropdown-item border border-secondary" href="Controlador?menu=Sucursal&accion=Listar" target="myFrame">Sucursal</a></li>
                      <li><a class="dropdown-item border border-secondary" href="Controlador?menu=Cliente&accion=Listar" target="myFrame">Cliente</a></li>
                      <li><a class="dropdown-item border border-secondary" href="Controlador?menu=Habitacion&accion=Listar" target="myFrame">Habitacion</a></li>
                      <li><a class="dropdown-item border border-secondary" href="Controlador?menu=Empleado&accion=Listar" target="myFrame">Empleado</a></li>
                      <li><a class="dropdown-item border border-secondary" href="Controlador?menu=Reservacion&accion=Listar" target="myFrame">Reservacion</a></li>
                    </ul>
                  </li>
                </ul>
            </div>
            <div class="dropdown">
                <button style="border: none" class="btn btn-outline-light dropdown-toggle border border-dark" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  ${usuario.getNombreEmpleado()}
                </button>
                    <div class="dropdown-menu text-center" aria-labellebdy="dropdownMenuButton">
                        <a class="dropdown-item" href="#">
                            <img src="./img/${usuario.getUsuario()}.png" alt="" width="50">
                        </a>  
                        <a class="dropdown-item" href="#">${usuario.getUsuario()}</a>
                        <a class="dropdown-item" href="#">${usuario.getUsuario()}@gmail.com</a>
                        <div class="dropdown-divider"></div>
                        <form action="Validar" method="POST">
                            <button name="accion" name="Salir" class="dropdown-item" href="#">Salir</button>
                        </form>
                    </div>
              </div>
        </nav>
                        <div class="m-4" style="height: 640px">
                            <iframe name="myFrame" style="height: 100%; width: 100%; border: none"></iframe>
                        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>
