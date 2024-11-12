<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.CallableStatement, java.sql.SQLException" %>

<%
    // Obtener la cédula del reciclador desde la sesión
    String cedula = (String) session.getAttribute("cedula");

    // Variables para mensajes de error o éxito
    String mensajeError = null;
    String mensajeExito = null;

    // Parámetros recibidos del formulario (cantidades de materiales)
    String papelForm = request.getParameter("papel");
    String cartonForm = request.getParameter("carton");
    String vidrioForm = request.getParameter("vidrio");
    String textilesForm = request.getParameter("textiles");
    String metalesForm = request.getParameter("metales");

    if (papelForm != null && cartonForm != null && vidrioForm != null && textilesForm != null && metalesForm != null) {
        try {
            int papel = Integer.parseInt(papelForm);
            int carton = Integer.parseInt(cartonForm);
            int vidrio = Integer.parseInt(vidrioForm);
            int textiles = Integer.parseInt(textilesForm);
            int metales = Integer.parseInt(metalesForm);

            if (papel < 0 || carton < 0 || vidrio < 0 || textiles < 0 || metales < 0) {
                mensajeError = "Los valores no pueden ser negativos";
            } else if (papel > 100 || carton > 100 || vidrio > 100 || textiles > 100 || metales > 100) {
                mensajeError = "Los valores no pueden exceder 100";
            } else {
                // Datos de conexión
                String URL = "jdbc:mysql://localhost:3306/centro_reciclaje?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
                String usuarioDB = "JKenS";
                String contrasenaDB = "JKen0407";

                Connection conn = null;
                CallableStatement stmtEntregaIncompleta = null;

                try {
                    // Cargar el driver y establecer la conexión
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(URL, usuarioDB, contrasenaDB);

                    // Obtener fecha y hora actuales
                    java.util.Date fechaActual = new java.util.Date();
                    java.sql.Date fechaSQL = new java.sql.Date(fechaActual.getTime());
                    java.sql.Time horaSQL = new java.sql.Time(fechaActual.getTime());

                    // Llamar al procedimiento para insertar en la tabla entregaIncompleta
                    String sqlEntregaIncompleta = "{CALL InsertarEntregaIncompleta(?, ?, ?, ?, ?, ?, ?, ?)}";
                    stmtEntregaIncompleta = conn.prepareCall(sqlEntregaIncompleta);
                    stmtEntregaIncompleta.setString(1, cedula);                      // Cédula
                    stmtEntregaIncompleta.setInt(2, papel);                          // Papel
                    stmtEntregaIncompleta.setInt(3, carton);                         // Cartón
                    stmtEntregaIncompleta.setInt(4, vidrio);                         // Vidrio
                    stmtEntregaIncompleta.setInt(5, textiles);                       // Textiles
                    stmtEntregaIncompleta.setInt(6, metales);                        // Metales
                    stmtEntregaIncompleta.setDate(7, fechaSQL);                      // Fecha
                    stmtEntregaIncompleta.setTime(8, horaSQL);                       // Hora

                    // Ejecutar el procedimiento
                    stmtEntregaIncompleta.executeUpdate();

                    mensajeExito = "La entrega se ha registrado correctamente.";
                } catch (SQLException e) {
                    mensajeError = "Error de conexión o consulta SQL: " + e.getMessage();
                } catch (ClassNotFoundException e) {
                    mensajeError = "Error al cargar el driver MySQL: " + e.getMessage();
                } finally {
                    try {
                        if (stmtEntregaIncompleta != null) stmtEntregaIncompleta.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        mensajeError = "Error al cerrar la conexión: " + e.getMessage();
                    }
                }
            }
        } catch (NumberFormatException e) {
            mensajeError = "Los valores no son números válidos";
        }
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Materiales Reciclables</title>
    <link rel="stylesheet" href="CSS/bodyRealizarEntrega.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Registro de Materiales Reciclables</h1>
        </div>

        <form method="post" action="RealizarEntrega.jsp">
            <div class="materials-grid">
                <!-- Papel -->
                <div class="category">
                    <div class="category-header" onclick="toggleCategory(this)">
                        <span>Papel</span>
                        <span class="toggle">▼</span>
                    </div>
                    <div class="category-content">
                        <div class="material-item">
                            <label for="Papel">Papel</label>
                            <input type="number" min="0" max="100" placeholder="Cantidad en kg" name="papel">
                        </div>
                    </div>
                </div>

                <!-- Cartón -->
                <div class="category">
                    <div class="category-header" onclick="toggleCategory(this)">
                        <span>Cartón</span>
                        <span class="toggle">▼</span>
                    </div>
                    <div class="category-content">
                        <div class="material-item">
                            <label for="Carton">Cartón</label>
                            <input type="number" min="0" max="100" placeholder="Cantidad en kg" name="carton">
                        </div>
                    </div>
                </div>

                <!-- Vidrio -->
                <div class="category">
                    <div class="category-header" onclick="toggleCategory(this)">
                        <span>Vidrio</span>
                        <span class="toggle">▼</span>
                    </div>
                    <div class="category-content">
                        <div class="material-item">
                            <label for="Vidrio">Vidrio</label>
                            <input type="number" min="0" max="100" placeholder="Cantidad en kg" name="vidrio">
                        </div>
                    </div>
                </div>

                <!-- Textiles -->
                <div class="category">
                    <div class="category-header" onclick="toggleCategory(this)">
                        <span>Textiles</span>
                        <span class="toggle">▼</span>
                    </div>
                    <div class="category-content">
                        <div class="material-item">
                            <label for="Textiles">Textiles</label>
                            <input type="number" min="0" max="100" placeholder="Cantidad en kg" name="textiles">
                        </div>
                    </div>
                </div>

                <!-- Metales -->
                <div class="category">
                    <div class="category-header" onclick="toggleCategory(this)">
                        <span>Metales</span>
                        <span class="toggle">▼</span>
                    </div>
                    <div class="category-content">
                        <div class="material-item">
                            <label for="Metales">Metales</label>
                            <input type="number" min="0" max="100" placeholder="Cantidad en kg" name="metales">
                        </div>
                    </div>
                </div>
            </div>

            <div class="buttons">
                <button type="submit" class="btn btn-primary">Registrar Entrega</button>
                <button type="button" onclick="window.history.back()" class="btn btn-secondary">Volver</button>
            </div>
        </form>

        <% if (mensajeError != null) { %>
            <p class="error-message"><%= mensajeError %></p>
        <% } else if (mensajeExito != null) { %>
            <p class="success-message"><%= mensajeExito %></p>
        <% } %>
    </div>

    <script>
        function toggleCategory(header) {
            const category = header.parentElement;
            const wasActive = category.classList.contains('active');
            
            // Close all categories
            document.querySelectorAll('.category').forEach(cat => {
                cat.classList.remove('active');
                cat.querySelector('.toggle').textContent = '▼';
            });

            // If the clicked category wasn't active, open it
            if (!wasActive) {
                category.classList.add('active');
                header.querySelector('.toggle').textContent = '▲';
            }
        }
    </script>
</body>
</html> 