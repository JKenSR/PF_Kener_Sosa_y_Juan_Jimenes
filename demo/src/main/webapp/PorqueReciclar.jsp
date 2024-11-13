<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>¿Por qué Reciclar?</title>
    <link rel="stylesheet" href="CSS/bodyPorQueReciclar.css">
    <style>
        /* Fondo de la página con fondo negro */
        body {
            background: black; /* Color de fondo negro para el área que no cubra la imagen */
        }

        /* Configuración de la imagen de fondo */
        .background-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url("CSS/Image/PorQueReciclar.png") no-repeat center center;
            background-size: contain; /* Muestra la imagen en su tamaño completo, ajustada al contenedor */
            background-color: rgb(4, 44, 18); /* Color de fondo negro para el área no cubierta */
            z-index: -1; /* Asegura que el fondo esté detrás del contenido */
        }

        /* Ajustes de contenido */
        .content {
            position: relative;
            z-index: 1; /* Coloca el contenido sobre el fondo */
            color: #ffffff;
            padding: 20px;
        }

        /* Interlineado para la sección ¿Por qué Reciclar? */
        .content-overlay p, .content-overlay ul, .content-overlay li {
            line-height: 1.9;
        }
    </style>
</head>
<body>
    <!-- Contenedor de fondo -->
    <div class="background-container"></div>

    <!-- Contenido de la página -->
    <div class="content">
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
            <div class="content-overlay" style="text-align: justify;">
                <h1>¿Por qué Reciclar?</h1>
                <p>El reciclaje es una práctica esencial para proteger el medio ambiente, ahorrar energía y reducir el impacto de los residuos en nuestro planeta. Además de reducir la contaminación, el reciclaje permite la reutilización de materiales y la conservación de recursos naturales.</p>
                
                <p><br></p>

                <h3>Beneficios Clave del Reciclaje</h3>
                <ul>
                    <li><strong>Conservación de recursos naturales:</strong> Reciclar un tonelada de papel puede ahorrar 17 árboles y 26,000 litros de agua.</li>
                    <li><strong>Reducción de residuos:</strong> Cada año, el reciclaje reduce la cantidad de residuos en los vertederos, ahorrando espacio y reduciendo la contaminación.</li>
                    <li><strong>Ahorro de energía:</strong> Reciclar aluminio ahorra hasta un 95% de la energía necesaria para producir aluminio nuevo.</li>
                    <li><strong>Beneficios económicos:</strong> La industria del reciclaje crea empleos en áreas como la recolección, procesamiento y venta de materiales reciclables.</li>
                </ul>

                <p><br></p>

                <h3>Impacto Ambiental del Reciclaje en Números</h3>
                <ul>
                    <li>Cada tonelada de papel reciclado ahorra hasta un 60% de la energía necesaria para producir papel nuevo.</li>
                    <li>Reciclar una sola botella de vidrio ahorra suficiente energía para alimentar una bombilla de 100 vatios durante 4 horas.</li>
                    <li>Reciclar plásticos ayuda a reducir la producción de plástico nuevo, que utiliza un 80% más de energía que el reciclaje.</li>
                    <li>Los productos reciclados pueden reducir las emisiones de CO₂ en un 30% en comparación con los productos nuevos.</li>
                </ul>
            </div>
        </div>

        <!-- Sección del video -->
        <div class="video-section">
            <h2>Descubre la Importancia del Reciclaje</h2>
            <div class="video-frame">
                <video width="100%" controls>
                    <source src="CSS/Video/PorQueReciclar.mp4" type="video/mp4">
                    Tu navegador no soporta la reproducción de videos.
                </video>
            </div>
        </div>
    </div>
</body>
</html>
