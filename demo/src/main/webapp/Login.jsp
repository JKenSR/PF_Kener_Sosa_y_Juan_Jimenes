<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.SQLException, java.sql.ResultSet, java.sql.PreparedStatement" %>

<%
    String mensajeError = null;
    String usuarioForm = request.getParameter("usuario");
    String contrasenaForm = request.getParameter("contrasena");

    if (usuarioForm != null && contrasenaForm != null) {
        String URL = "jdbc:mysql://localhost:3306/centro_reciclaje?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
        String usuarioDB = "JKenS";
        String contrasenaDB = "JKen0407";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Cargar el driver actualizado
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(URL, usuarioDB, contrasenaDB);

            String sql = "SELECT * FROM Usuarios WHERE ingresoUsuario = ? AND ingresoContraseña = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, usuarioForm);
            ps.setString(2, contrasenaForm);
            rs = ps.executeQuery();

            if (rs.next()) {
                response.sendRedirect("MenuAplicacion.jsp");
            } else {
                mensajeError = "USUARIO O CONTRASEÑA INCORRECTOS";
            }
        } catch (ClassNotFoundException e) {
            mensajeError = "Error al cargar el driver MySQL: " + e.getMessage();
        } catch (SQLException e) {
            mensajeError = "Error de conexión o consulta SQL: " + e.getMessage();
        } finally {
            try {
                if(rs != null) rs.close();
                if(ps != null) ps.close();
                if(conn != null) conn.close();
            } catch (SQLException e) {
                mensajeError = "Error al cerrar la conexión: " + e.getMessage();
            }
        }   
    }
%>

<!-- Mostrar mensaje de error si existeaaaaa-->
<% if (mensajeError != null) { %>
    <p style="color:red;"><%= mensajeError %></p>
<% } %>


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
            <input type="text" name="usuario" placeholder="Usuario" required="required" />
            <img src="CSS/Image/Usuario.png" alt="Icono de usuario" class="icon-usuario">
            <input type="password" name="contrasena" placeholder="Contraseña" required="required" />
            <img src="CSS/Image/Contraseña.png" alt="Icono de contraseña" class="icon-contrasena">
            <button type="submit" class="btn btn-primary btn-block btn-large">Ingresar</button>
        </form>
        
        <!-- Mostrar mensajes de error si los hay -->
        <% if (mensajeError != null) { %>
            <p class="error" style="color:red;"> <%= mensajeError %> </p>
        <% } %>
    </div>
</body>
</html>


