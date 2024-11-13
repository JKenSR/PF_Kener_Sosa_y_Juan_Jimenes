<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Materiales Reciclables</title>
    <link rel="stylesheet" href="CSS/bodyMaterialesReciclables.css">
    <style>
        /* Configura el contenedor del carrusel como fondo */
        .carousel-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100vh;
            overflow: hidden;
            z-index: -1; /* Ubica el fondo detrás del contenido */
        }

        /* Estilos para cada imagen de fondo */
        .carousel-background img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100vh;
            object-fit: cover;
            opacity: 0;
            transition: opacity 1s ease-in-out;
        }

        /* Clase para hacer visible la imagen activa */
        .carousel-background img.active {
            opacity: 1;
        }

        /* Ajuste para el contenido de la página */
        .content {
            position: relative;
            z-index: 1;
            color: #ffffff;
            padding: 20px;
        }

        /* Interlineado y justificación de texto */
        .content-overlay p, .content-overlay ul, .content-overlay li {
            line-height: 1.8;
            text-align: justify;
        }
    </style>
</head>
<body>
    <!-- Fondo de tipo carrusel -->
    <div class="carousel-background">
        <img src="CSS/Image/MaterialesReciclables1.png" alt="Imagen 1" class="active">
        <img src="CSS/Image/MaterialesReciclables2.png" alt="Imagen 2">
        <img src="CSS/Image/MaterialesReciclables3.png" alt="Imagen 3">
    </div>

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
            <div class="content-overlay">
                <h1>¿Qué Materiales Son Reciclables?</h1>
                <p>Existen diversos materiales que pueden ser reciclados y transformados en nuevos productos, contribuyendo a la reducción de residuos y la conservación de recursos naturales. Es esencial conocer cuáles materiales se pueden reciclar y cómo separarlos adecuadamente.</p>
                
                <h3>Principales Materiales Reciclables</h3>
                <ul>
                    <li><strong>Papel y Cartón:</strong> Se pueden reciclar periódicos, revistas, cajas de cartón, sobres y folletos. Reciclar una tonelada de papel ahorra hasta 17 árboles y reduce el consumo de agua.</li>
                    <li><strong>Plásticos:</strong> Botellas de agua, envases de productos de limpieza, y bolsas de plástico son reciclables. El plástico reciclado se puede convertir en fibras textiles, nuevos envases o materiales de construcción.</li>
                    <li><strong>Vidrio:</strong> Botellas y frascos de vidrio pueden reciclarse de forma indefinida sin perder calidad. Reciclar vidrio reduce el consumo de energía en la producción de nuevos envases.</li>
                    <li><strong>Metales:</strong> Las latas de aluminio y acero son materiales altamente reciclables. Reciclar una lata de aluminio ahorra el 95% de la energía en comparación con la fabricación de una nueva.</li>
                    <li><strong>Electrónicos:</strong> Dispositivos electrónicos como teléfonos y computadoras contienen materiales valiosos que pueden ser reciclados, como cobre, oro y plástico.</li>
                </ul>

                <h3>Consejos para una Separación Adecuada</h3>
                <ul>
                    <li>Asegúrate de limpiar los envases antes de reciclarlos para evitar la contaminación de otros materiales.</li>
                    <li>Separa cada tipo de material en contenedores distintos: papel, plástico, vidrio, y metales.</li>
                    <li>Consulta con tu centro de reciclaje local sobre qué materiales específicos aceptan y si es necesario clasificar más.</li>
                </ul>
            </div>
        </div>

        <!-- Sección del video -->
        <div class="video-section">
            <h2>Aprende a Separar los Materiales</h2>
            <div class="video-frame">
                <video width="100%" controls>
                    <source src="CSS/Video/MaterialesReciclables.mp4" type="video/mp4">
                    Tu navegador no soporta la reproducción de videos.
                </video>
            </div>
        </div>
    </div>

    <!-- JavaScript para el efecto de carrusel de fondo -->
    <script>
        const images = document.querySelectorAll('.carousel-background img');
        let currentIndex = 0;

        function showNextImage() {
            images[currentIndex].classList.remove('active');
            currentIndex = (currentIndex + 1) % images.length;
            images[currentIndex].classList.add('active');
        }

        setInterval(showNextImage, 2000); // Cambia cada 2 segundos
    </script>
</body>
</html>

