<%-- 
    Document   : Empleado
    Created on : 29/08/2022, 10:19:51 AM
    Author     : informatica
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
        <title>Vista Sucursal</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body class="p-4 m-0 border-0 bd-example">
        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="Controlador?menu=Sucursal" method="POST">
                        <div class="form-floating mb-3"> 
                            <input type="text" name="txtDescripcion" value ="${sucursal.getDescripcion()}" class="form-control" id="floatingInputGroup1" placeholder="Descripcion">
                            <label for="floatingInputGroup1">Descripcion</label>
                        </div>
                        <div class="form-floating mb-3"> 
                            <input type="text" name="txtPuntuacion" value ="${sucursal.getPuntuacion()}" class="form-control" id="floatingInputGroup1" placeholder="Puntuacion">
                            <label for="floatingInputGroup1">Puntuacion</label>
                        </div>
                        <div class="form-floating mb-3"> 
                            <input type="text" name="txtDireccion" value ="${sucursal.getDireccion()}" class="form-control" id="floatingInputGroup1" placeholder="Direccion">
                            <label for="floatingInputGroup1">Direccion</label>
                        </div>
                        <div class="form-floating mb-3"> 
                            <input type="text" name="txtRegion" value ="${sucursal.getCodigoRegion()}" class="form-control" id="floatingInputGroup1" placeholder="Region">
                            <label for="floatingInputGroup1">Region</label>
                        </div>
                        <div class="form-floating mb-3"> 
                            <input type="text" name="txtVolumen" value ="${sucursal.getCodigoVolumen()}" class="form-control" id="floatingInputGroup1" placeholder="Volumen">
                            <label for="floatingInputGroup1">Volumen</label>
                        </div>
                        <input type="submit" name="accion" value="Agregar" class="btn btn-primary ">
                        <input type="submit" name="accion" value="Actualizar" class="btn btn-success">
                    </form>
                </div>
            </div>
            <div class="col-sm-8 ">
                <table class="table table-hover table-bordered table-striped text-center">
                    <caption>Lista de Sucursales</caption>
                    <thead>
                        <tr>
                            <th scope="col">CODIGO</th>
                            <th scope="col">DESCRIPCION</th>
                            <th scope="col">PUNTUACION</th>
                            <th scope="col">DIRECCION</th>
                            <th scope="col">REGION</th>
                            <th scope="col">VOLUMEN</th>
                            <th scope="col">OPCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="sucursal" items="${sucursales}">
                            <tr>
                                <th class=""scope="row">${sucursal.getCodigoSucursal()}</th>
                                <td>${sucursal.getDescripcion()}</td>
                                <td>${sucursal.getPuntuacion()}</td>
                                <td>${sucursal.getDireccion()}</td>
                                <td>${sucursal.getCodigoRegion()}</td>
                                <td>${sucursal.getCodigoVolumen()}</td>
                                <td>
                                    <a class="btn btn-warning" href="Controlador?menu=Sucursal&accion=Editar&codigoSucursal=${sucursal.getCodigoSucursal()}">Editar</a>
                                    <a class="btn btn-danger " href="Controlador?menu=Sucursal&accion=Eliminar&codigoSucursal=${sucursal.getCodigoSucursal()}">Eliminar</a>
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

