<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException, java.sql.CallableStatement" %>

<%
    // Definir las variables
    String idEntregaIncompleta = request.getParameter("idEntregaIncompleta");
    String mensajeError = null;

    // Variables para los detalles que se actualizarán
    int papel = Integer.parseInt(request.getParameter("papel"));
    int carton = Integer.parseInt(request.getParameter("carton"));
    int vidrio = Integer.parseInt(request.getParameter("vidrio"));
    int textiles = Integer.parseInt(request.getParameter("textiles"));
    int metales = Integer.parseInt(request.getParameter("metales"));

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

        // Llamar al procedimiento para actualizar los detalles de la entrega incompleta
        String sql = "{CALL ActualizarEntregaIncompleta(?, ?, ?, ?, ?, ?)}";
        stmt = conn.prepareCall(sql);
        stmt.setInt(1, Integer.parseInt(idEntregaIncompleta));
        stmt.setInt(2, papel);
        stmt.setInt(3, carton);
        stmt.setInt(4, vidrio);
        stmt.setInt(5, textiles);
        stmt.setInt(6, metales);
        stmt.executeUpdate();

        mensajeError = "Entrega actualizada exitosamente.";

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
    <title>Actualizar Entrega Incompleta</title>
    <link rel="stylesheet" href="CSS/bodyActualizarEntrega.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="header">
                <button onclick="window.location.href='DetalleEntrega.jsp'" class="back-button">
                    ← Volver
                </button>
                <h1>Actualizar Entrega</h1>
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

            <form method="post" action="ActualizarEntrega.jsp" class="materials-form">
                <input type="hidden" name="idEntregaIncompleta" value="<%= idEntregaIncompleta %>">

                <div class="form-grid">
                    <div class="input-group">
                        <label for="papel">Papel (kg)</label>
                        <div class="input-wrapper">
                            <input type="number" id="papel" name="papel" value="<%= papel %>" min="0" step="0.1">
                            <span class="unit">kg</span>
                        </div>
                    </div>

                    <div class="input-group">
                        <label for="carton">Cartón (kg)</label>
                        <div class="input-wrapper">
                            <input type="number" id="carton" name="carton" value="<%= carton %>" min="0" step="0.1">
                            <span class="unit">kg</span>
                        </div>
                    </div>

                    <div class="input-group">
                        <label for="vidrio">Vidrio (kg)</label>
                        <div class="input-wrapper">
                            <input type="number" id="vidrio" name="vidrio" value="<%= vidrio %>" min="0" step="0.1">
                            <span class="unit">kg</span>
                        </div>
                    </div>

                    <div class="input-group">
                        <label for="textiles">Textiles (kg)</label>
                        <div class="input-wrapper">
                            <input type="number" id="textiles" name="textiles" value="<%= textiles %>" min="0" step="0.1">
                            <span class="unit">kg</span>
                        </div>
                    </div>

                    <div class="input-group">
                        <label for="metales">Metales (kg)</label>
                        <div class="input-wrapper">
                            <input type="number" id="metales" name="metales" value="<%= metales %>" min="0" step="0.1">
                            <span class="unit">kg</span>
                        </div>
                    </div>
                </div>

                <div class="button-group">
                    <button type="submit" class="btn btn-primary">
                        Actualizar Entrega
                    </button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>