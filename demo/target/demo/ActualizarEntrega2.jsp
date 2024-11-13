<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.CallableStatement, java.sql.SQLException" %>

<%
    String mensajeError = null;
    String idEntregaIncompleta = request.getParameter("id_EntregaIncompleta");
    String cedula = request.getParameter("cedula");
    String papel = request.getParameter("papel");
    String carton = request.getParameter("carton");
    String vidrio = request.getParameter("vidrio");
    String textiles = request.getParameter("textiles");
    String metales = request.getParameter("metales");
    String fecha = request.getParameter("fecha");
    String hora = request.getParameter("hora");

    // Verificación de si el idEntregaIncompleta es válido
    if (idEntregaIncompleta == null || idEntregaIncompleta.isEmpty()) {
        mensajeError = "ID de entrega incompleta no puede estar vacío.";
    } else {
        try {
            Integer.parseInt(idEntregaIncompleta);  // Intentamos convertirlo a Integer
        } catch (NumberFormatException e) {
            mensajeError = "ID de entrega incompleta no es válido. Debe ser un número entero.";
        }
    }

    // Si no hay errores en el idEntregaIncompleta, proceder con la actualización
    if (mensajeError == null) {
        String URL = "jdbc:mysql://localhost:3306/centro_reciclaje?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
        String usuarioDB = "JKenS";
        String contrasenaDB = "JKen0407";

        Connection conn = null;
        CallableStatement stmt = null;

        try {
            // Cargar el driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, usuarioDB, contrasenaDB);

            String sql = "{CALL ActualizarEntregaIncompleta(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            stmt = conn.prepareCall(sql);

            // Validamos si los valores no son nulos o vacíos antes de convertir
            stmt.setInt(1, Integer.parseInt(idEntregaIncompleta)); // Esto ahora no debería fallar, ya que hemos validado

            stmt.setString(2, cedula);

            // Procesar los valores de cantidad asegurándonos de que no sean vacíos
            stmt.setInt(3, (papel != null && !papel.isEmpty()) ? Integer.parseInt(papel) : 0);
            stmt.setInt(4, (carton != null && !carton.isEmpty()) ? Integer.parseInt(carton) : 0);
            stmt.setInt(5, (vidrio != null && !vidrio.isEmpty()) ? Integer.parseInt(vidrio) : 0);
            stmt.setInt(6, (textiles != null && !textiles.isEmpty()) ? Integer.parseInt(textiles) : 0);
            stmt.setInt(7, (metales != null && !metales.isEmpty()) ? Integer.parseInt(metales) : 0);

            // Validar y convertir la fecha y hora
            stmt.setDate(8, java.sql.Date.valueOf(fecha));
            stmt.setTime(9, java.sql.Time.valueOf(hora));

            stmt.executeUpdate();
            response.sendRedirect("RevisarEntrega.jsp"); // Redirigir a la página de detalles de la entrega

        } catch (SQLException e) {
            mensajeError = "Error en la actualización: " + e.getMessage();
        } catch (ClassNotFoundException e) {
            mensajeError = "Error al cargar el driver de la base de datos: " + e.getMessage();
        } catch (NumberFormatException e) {
            mensajeError = "Uno o más campos contienen valores inválidos: " + e.getMessage();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                mensajeError = "Error al cerrar la conexión: " + e.getMessage();
            }
        }
    }

    // Si hay un mensaje de error, mostrarlo
    if (mensajeError != null) {
        out.println("<p>Error: " + mensajeError + "</p>");
    }
%>
