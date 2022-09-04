<%-- 
    Document   : index
    Created on : 30/08/2022, 06:09:37 PM
    Author     : Grupo 3
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="./Css/css.css">
        <title>Login</title>
    </head>
    <body>
         <div class="container mt-4 col-lg-4">
           <div class="card col-sm-10">
            <div class="card-body">
                <form class="form-sign" action="Validar" method="POST">
           <div class="imgcontainer">
               <h3>Login Empleados</h3>
             <img src="./img/Hotel_California_img.png" alt="Avatar" class="avatar">
           </div>

           <div  class="form-group text-center">

             <label for="uname"><b>Usuario</b></label>
             <input type="text" placeholder="Enter Username" name="txtUser" required>

             <label for="psw"><b>Contraseña</b></label>
             <input type="password" placeholder="Enter Password" name="txtPass" required>

             <label>
               <input type="submit" name="accion" value="Ingresar" class="btn btn-primary btn-block">
             </div>
             </div>
            </div>
           </div>
         </form>        
    </body>
</html>

