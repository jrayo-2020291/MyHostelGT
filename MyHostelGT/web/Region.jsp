<%-- 
    Document   : Region
    Created on : 30/08/2022, 07:44:51 PM
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
        <title>Vista Region</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="d-flex" >
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="Controlador?menu=Region" method="POST">
                        <div class="form-floating mb-3"> 
                        <input type="text" value="${region.getRegion()}" name="txtRegion" class="form-control" id="floatingInputGroup1" placeholder="Region">
                            <label for="floatingInputGroup1">Region</label>
                        </div>
                        <input type="submit" name="accion" value="Agregar" class="btn btn-primary">
                        <input type="submit" name="accion" value="Actualizar" class="btn btn-success">
                    </form>
                </div>
            </div>
            <div class="col-sm-8">
                <table class="table table-hover table-bordered table-striped text-center">
                    <caption>Lista de Regiones</caption>
                    <thead>
                        <tr>
                            <th scope="col">Codigo</th>
                            <th scope="col">Región</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="region" items="${regiones}">
                            <tr>
                                <th scope="row">${region.getCodigoRegion()}</th>
                                <td>${region.getRegion()}</td>
                                <td>
                                    <a class="btn btn-warning" href="Controlador?menu=Region&accion=Editar&codigoRegion=${region.getCodigoRegion()}"> Editar</a>
                                    <a class="btn btn-danger" href="Controlador?menu=Region&accion=Eliminar&codigoRegion=${region.getCodigoRegion()}"> Eliminar</a>
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
        <script src="https://kit.fontawesome.com/6761d0e0c0.js" crossorigin="anonymous"></script>
    </body>
</html>
