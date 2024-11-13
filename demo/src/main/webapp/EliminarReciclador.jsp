<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.CallableStatement, java.sql.SQLException" %>

<%
    String mensajeError = null;
    String cedula = request.getParameter("cedula");

    String URL = "jdbc:mysql://localhost:3306/centro_reciclaje?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    String usuarioDB = "JKenS";
    String contrasenaDB = "JKen0407";

    Connection conn = null;
    CallableStatement stmt = null;

    try {
        // Cargar el driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(URL, usuarioDB, contrasenaDB);

        // Llamamos al procedimiento almacenado para eliminar
        String sql = "{CALL EliminarReciclador(?)}";
        stmt = conn.prepareCall(sql);
        stmt.setString(1, cedula);

        stmt.executeUpdate();
        response.sendRedirect("LoginReciclar.jsp"); // Redirigir al login después de eliminar

    } catch (SQLException e) {
        mensajeError = "Error al eliminar: " + e.getMessage();
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
    <title>Eliminar Reciclador</title>
</head>
<body>
    <h1>Eliminar Reciclador</h1>
    <% if (mensajeError != null) { %>
        <p style="color: red;"><%= mensajeError %></p>
    <% } else { %>
        <p>Reciclador eliminado correctamente.</p>
    <% } %>
</body>
</html>
