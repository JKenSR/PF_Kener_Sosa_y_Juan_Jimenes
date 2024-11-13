<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Impacto del Reciclaje</title>
    <link rel="stylesheet" href="CSS/bodyImpactoReciclaje.css">
    <style>
        /* Fondo de la página y estilo de texto */
        body {
            background: url("CSS/Image/ImpactoReciclaje.png") no-repeat center center fixed;
            background-size: cover;
            line-height: 2; /* Interlineado de 2 */
            color: #ffffff; /* Color de texto para mejorar la legibilidad */
        }
        .content-overlay {
            text-align: justify; /* Justificación del texto */
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
                <h1>Menú</h1>
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
            <h1>Impacto del Reciclaje en el Medio Ambiente</h1>
            <p>El reciclaje es una herramienta poderosa para mitigar el cambio climático y reducir la contaminación. Cada material reciclado representa una reducción de residuos y un ahorro de energía significativo en la producción de nuevos productos.</p>
            
            <h3>Beneficios del Reciclaje</h3>
            <p><strong>Reducción de residuos en vertederos:</strong> Al reciclar, disminuye la cantidad de basura que se acumula en vertederos, ayudando a prevenir la contaminación del suelo y del agua.</p>
            <p><strong>Conservación de recursos naturales:</strong> Reciclar papel, vidrio, y plástico permite reducir la extracción de materias primas, como árboles y minerales, preservando el medio ambiente.</p>
            <p><strong>Ahorro energético:</strong> Producir materiales reciclados consume menos energía que fabricar productos desde cero, lo que reduce las emisiones de carbono.</p>
            <p><strong>Economía circular:</strong> El reciclaje impulsa una economía circular en la que los productos son reutilizados y reciclados, promoviendo un consumo más sostenible.</p>
            
            <br>

            <h3>Ejemplo: Reciclaje en San José, Costa Rica</h3>
            <p>En San José, Costa Rica, se implementaron estaciones de reciclaje en diversos puntos de la ciudad, alentando a la ciudadanía a separar los desechos y llevarlos a estos centros. Este programa, en conjunto con campañas de concientización, ha logrado reducir el volumen de residuos sólidos urbanos en un 15% desde su implementación en 2018.</p>
            <p>Los materiales recolectados son procesados en plantas de reciclaje locales, donde son convertidos en nuevos productos, disminuyendo la necesidad de materias primas vírgenes y generando empleo en la comunidad. Además, la recolección y reciclaje de desechos electrónicos han tenido un impacto positivo en la reducción de contaminantes peligrosos, contribuyendo a un ambiente más limpio y saludable para la población.</p>
        </div>
    </div>

    <!-- Sección del video -->
    <div class="video-section">
        <h2>Impacto Ambiental del Reciclaje</h2>
        <div class="video-frame">
            <iframe width="100%" height="315" src="https://www.youtube.com/embed/_PL_ECPWndo" title="Impacto del Reciclaje" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>
    </div>
</body>
</html>
