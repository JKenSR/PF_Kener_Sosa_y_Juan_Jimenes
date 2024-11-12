<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.CallableStatement, java.sql.ResultSet, java.sql.SQLException" %>

<%
    // Variables para mensajes de error
    String mensajeError = null;

    // Datos de conexión
    String URL = "jdbc:mysql://localhost:3306/centro_reciclaje?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    String usuarioDB = "JKenS";
    String contrasenaDB = "JKen0407";

    Connection conn = null;
    CallableStatement stmt = null;
    ResultSet rs = null;

    try {
        // Establecer la conexión
        conn = DriverManager.getConnection(URL, usuarioDB, contrasenaDB);

        // Llamar al procedimiento almacenado
        String sql = "{CALL ObtenerTodasLasEntregasIncompletas()}";
        stmt = conn.prepareCall(sql);
        rs = stmt.executeQuery();

    } catch (SQLException e) {
        mensajeError = "Error de conexión o consulta SQL: " + e.getMessage();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { /* manejar error */ }
        if (stmt != null) try { stmt.close(); } catch (SQLException e) { /* manejar error */ }
        if (conn != null) try { conn.close(); } catch (SQLException e) { /* manejar error */ }
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Revisar Entregas Incompletas</title>
    <link rel="stylesheet" href="CSS/bodyRevisarEntrega.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="header">
                <button onclick="window.location.href='MenuAplicacion.jsp'" class="back-button">
                    ← Volver al Menú
                </button>
                <h1>Lista de Entregas Incompletas</h1>
            </div>

            <% if (mensajeError != null) { %>
                <div class="error-message">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="10"></circle>
                        <line x1="12" y1="8" x2="12" y2="12"></line>
                        <line x1="12" y1="16" x2="12.01" y2="16"></line>
                    </svg>
                    <span><%= mensajeError %></span>
                </div>
            <% } %>

            <div class="table-container">
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Cédula</th>
                            <th>Papel (kg)</th>
                            <th>Cartón (kg)</th>
                            <th>Vidrio (kg)</th>
                            <th>Textiles (kg)</th>
                            <th>Metales (kg)</th>
                            <th>Fecha</th>
                            <th>Hora</th>
                            <th>Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (rs != null) {
                                while (rs.next()) {
                                    int idEntregaIncompleta = rs.getInt("id_EntregaIncompleta");
                                    String cedula = rs.getString("cedula");
                                    int papel = rs.getInt("papel");
                                    int carton = rs.getInt("carton");
                                    int vidrio = rs.getInt("vidrio");
                                    int textiles = rs.getInt("textiles");
                                    int metales = rs.getInt("metales");
                                    String fecha = rs.getString("fecha");
                                    String hora = rs.getString("hora");
                        %>
                        <tr>
                            <td><%= idEntregaIncompleta %></td>
                            <td><%= cedula %></td>
                            <td class="number"><%= papel %></td>
                            <td class="number"><%= carton %></td>
                            <td class="number"><%= vidrio %></td>
                            <td class="number"><%= textiles %></td>
                            <td class="number"><%= metales %></td>
                            <td><%= fecha %></td>
                            <td><%= hora %></td>
                            <td>
                                <form method="get" action="DetalleEntrega.jsp" class="action-form">
                                    <input type="hidden" name="idEntregaIncompleta" value="<%= idEntregaIncompleta %>">
                                    <input type="hidden" name="accion" value="obtener">
                                    <input type="hidden" name="id_Colaborador" value="<%= session.getAttribute("id_Colaborador") %>">
                                    <button type="submit" class="btn btn-primary">Revisar</button>
                                </form>
                            </td>
                        </tr>
                        <% 
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <%
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    %>
</body>
</html>
