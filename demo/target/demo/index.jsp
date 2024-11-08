<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="CSS/bodyIndex.css">
    <title>Iniciar Sesión</title>

    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap" rel="stylesheet">

    <style>
        body {
            width: 100%;
            height: 100%;
            font-family: 'Open Sans', sans-serif;
            background: url("CSS/Image/InicioSesionFondo.jpg") no-repeat center center fixed;
            background-size: cover;
        }
    </style>
</head>

<body>
    <div class="login">
        <h1>
            <img src="CSS/Image/Reciclar.png" alt="Icono de reciclaje"> Iniciar Sesión
        </h1>
        <form method="post" action="Login.jsp">
            
            <div class="input-group">
                <input type="text" name="usuario" placeholder="Usuario" required="required" />
                <img src="CSS/Image/Usuario.png" alt="Icono de usuario" class="icon-usuario">
            </div>            

            <!-- Div para el campo de contraseña -->
            <div class="input-group">
                <input type="password" name="contrasena" placeholder="Contraseña" required="required" />
                <img src="CSS/Image/Contraseña.png" alt="Icono de contraseña" class="icon-contrasena">
            </div>
            
            <button type="submit" class="btn btn-primary btn-block btn-large">Ingresar</button>
        </form>
    </div>
</body>

</html>

