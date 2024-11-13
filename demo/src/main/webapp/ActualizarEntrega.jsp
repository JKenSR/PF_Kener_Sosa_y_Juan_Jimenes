<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.CallableStatement, java.sql.SQLException, java.sql.ResultSet" %>

<%
    // Obtenemos el id de la entrega incompleta desde la sesión
    String idEntregaIncompleta = request.getParameter("idEntregaIncompleta");

    if (idEntregaIncompleta == null || idEntregaIncompleta.isEmpty()) {
        response.sendRedirect("MenuAplicacion.jsp"); // Si no hay ID, redirigir al menú
        return;
    }

    // Datos de conexión a la base de datos
    String URL = "jdbc:mysql://localhost:3306/centro_reciclaje?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    String usuarioDB = "JKenS";
    String contrasenaDB = "JKen0407";

    Connection conn = null;
    CallableStatement stmt = null;
    ResultSet rs = null;

    // Variables para almacenar los datos de la entrega incompleta
    String cedula = "";
    String papel = "";
    String carton = "";
    String vidrio = "";
    String textiles = "";
    String metales = "";
    String fecha = "";
    String hora = "";

    try {
        // Cargar el driver MySQL
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(URL, usuarioDB, contrasenaDB);

        // Llamamos al procedimiento almacenado ObtenerEntregaIncompleta
        String sql = "{CALL ObtenerEntregaIncompleta(?)}";
        stmt = conn.prepareCall(sql);
        stmt.setString(1, idEntregaIncompleta);

        // Ejecutar el procedimiento
        rs = stmt.executeQuery();

        // Si la entrega incompleta existe, obtenemos sus datos
        if (rs.next()) {
            cedula = rs.getString("cedula");
            papel = rs.getString("papel");
            carton = rs.getString("carton");
            vidrio = rs.getString("vidrio");
            textiles = rs.getString("textiles");
            metales = rs.getString("metales");
            fecha = rs.getString("fecha");
            hora = rs.getString("hora");
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
    <title>Actualizar Entrega Incompleta</title>
    <link rel="stylesheet" href="CSS/bodyPerfilReciclador.css">
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="header">
                <button onclick="window.location.href='MenuAplicacion.jsp'" class="back-button">
                    ← Volver
                </button>
                <h1>Actualizar Entrega Incompleta</h1>
            </div>

            <div class="form-section">
                <form action="ActualizarEntrega2.jsp" method="post">
                    <div class="input-group full-width">
                        <label for="id_EntregaIncompleta">ID Entrega Incompleta</label>
                        <input type="text" id="id_EntregaIncompleta" name="id_EntregaIncompleta" value="<%= idEntregaIncompleta %>" readonly />
                    </div>

                    <div class="form-grid">
                        <div class="input-group">
                            <label for="cedula">Cédula</label>
                            <input type="text" id="cedula" name="cedula" value="<%= cedula %>" readonly />
                        </div>

                        <div class="input-group">
                            <label for="papel">Papel</label>
                            <input type="number" id="papel" name="papel" value="<%= papel %>" required />
                        </div>

                        <div class="input-group">
                            <label for="carton">Cartón</label>
                            <input type="number" id="carton" name="carton" value="<%= carton %>" required />
                        </div>

                        <div class="input-group">
                            <label for="vidrio">Vidrio</label>
                            <input type="number" id="vidrio" name="vidrio" value="<%= vidrio %>" required />
                        </div>

                        <div class="input-group">
                            <label for="textiles">Textiles</label>
                            <input type="number" id="textiles" name="textiles" value="<%= textiles %>" required />
                        </div>

                        <div class="input-group">
                            <label for="metales">Metales</label>
                            <input type="number" id="metales" name="metales" value="<%= metales %>" required />
                        </div>

                        <div class="input-group">
                            <label for="fecha">Fecha</label>
                            <input type="date" id="fecha" name="fecha" value="<%= fecha %>" required />
                        </div>

                        <div class="input-group">
                            <label for="hora">Hora</label>
                            <input type="time" id="hora" name="hora" value="<%= hora %>" required />
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
    </div>
</body>
</html>
