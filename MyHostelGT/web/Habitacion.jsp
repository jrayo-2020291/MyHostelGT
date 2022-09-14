<%-- 
    Document   : Habitacion
    Created on : 30/08/2022, 07:47:01 PM
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
        <title>Vista Habitaciones</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="Controlador?menu=Habitacion" method="POST">
                        <div class="form-floating mb-3"> 
                            <input type="text" name="txtEstado" value="${Habitacion.getEstado()}" class="form-control" id="floatingInputGroup1" placeholder="Estado">
                            <label for="floatingInputGroup1">Estado</label>
                        </div>
                        <div class="form-floating mb-3"> 
                            <input type="text" name="txtSaldoAPagar" value="${Habitacion.getSaldoAPagar()}" class="form-control" id="floatingInputGroup1" placeholder="Costo">
                            <label for="floatingInputGroup1">Costo</label>
                        </div>
                        <div class="form-floating mb-3"> 
                            <input type="text" name="txtCodigoClasificacion" value="${Habitacion.getCodigoClasificacion()}" class="form-control" id="floatingInputGroup1" placeholder="Clasificacion">
                            <label for="floatingInputGroup1">Clasificacion</label>
                        </div>
                        <div class="form-floating mb-3"> 
                            <input type="text" name="txtCodigoSucursal" value="${Habitacion.getCodigoSucursal()}" class="form-control" id="floatingInputGroup1" placeholder="Sucursal">
                            <label for="floatingInputGroup1">Sucursal</label>
                        </div>
                        <input type="submit" name="accion" value="Agregar" class="btn btn-primary">
                        <input type="submit" name="accion" value="Actualizar" class="btn btn-success">
                    </form>
                </div>
            </div>
            
            <div class="col-sm-8">
                <table class="table table-hover table-bordered table-striped text-center">
                    <caption>Lista de Habitaciones</caption>
                    <thead>
                        <tr>
                            <th scope="col">Codigo</th>
                            <th scope="col">Estado</th>
                            <th scope="col">Costo</th>
                            <th scope="col">Codigo de Clasificacion</th>
                            <th scope="col">Codigo de Sucursal</th>
                            <th scope="col">Opciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="habitacion" items="${habitacion}">
                            <tr>
                                <th scope="row">${habitacion.getNumHabitacion()}</th>
                                <td>${habitacion.getEstado()}</td>
                                <td>${habitacion.getSaldoAPagar()}</td>
                                <td>${habitacion.getCodigoClasificacion()}</td>
                                <td>${habitacion.getCodigoSucursal()}</td>
                                <td>
                                <a class="btn btn-warning" href="Controlador?menu=Habitacion&accion=Editar&numHabitacion=${habitacion.getNumHabitacion()}">Editar</a>
                                <a class="btn btn-danger " href="Controlador?menu=Habitacion&accion=Eliminar&numHabitacion=${habitacion.getNumHabitacion()}">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umdscript/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>        
    </body>
</html>

