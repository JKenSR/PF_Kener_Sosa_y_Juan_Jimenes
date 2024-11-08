<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Menú Lateral con CSS</title>
    <link rel="stylesheet" href="CSS/bodyMenuAplicacion.css">
</head>
<body>
    <header class="header">
        <div class="container">
            <div class="btn-menu">
                <label for="btn-menu">☰</label>
            </div>
            <div class="logo">
                <h1>Seguridad Vial</h1>
            </div>
            <nav class="menu">
                <a href="ConsejosSeguridad.jsp">Consejos seguridad</a>
                <a href="BeneficiosTransporte.jsp">Beneficios transporte</a>
                <a href="BeneficiosBicicleta.jsp">Beneficios bicicleta</a>
                <a href="EducacionSenales.jsp">Educación señales</a>
            </nav>
        </div>
    </header>
    <div class="capa"></div>
    
    <input type="checkbox" id="btn-menu">
    <div class="container-menu">
        <div class="cont-menu">
            <nav>
                <a href="Examen.jsp" class="boton">
                    <img src="CSS/Image/MuchosUsuarios.png" alt="Icono" class="icono">
                    Examen
                </a>
                <a href="Calificaciones.jsp" class="boton">
                    <img src="CSS/Image/MuchosUsuarios.png" alt="Icono" class="icono">
                    Calificaciones
                </a>
                <a href="Creditos.jsp" class="boton">
                    <img src="CSS/Image/MuchosUsuarios.png" alt="Icono" class="icono">
                    Créditos
                </a>
                
                <a href="index.jsp" class="botonCerrar">
                    <img src="CSS/Image/Salir.png" alt="Icono" class="icono">
                    Cerrar sesión
                </a>
            </nav>
            <label for="btn-menu">✖️</label>
        </div>
    </div>

    <div class="main-content">
        <div class="video-container">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/u1MLo3BTHBo?si=j9FVVXZYyMma8A7E" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>
    </div>
</body>
</html>
