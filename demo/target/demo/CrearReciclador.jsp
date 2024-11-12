<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.CallableStatement, java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="CSS/bodyCrearReciclador.css">
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
    <div class="container">
        <h1>Crear Usuario</h1>

        <% 
            String cedula = request.getParameter("cedula");
            String nombre1 = request.getParameter("nombre1");
            String nombre2 = request.getParameter("nombre2");
            String apellido1 = request.getParameter("apellido1");
            String apellido2 = request.getParameter("apellido2");
            String mensajeExito = null;
            String mensajeError = null;

            if (cedula != null && nombre1 != null && apellido1 != null) {
                Connection conn = null;
                CallableStatement stmt = null;

                try {
                    // Establecer conexión
                    String URL = "jdbc:mysql://localhost:3306/centro_reciclaje?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
                    String usuarioDB = "JKenS";
                    String contrasenaDB = "JKen0407";

                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(URL, usuarioDB, contrasenaDB);

                    // Llamar al procedimiento almacenado
                    String sql = "{CALL GuardarReciclador(?, ?, ?, ?, ?)}";
                    stmt = conn.prepareCall(sql);

                    // Establecer los parámetros del procedimiento
                    stmt.setString(1, cedula);
                    stmt.setString(2, nombre1);
                    stmt.setString(3, nombre2);
                    stmt.setString(4, apellido1);
                    stmt.setString(5, apellido2);

                    // Ejecutar el procedimiento almacenado
                    stmt.execute();

                    mensajeExito = "Usuario guardado exitosamente.";

                    // Redirigir al LoginReciclar.jsp después de guardar
                    response.sendRedirect("LoginReciclar.jsp");

                } catch (ClassNotFoundException e) {
                    mensajeError = "Error al cargar el driver MySQL: " + e.getMessage();
                    request.setAttribute("mensajeError", mensajeError);
                } catch (SQLException e) {
                    mensajeError = " " + e.getMessage();
                    request.setAttribute("mensajeError", mensajeError);
                } finally {
                    try {
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        mensajeError = "Error al cerrar la conexión: " + e.getMessage();
                        request.setAttribute("mensajeError", mensajeError);
                    }
                }
            }
        %>

        <!-- Mostrar mensaje de éxito o error -->
        <% if (mensajeExito != null) { %>
            <p style="color:green;"><%= mensajeExito %></p>
        <% } else if (mensajeError != null) { %>
            <p style="color:red;"><%= mensajeError %></p>
        <% } %>

        <form id="createUserForm" method="post" action="CrearReciclador.jsp" onsubmit="return confirmSubmit();">
            <div class="input-group">
                <label for="cedula">Cédula</label>
                <input type="text" id="cedula" name="cedula" pattern="\d{9}" title="Ingresa los 9 dígitos de la cédula" required>
            </div>
            <div class="input-group">
                <label for="nombre1">Primer nombre</label>
                <input type="text" id="nombre1" name="nombre1" required>
            </div>
            <div class="input-group">
                <label for="nombre2">Segundo nombre</label>
                <input type="text" id="nombre2" name="nombre2">
            </div>
            <div class="input-group">
                <label for="apellido1">Primer apellido</label>
                <input type="text" id="apellido1" name="apellido1" required>
            </div>
            <div class="input-group">
                <label for="apellido2">Segundo apellido</label>
                <input type="text" id="apellido2" name="apellido2">
            </div>
            <div class="button-group">
                <button type="submit">Guardar</button>
                <button type="button" onclick="volver()">Volver</button>
            </div>
        </form>
    </div>

    <!-- Modal de confirmación -->
    <div id="confirmModal" class="modal">
        <div class="modal-content">
            <p>¿Estás seguro de que deseas guardar este usuario?</p>
            <button onclick="submitForm()">Sí</button>
            <button class="close" onclick="closeModal()">No</button>
        </div>
    </div>

    <script>
        function confirmSubmit() {
            document.getElementById('confirmModal').style.display = 'flex';
            return false;
        }

        function submitForm() {
            document.getElementById('createUserForm').submit();
        }

        function closeModal() {
            document.getElementById('confirmModal').style.display = 'none';
        }

        function volver() {
            window.location.href = 'LoginReciclar.jsp';
        }
    </script>

</body>
</html>
