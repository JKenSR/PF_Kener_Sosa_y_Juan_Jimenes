<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Créditos</title>
    <link rel="stylesheet" href="CSS/bodyCreditos.css">
    <style>
        /* Fondo de la página */
        body {
            background: url("CSS/Image/CreditosFondo.png") no-repeat center center fixed;
            background-size: cover;
        }

        /* Estilos para los creadores */
        .creadores-section {
            display: flex;
            justify-content: space-around;
            padding: 20px;
            text-align: center;
            background-color: rgba(144, 163, 157, 0.8); /* Fondo blanco semi-transparente */
            border-radius: 10px; /* Bordes redondeados para darle un mejor diseño */
            margin: 20px;
        }

        .creador {
            width: 45%;
        }

        .creador img {
            width: 341px; /* Ancho reducido a un tercio del tamaño original */
            height: 439px; /* Alto reducido a un tercio del tamaño original */
            margin-bottom: 10px;
        }

        /* Estilo para el agradecimiento */
        .agradecimiento-section {
            text-align: center;
            padding: 20px;
        }

        /* Justificar el texto del primer párrafo de créditos */
        .content-overlay p {
            text-align: justify;
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

    <!-- Sección de Créditos -->
    <div class="background-section">
        <div class="content-overlay">
            <h1>Créditos del Proyecto</h1>
            <p>Agradecemos a todos los que han contribuido a hacer realidad este proyecto. 
                Este trabajo es el resultado de un esfuerzo colaborativo y estamos profundamente 
                agradecidos por el apoyo recibido tanto por el profesor: MCI. Douglas Sánchez Artola, así como
                por aquellas personas que nos han apoyado a lo largo de este camino, como lo son nuestros compañeros y familiares.
            </p>
        </div>
    </div>

    <!-- Sección de Creadores con Fondo Semi-Transparente -->
    <section class="creadores-section">
        <div class="creador">
            <img src="CSS/Image/JuanCarlos.png" alt="Juan Carlos">
            <h2>Juan Carlos Jiménez</h2>
            <p>DBA</p>
            <p>Programador</p>
        </div>
        <div class="creador">
            <img src="CSS/Image/Kener.png" alt="Kener">
            <h2>Kener Sosa</h2>
            <p>DBA</p>
            <p>Programador</p>
        </div>
    </section>

    <!-- Agradecimiento Final -->
    <section class="agradecimiento-section">
        <h2>Proyecto Final de bases de datos 2024 - UCR SEDE GUANACASTE - II SEMESTRE</h2>
        <p>"La verdadera sabiduría está en reconocer la propia ignorancia." – Sócrates.</p>
    </section>
</body>
</html>
