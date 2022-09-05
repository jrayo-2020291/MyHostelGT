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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
        <title>Vista Clientes</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="Controlador?menu=Cliente" method="POST">
                        <div class="form-floating mb-3"> 
                            <input type="text" name="txtID" class="form-control" id="floatingInputGroup1" placeholder="ID">
                            <label for="floatingInputGroup1">ID</label>
                        </div>
                        <div class="form-floating mb-3"> 
                            <input type="text" name="txtNombreClientes" class="form-control" id="floatingInputGroup1" placeholder="Nombre">
                            <label for="floatingInputGroup1">Nombre</label>
                        </div>
                        <div class="form-floating mb-3"> 
                            <input type="text" name="txtTelefono" class="form-control" id="floatingInputGroup1" placeholder="Telefono">
                            <label for="floatingInputGroup1">Telefono</label>
                        </div>
                        <div class="form-floating mb-3"> 
                            <input type="text" name="txtMetodoDePago" class="form-control" id="floatingInputGroup1" placeholder="Metpdp de Pago">
                            <label for="floatingInputGroup1">Metodo de Pago</label>
                        </div>
                        <div class="form-floating mb-3"> 
                            <input type="text" name="txtTipoDeCliente" class="form-control" id="floatingInputGroup1" placeholder="Tipo de Cliente">
                            <label for="floatingInputGroup1">Tipo de Cliente</label>
                        </div>
                        <input type="submit" name="action" value="Agregar" class="btn btn-primary">
                        <input type="submit" name="action" value="Actualizar" class="btn btn-success">
                    </form>
                </div>
            </div>
            
            <div class="col-sm-8">
                <table class="table table-hover table-bordered table-striped text-center">
                    <caption>Lista de Clientes</caption>
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Teléfono</th>
                            <th scope="col">Método De Pago</th>
                            <th scope="col">Tipo De Cliente</th>
                            <th scope="col">Opciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="cliente" items="${cliente}">
                            <tr>
                                <th scope="row">${cliente.getID()}</th>
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
