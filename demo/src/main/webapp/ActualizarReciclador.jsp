<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.CallableStatement, java.sql.SQLException" %>

<%
    String mensajeError = null;
    String cedula = request.getParameter("cedula");
    String nombre1 = request.getParameter("nombre1");
    String nombre2 = request.getParameter("nombre2");
    String apellido1 = request.getParameter("apellido1");
    String apellido2 = request.getParameter("apellido2");

    String URL = "jdbc:mysql://localhost:3306/centro_reciclaje?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    String usuarioDB = "JKenS";
    String contrasenaDB = "JKen0407";

    Connection conn = null;
    CallableStatement stmt = null;

    try {
        // Cargar el driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(URL, usuarioDB, contrasenaDB);

        // Llamamos al procedimiento almacenado para actualizar
        String sql = "{CALL ActualizarReciclador(?, ?, ?, ?, ?)}";
        stmt = conn.prepareCall(sql);
        stmt.setString(1, cedula);
        stmt.setString(2, nombre1);
        stmt.setString(3, nombre2);
        stmt.setString(4, apellido1);
        stmt.setString(5, apellido2);

        stmt.executeUpdate();
        response.sendRedirect("PerfilReciclador.jsp"); // Redirigir de nuevo al perfil

    } catch (SQLException e) {
        mensajeError = "Error en la actualización: " + e.getMessage();
    } catch (ClassNotFoundException e) {
        mensajeError = "Error al cargar el driver MySQL: " + e.getMessage();
    } finally {
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            mensajeError = "Error al cerrar la conexión: " + e.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Actualizar Reciclador</title>
</head>
<body>
    <h1>Actualizar Reciclador</h1>
    <% if (mensajeError != null) { %>
        <p style="color: red;"><%= mensajeError %></p>
    <% } else { %>
        <p>Reciclador actualizado correctamente.</p>
    <% } %>
</body>
</html>
