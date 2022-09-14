<%-- 
    Document   : TipoEmpleado
    Created on : 30/08/2022, 07:45:08 PM
    Author     : Grupo 3
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
        <title>Pagina Empleado</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="Controlador?menu=TipoEmpleado" method="POST">
                        <div class="form-floating mb-3"> 
                            <input type="text" name="txtDescripcion" value="${TipoEmpleado.getDescripcion()}" class="form-control" id="floatingInputGroup1" placeholder="Descripcion">
                            <label for="floatingInputGroup1">Descripcion</label>
                        </div>
                        <input type="submit" name="accion" value="Agregar" class="btn btn-primary">
                        <input type="submit" name="accion" value="Actualizar" class="btn btn-success">
                    </form>
                </div>
            </div>
            <div class='col-sm-8'>
                <table class="table table-hover table-bordered table-striped text-center">
                    <caption>Lista de Tipos de Empleado</caption>
                    <thead>
                        <tr>
                            <th scope="col">Codigo</th>
                            <th scope="col">Descripcion</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="tipoEmpleado" items="${tipoEmpleado}">   
                        <tr>
                            <th scope="row">${tipoEmpleado.getCodigoTipoEmpleado()}</th>
                            <td>${tipoEmpleado.getDescripcion()}</td>
                            <td>
                                <a class='btn btn-warning' href="Controlador?menu=TipoEmpleado&accion=Editar&codigoTipoEmpleado=${tipoEmpleado.getCodigoTipoEmpleado()}">Editar</a>
                                <a class='btn btn-danger' href="Controlador?menu=TipoEmpleado&accion=Eliminar&codigoTipoEmpleado=${tipoEmpleado.getCodigoTipoEmpleado()}">Eliminar</a>
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>  
            </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>
