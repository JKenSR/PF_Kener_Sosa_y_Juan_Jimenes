<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>¿Quiénes Somos?</title>
    <link rel="stylesheet" href="CSS/bodyQuienesSomos.css">
    <style>
        /* Fondo de la página */
        body {
            background: url("CSS/Image/QuienesSomos.png") no-repeat center center fixed;
            background-size: cover;
        }
    </style>
</head>
<body>
    <!-- Menú de navegación superior -->
    <header class="header">
        <div class="container">
            <div class="btn-menu">
                <label for="btn-menu">☰</label>
            </div>
            <div class="logo">
                <h1>Menu</h1>
            </div>
            <nav class="menu">
                <a href="MenuAplicacion.jsp">Inicio</a>
                <a href="QuienesSomos.jsp">¿Quiénes somos?</a>
                <a href="PorqueReciclar.jsp">¿Por qué reciclar?</a>
                <a href="MaterialesReciclables.jsp">¿Qué materiales son reciclables?</a>
                <a href="ImpactoReciclaje.jsp">Impacto del reciclaje</a>
            </nav>
        </div>
    </header>

    <!-- Menú lateral desplegable -->
    <input type="checkbox" id="btn-menu">
    <div class="container-menu">
        <div class="cont-menu">
            <nav>
                <a href="LoginReciclar.jsp">
                    <img src="CSS/Image/Reciclar.png" alt="Reciclar" class="icono"> Realizar entrega
                </a>
                <a href="LoginColaborador.jsp">
                    <img src="CSS/Image/MuchosUsuarios.png" alt="Colaboradores" class="icono"> Administrar entregas
                </a>
                <a href="Creditos.jsp">
                    <img src="CSS/Image/MuchosUsuarios.png" alt="Créditos" class="icono"> Créditos
                </a>
                <a href="index.jsp">
                    <img src="CSS/Image/Salir.png" alt="Cerrar sesión" class="icono"> Cerrar sesión
                </a>
                <label for="btn-menu">✖️</label>
            </nav>
        </div>
    </div>

    <!-- Sección principal de contenido -->
    <div class="background-section">
        <div class="content-overlay">
            <h1>Centro de Reciclaje JC&KJ</h1>
            <p>Somos el Centro de Reciclaje JC&KJ, una organización comprometida con el medio ambiente y dedicada a la gestión de residuos de manera responsable. Nuestro objetivo es educar a la comunidad y facilitar el proceso de reciclaje para promover un futuro más sostenible.</p>
        </div>
    </div>

    <!-- Sección Misión y Visión -->
    <section class="mision-vision-section">
        <div class="mision">
            <h2>Misión</h2>
            <p>Promover el reciclaje y la gestión sostenible de residuos, educando a la comunidad sobre la importancia de reducir el impacto ambiental y facilitando el proceso para un mundo más limpio y saludable.</p>
        </div>
        <div class="vision">
            <h2>Visión</h2>
            <p>Ser el centro de reciclaje líder en la región, reconocido por su compromiso con el medio ambiente, la innovación en procesos de reciclaje, y la educación de la comunidad hacia un estilo de vida sostenible.</p>
        </div>
    </section>

    <!-- Tabla de Contacto -->
<section class="contacto-section">
    <h2>Contáctanos</h2>
    <table class="tabla-contacto">
        <thead>
            <tr>
                <th>Sucursal</th>
                <th>Ubicación</th>
                <th>Teléfono</th>
                <th>Correo</th> <!-- Nueva columna para el correo -->
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Centro de Reciclaje JC&KJ - Sede Central</td>
                <td><a href="https://maps.app.goo.gl/vraWtjS7TSqgJwiTA" target="_blank">Ver en Google Maps</a></td>
                <td><a href="tel:+50663824488">6382-4488</a></td>
                <td><a href="mailto:cjjimenez291@gmail.com">cjjimenez291@gmail.com</a></td> <!-- Correo agregado -->
            </tr>
        </tbody>
    </table>
</section>


    <!-- Sección del video -->
    <div class="video-section">
        <h2>Conoce Más Sobre Nosotros</h2>
        <div class="video-frame">
            <video width="100%" controls>
                <source src="CSS/Video/QuienesSomos.mp4" type="video/mp4">
                Tu navegador no soporta la reproducción de videos.
            </video>
        </div>
    </div>
</body>
</html>
