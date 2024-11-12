<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.CallableStatement, java.sql.SQLException, java.sql.ResultSet" %>

<%
    String mensajeError = null;
    String usuarioForm = request.getParameter("usuario");
    String contrasenaForm = request.getParameter("contrasena");

    if (usuarioForm != null && contrasenaForm != null) {
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

            // Llamamos al procedimiento almacenado
            String sql = "{CALL VerificarUsuario(?, ?)}";
            stmt = conn.prepareCall(sql);
            stmt.setString(1, usuarioForm);
            stmt.setString(2, contrasenaForm);

            rs = stmt.executeQuery();

            if (rs.next() && rs.getString("resultado").equals("Exito")) {
                // Redirigir si el usuario y la contraseña son correctos
                response.sendRedirect("MenuAplicacion.jsp");
            } else {
                // Mostrar el mensaje de error devuelto por el procedimiento almacenado
                mensajeError = rs.getString("mensaje_error");
            }
        } catch (ClassNotFoundException e) {
            mensajeError = "Error al cargar el driver MySQL: " + e.getMessage();
        } catch (SQLException e) {
            mensajeError = "Error de conexión o consulta SQL: " + e.getMessage();
        } finally {
            try {
                if(rs != null) rs.close();
                if(stmt != null) stmt.close();
                if(conn != null) conn.close();
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
    <link rel="stylesheet" href="CSS/bodyIndex.css">
    <title>Iniciar Sesión</title>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap" rel="stylesheet">
    
    <style>
        /* Lo manejo siempre desde aqui porque da error a la hora de cargar el fondo siempre */
        body {
            width: 100%;
            height: 100%;
            font-family: 'Open Sans', sans-serif;
            background: url("CSS/Image/InicioSesionFondo.jpg") no-repeat center center fixed;
            background-size: cover;
        }
.modal {
    display: none; /* Escondido por defecto */
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    justify-content: center;
    align-items: center;
    z-index: 9999; /* Asegúrate de que el modal esté encima de otros elementos */
}

/* Estilo del contenido del modal */
.modal-content {
    background-color: #fffcfc;
    padding: 20px;
    border-radius: 5px;
    width: 300px;
    color: rgb(255, 0, 0);
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    font-weight: bold;
    text-align: center;
}

/* Estilo del botón del modal */
.modal button {
    background-color: #00c016c8;
    color: #ffffff;
    border: none;
    cursor: pointer;
    border-radius: 5px;
    font-size: 16px;
}
    </style>
</head>
<body>
    <div class="login">
        <h1>
            <img src="CSS/Image/Reciclar.png" alt="Icono de reciclaje"> Iniciar Sesión
        </h1>
        <form method="post" action="index.jsp">
            <div class="input-group">
                <input type="text" name="usuario" placeholder="Usuario" required="required" />
                <img src="CSS/Image/Usuario.png" alt="Icono de usuario" class="icon-usuario">
            </div>            

            <div class="input-group">
                <input type="password" name="contrasena" placeholder="Contraseña" required="required" />
                <img src="CSS/Image/Contraseña.png" alt="Icono de contraseña" class="icon-contrasena">
            </div>
            
            <button type="submit" class="btn btn-primary btn-block btn-large">Ingresar</button>
        </form>

        <!-- Modal para mostrar el error -->
        <div id="errorModal" class="modal">
            <div class="modal-content">
                <p id="errorMessage"></p>
                <button onclick="closeModal()">Cerrar</button>
            </div>
        </div>
    </div>

    <% if (mensajeError != null) { %>
        <script>
            // Mostrar el error si existe
            var mensajeError = "<%= mensajeError %>";
            document.getElementById("errorMessage").innerText = mensajeError;
            document.getElementById("errorModal").style.display = "flex";
            
            // Función para cerrar el modal
            function closeModal() {
                document.getElementById("errorModal").style.display = "none";
            }
        </script>
    <% } %>
</body>
</html>