<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException, java.sql.CallableStatement" %>

<%
    // Definir las variables
    String idEntregaIncompleta = request.getParameter("idEntregaIncompleta");
    String accion = request.getParameter("accion"); // 'aceptar', 'rechazar', 'actualizar', 'obtener'
    String idColaborador = (String) session.getAttribute("id_Colaborador");

    // Variables para los detalles de la entrega
    String mensajeError = null;
    String cedulaEntrega = "";
    int papel = 0, carton = 0, vidrio = 0, textiles = 0, metales = 0;
    String fecha = "", hora = "";

    // Conectar a la base de datos
    Connection conn = null;
    CallableStatement stmt = null;

    try {
        // Establecer la conexión con la base de datos
        String URL = "jdbc:mysql://localhost:3306/centro_reciclaje?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
        String usuarioDB = "JKenS";
        String contrasenaDB = "JKen0407";

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(URL, usuarioDB, contrasenaDB);

        if ("obtener".equals(accion)) {
            // Llamar al procedimiento para obtener los datos de la entrega incompleta
            String sql = "{CALL ObtenerEntregaIncompleta(?)}";
            stmt = conn.prepareCall(sql);
            stmt.setInt(1, Integer.parseInt(idEntregaIncompleta));
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                cedulaEntrega = rs.getString("cedula");
                papel = rs.getInt("papel");
                carton = rs.getInt("carton");
                vidrio = rs.getInt("vidrio");
                textiles = rs.getInt("textiles");
                metales = rs.getInt("metales");
                fecha = rs.getString("fecha");
                hora = rs.getString("hora");
            }
        } else if ("aceptar".equals(accion)) {
            // Llamar al procedimiento para aceptar la entrega incompleta
            String sql = "{CALL AceptarEntregaIncompleta(?, ?)}";
            stmt = conn.prepareCall(sql);
            stmt.setInt(1, Integer.parseInt(idEntregaIncompleta));
            stmt.setString(2, idColaborador);
            stmt.executeUpdate();
            mensajeError = "Entrega aceptada exitosamente.";
        } else if ("rechazar".equals(accion)) {
            // Llamar al procedimiento para rechazar la entrega incompleta
            String sql = "{CALL RechazarEntregaIncompleta(?)}";
            stmt = conn.prepareCall(sql);
            stmt.setInt(1, Integer.parseInt(idEntregaIncompleta));
            stmt.executeUpdate();
            mensajeError = "Entrega rechazada exitosamente.";
        }
    } catch (ClassNotFoundException e) {
        mensajeError = "Error al cargar el driver MySQL: " + e.getMessage();
    } catch (SQLException e) {
        mensajeError = "Error de conexión o consulta SQL: " + e.getMessage();
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalles de Entrega Incompleta</title>
    <link rel="stylesheet" href="CSS/bodyDetalleEntrega.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Detalles de la Entrega Incompleta</h1>
        </div>

        <% if (mensajeError != null) { %>
            <p class="error-message"><%= mensajeError %></p>
        <% } else { %>
        
        <!-- Tabla de detalles de entrega incompleta -->
        <form method="post" action="ActualizarEntrega.jsp">
            <input type="hidden" name="idEntregaIncompleta" value="<%= idEntregaIncompleta %>">
            <table class="table">
                <tr><td>Cédula:</td><td><%= cedulaEntrega %></td></tr>
                <tr><td>Papel (kg):</td><td><%= papel %></td></tr>
                <tr><td>Cartón (kg):</td><td><%= carton %></td></tr>
                <tr><td>Vidrio (kg):</td><td><%= vidrio %></td></tr>
                <tr><td>Textiles (kg):</td><td><%= textiles %></td></tr>
                <tr><td>Metales (kg):</td><td><%= metales %></td></tr>
                <tr><td>Fecha:</td><td><%= fecha %></td></tr>
                <tr><td>Hora:</td><td><%= hora %></td></tr>
            </table>
        </form>

        <!-- Botones alineados horizontalmente -->
        <div class="button-group-horizontal">
            <form method="post" action="ActualizarEntrega.jsp">
                <input type="hidden" name="idEntregaIncompleta" value="<%= idEntregaIncompleta %>">
                <button type="submit" class="btn btn-primary">Actualizar</button>
            </form>

            <form method="post" action="DetalleEntrega.jsp">
                <input type="hidden" name="accion" value="aceptar">
                <input type="hidden" name="idEntregaIncompleta" value="<%= idEntregaIncompleta %>">
                <button type="submit" class="btn btn-success">Aceptar</button>
            </form>

            <form method="post" action="DetalleEntrega.jsp">
                <input type="hidden" name="accion" value="rechazar">
                <input type="hidden" name="idEntregaIncompleta" value="<%= idEntregaIncompleta %>">
                <button type="submit" class="btn btn-danger">Rechazar</button>
            </form>

            <button onclick="window.location.href='RevisarEntrega.jsp'" class="btn btn-secondary">Volver</button>
        </div>
        <% } %>
    </div>
</body>
</html>