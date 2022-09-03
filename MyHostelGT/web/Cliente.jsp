<%-- 
    Document   : Cliente
    Created on : 30/08/2022, 07:46:46 PM
    Author     : Grupo 3
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>Vista Clientes</title>
    </head>
    <body>
        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="Controlador?menu=Cliente" method="POST">
                        <div class="form-group">
                            <label>ID:</label>
                            <input type="text" name="txtID" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Nombre:</label>
                            <input type="text" name="txtNombreCliente" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Teléfono:</label>
                            <input type="text" name="txtTelefono" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Método de Pago:</label>
                            <input type="text" name="txtMetodoDePago" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Tipo de Cliente:</label>
                            <input type="text" name="txtTipoDeCliente" class="form-control">
                        </div>
                        <input type="submit" name="action" value="Agregar" class="btn btn-info">
                        <input type="submit" name="action" value="Actualizar" class="btn btn-success">
                    </form>
                </div>
            </div>
            
            <div class="col-sm-8">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <td>ID</td>
                            <td>Nombre</td>
                            <td>Teléfono</td>
                            <td>Método De Pago</td>
                            <td>Tipo De Cliente</td>
                            <td>Opciones</td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="cliente" items="${cliente}">
                            <tr>
                                <td>${cliente.getID()}</td>
                                <td>${cliente.getNombreCliente()}</td>
                                <td>${cliente.getTelefono()}</td>
                                <td>${cliente.getCodigoMetodoPago()}</td>
                                <td>${cliente.getCodigoTipoCliente()}</td>
                                <td>
                                    <a class="btn btn-warning" href="">Editar</a>
                                    <a class="btn btn-danger" href="">Eliminar</a>
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
