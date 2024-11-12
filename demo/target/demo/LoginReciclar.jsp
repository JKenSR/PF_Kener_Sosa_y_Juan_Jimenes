<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.CallableStatement, java.sql.SQLException, java.sql.ResultSet" %>

<%
    String mensajeError = null;
    String cedulaForm = request.getParameter("cedula");

    if (cedulaForm != null) {
        String URL = "jdbc:mysql://localhost:3306/centro_reciclaje?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
        String usuarioDB = "JKenS";
        String contrasenaDB = "JKen0407";

        Connection conn = null;
        CallableStatement stmt = null;
        ResultSet rs = null;

        try {
            // Cargar el driver actualizado
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, usuarioDB, contrasenaDB);

            // Llamamos al procedimiento almacenado VerificarReciclador
            String sql = "{CALL VerificarReciclador(?)}";
            stmt = conn.prepareCall(sql);
            stmt.setString(1, cedulaForm);

            // Ejecutar el procedimiento y obtener el resultado
            rs = stmt.executeQuery();

            // Si el reciclador existe (es decir, existe > 0), redirigir a PerfilReciclador.jsp
            if (rs.next() && rs.getInt("existe") > 0) {
                session.setAttribute("cedula", cedulaForm);
                response.sendRedirect("PerfilReciclador.jsp");
                return; // Para evitar que siga procesando después de redirigir
            } else {
                mensajeError = "Error: El usuario no existe. Por favor verifica tu cédula o regístrate.";
            }

        } catch (SQLException e) {
            mensajeError = "Error de conexión o consulta SQL: " + e.getMessage();
        } catch (ClassNotFoundException e) {
            mensajeError = "Error al cargar el driver MySQL: " + e.getMessage();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                mensajeError = "Error al cerrar la conexión: " + e.getMessage();
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="CSS/bodyLoginReciclar.css">
    <title>Ingresar</title>
</head>
<body>
    <div class="login">
        <h1>
            <img src="CSS/Image/Reciclar.png" alt="Icono de reciclaje"> Ingresar
        </h1>
        <form method="post" action="">
            <div class="input-group">
                <input type="text" name="cedula" id="cedula" placeholder="Cédula" required="required" 
                pattern="\d{9}" title="Ingresa los 9 dígitos de la cédula" maxlength="9" />
                <img src="CSS/Image/Usuario.png" alt="Icono de usuario" class="icon-usuario">
            </div>
            <button type="submit" class="btn btn-primary btn-block btn-large">Ingresar</button>
            <button type="button" class="btn btn-secondary btn-block btn-large" onclick="volver()">Volver</button>
            <p>¿No tienes usuario? <a href="CrearReciclador.jsp">Crear usuario</a></p>
        </form>

        <div id="errorModal" class="modal">
            <div class="modal-content">
                <p id="errorMessage"></p>
                <button onclick="closeModal()">Cerrar</button>
            </div>
        </div>
    </div>

    <% if (mensajeError != null) { %>
        <script>
        
            var mensajeError = "<%= mensajeError %>";
            document.getElementById("errorMessage").innerText = mensajeError;
            document.getElementById("errorModal").style.display = "flex";
            
            function closeModal() {
                document.getElementById("errorModal").style.display = "none";
            }
        </script>
    <% } %>

    <script>
        function volver() {
            window.location.href = 'MenuAplicacion.jsp';
        }
    </script>
</body>
</html>
