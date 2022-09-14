<%-- 
    Document   : Reservacion
    Created on : 30/08/2022, 07:48:24 PM
    Author     : Grupo 3
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
        <title>Reservaciones</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action='Controlador?menu=Reservacion' method="POST">
                        <div class="form-floating mb-3"> 
                            <input type="text" name="txtFechaEntrada" value="${Reservacion.getFechaEntrada()}" class="form-control" id="floatingInputGroup1" placeholder="Fecha de Entrada">
                            <label for="floatingInputGroup1">Fecha de Entrada</label>
                        </div>
                        <div class="form-floating mb-3"> 
                            <input type="text" name="txtFechaSalida" value="${Reservacion.getFechaSalida()}" class="form-control" id="floatingInputGroup1" placeholder="Fecha de Salida">
                            <label for="floatingInputGroup1">Fecha de Salida</label>
                        </div>
                        <div class="form-floating mb-3"> 
                            <input type="text" name="txtCostReservacion" value="${Reservacion.getCostReservacion()}" class="form-control" id="floatingInputGroup1" placeholder="Costo de Reservacion">
                            <label for="floatingInputGroup1">Costo de Reservacion</label>
                        </div>
                        <div class="form-floating mb-3"> 
                            <!--<input type="text" name="txtID" value="${Reservacion.getID()}" class="form-control" id="floatingInputGroup1" placeholder="Cliente">-->
                            <select class="form-control" data-val="true" name="txtID" value="${Reservacion.getID()}">
                                <c:forEach var="cliente" items="${clientes}">
                                    <option name="txtID" value="${String.valueOf(cliente.getID())}" >${String.valueOf(cliente.getID())} ${cliente.getNombreCliente()} ${cliente.getApellidoCliente()}</option>
                                </c:forEach>
        
                            </select>
                            <label for="floatingInputGroup1">Cliente</label>
                        </div>
                        <div class="form-floating mb-3"> 
                           <!--<input type="text" name="txtNumHabitacion" value="${Reservacion.getNumHabitacion()}" class="form-control" id="floatingInputGroup1" placeholder="Habitacion">-->
                            <select class="form-control" data-val="true" name="txtNumHabitacion" value="${Reservacion.getNumHabitacion()}">
                                <c:forEach var="habitacion" items="${habitacion}">
                                    <option name="txtNumHabitacion" value="${String.valueOf(habitacion.getNumHabitacion())}">${String.valueOf(habitacion.getNumHabitacion())}</option>
                                </c:forEach>
                            </select>
                            <label for="floatingInputGroup1">Habitacion</label>
                        </div>
                        <div class="form-floating mb-3"> 
                            <!--<input type="text" name="txtAcceso" value="${Reservacion.getAcceso()}" class="form-control" id="floatingInputGroup1" placeholder="Acceso">-->
                            <select class="form-control" data-val="true" name="txtAcceso" value="${Reservacion.getAcceso()}">
                                <c:forEach var="empleado" items="${empleados}">
                                    <option name="txtAcceso" value="${String.valueOf(empleado.getAcceso())}">${String.valueOf(empleado.getAcceso())}</option>
                                </c:forEach>
                            </select>
                            <label for="floatingInputGroup1">Acceso</label>
                        </div>
                        <input type='submit' name="accion" value="Agregar" class="btn btn-primary">
                        <input type='submit' name="accion" value="Actualizar" class="btn btn-success">
                        
                    </form>
                </div>
            </div>
            
            <div class='col-sm-8'>
                <table class="table table-hover table-bordered table-striped text-center">
                    <caption>Lista de Reservaciones</caption>
                    <thead>
                        <tr>
                            <th scope="col">CODIGO RESERVACION</th>
                            <th scope="col">ENTRADA</th>
                            <th scope="col">SALIDA</th>
                            <th scope="col">COSTO RESERVACION</th>
                            <th scope="col">ID CLIENTE</th>
                            <th scope="col">HABITACION</th>
                            <th scope="col">ACCESO</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="reservacion" items="${reservacion}">
                        <tr>
                            <th scope="row">${reservacion.getCodigoReservacion()}</th>
                            <td>${reservacion.getFechaEntrada()}</td>
                            <td>${reservacion.getFechaSalida()}</td>
                            <td>${reservacion.getCostReservacion()}</td>
                            <td>${reservacion.getID()}</td>
                            <td>${reservacion.getNumHabitacion()}</td>
                            <td>${reservacion.getAcceso()}</td>
                            <td>
                                <a class="btn btn-warning" href="Controlador?menu=Reservacion&accion=Editar&codigoReservacion=${reservacion.getCodigoReservacion()}">Editar</a>
                                <a class="btn btn-danger " href="Controlador?menu=Reservacion&accion=Eliminar&codigoReservacion=${reservacion.getCodigoReservacion()}">Eliminar</a>
                            </td>
                            
                        </tr>
                    </c:forEach>
                    </tbody>
                    
                </table>
                
            </div>
            
            
        </div>
        
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>    
    </body>
</html>