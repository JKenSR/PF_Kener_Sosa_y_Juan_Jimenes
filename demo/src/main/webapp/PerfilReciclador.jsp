<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.CallableStatement, java.sql.ResultSet, java.sql.SQLException" %>

<%
    // Obtenemos la cédula desde la sesión
    String cedula = (String) session.getAttribute("cedula");

    // Verificamos que la cédula no sea nula o vacía
    if (cedula == null || cedula.isEmpty()) {
        response.sendRedirect("MenuAplicacion.jsp"); // Si no hay cédula, redirigir al login
        return;
    }

    // Datos de conexión a la base de datos
    String URL = "jdbc:mysql://localhost:3306/centro_reciclaje?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    String usuarioDB = "JKenS";
    String contrasenaDB = "JKen0407";

    Connection conn = null;
    CallableStatement stmt = null;
    ResultSet rs = null;

    // Variables para almacenar los datos del reciclador
    String nombre1 = "";
    String nombre2 = "";
    String apellido1 = "";
    String apellido2 = "";

    try {
        // Cargar el driver MySQL
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(URL, usuarioDB, contrasenaDB);

        // Llamamos al procedimiento almacenado ObtenerReciclador
        String sql = "{CALL ObtenerReciclador(?)}";
        stmt = conn.prepareCall(sql);
        stmt.setString(1, cedula);

        // Ejecutar el procedimiento
        rs = stmt.executeQuery();

        // Si el reciclador existe, obtenemos sus datos
        if (rs.next()) {
            nombre1 = rs.getString("nombre1");
            nombre2 = rs.getString("nombre2");
            apellido1 = rs.getString("apellido1");
            apellido2 = rs.getString("apellido2");
        }
    } catch (SQLException e) {
        out.println("Error de conexión o consulta SQL: " + e.getMessage());
    } catch (ClassNotFoundException e) {
        out.println("Error al cargar el driver MySQL: " + e.getMessage());
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            out.println("Error al cerrar la conexión: " + e.getMessage());
        }
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil del Reciclador</title>
    <link rel="stylesheet" href="CSS/bodyPerfilReciclador.css">
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="header">
                <button onclick="window.location.href='LoginReciclar.jsp'" class="back-button">
                    ← Volver
                </button>
                <h1>Perfil de Reciclador</h1>
            </div>

            <div class="form-section">
                <form action="ActualizarReciclador.jsp" method="post">
                    <div class="input-group full-width">
                        <label for="cedula">Cédula</label>
                        <input type="text" id="cedula" name="cedula" value="<%= cedula %>" readonly />
                    </div>

                    <div class="form-grid">
                        <div class="input-group">
                            <label for="nombre1">Primer Nombre</label>
                            <input type="text" id="nombre1" name="nombre1" value="<%= nombre1 %>" required />
                        </div>

                        <div class="input-group">
                            <label for="nombre2">Segundo Nombre</label>
                            <input type="text" id="nombre2" name="nombre2" value="<%= nombre2 %>" />
                        </div>

                        <div class="input-group">
                            <label for="apellido1">Primer Apellido</label>
                            <input type="text" id="apellido1" name="apellido1" value="<%= apellido1 %>" required />
                        </div>

                        <div class="input-group">
                            <label for="apellido2">Segundo Apellido</label>
                            <input type="text" id="apellido2" name="apellido2" value="<%= apellido2 %>" />
                        </div>
                    </div>

                    <div class="button-group">
                        <button type="button" onclick="window.location.href='RealizarEntrega.jsp'" class="btn btn-success">
                            Realizar Entrega
                        </button>
                        
                        <button type="submit" class="btn btn-primary">
                            Actualizar Perfil
                        </button>
                        
                        <button type="button" onclick="if(confirm('¿Estás seguro de que deseas eliminar tu perfil? Esta acción no se puede deshacer.')) window.location.href='EliminarReciclador.jsp'" class="btn btn-danger">
                            Eliminar Perfil
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>

