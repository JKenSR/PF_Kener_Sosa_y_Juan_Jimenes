<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Menú Lateral con CSS</title>
    <link rel="stylesheet" href="CSS/bodyMenuAplicacion.css">
    <style>
        /* Mover la imagen de fondo del body aquí */
        body {
            background: url("CSS/Image/MenuPrincipal.png") no-repeat center center fixed;
            background-size: cover;
        }

        /* Fondo para el header */
        .header {
            background-color: rgba(0, 0, 0, 0.37);
            background-size: cover;
            width: 100%;
            height: 100px;
            position: fixed;
            top: 0;
            left: 0;
            border-bottom-left-radius: 20px;
            border-bottom-right-radius: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* Estilo para la frase del medio */
        .frase-medio {
            position: absolute;
            top: 30%;
            left: 50%;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            transform: translate(-50%, -50%);
            font-size: 60px;
            color: #ffffff;
            font-weight: bold;
            text-align: center;
        }

        /* Estilo para la frase adicional */
        .frase-adicional {
            position: absolute;
            top: 50%;
            left: 50%;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            transform: translate(-50%, -50%);
            font-size: 35px;
            color: #ffffff;
            font-weight: normal;
            text-align: center;
            width: 50%;
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="container">
            <div class="btn-menu">
                <label for="btn-menu">☰</label>
            </div>
            <div class="logo">
                <h1>Menu</h1>
            </div>
            <nav class="menu">
                <a href="QuienesSomos.jsp">¿Quiénes somos?</a>
                <a href="PorqueReciclar.jsp">¿Por qué reciclar?</a>
                <a href="MaterialesReciclables.jsp">¿Qué materiales son reciclables?</a>
                <a href="ImpactoReciclaje.jsp">Impacto del reciclaje</a>
            </nav>
        </div>
    </header>

    <div class="capa"></div>

    <input type="checkbox" id="btn-menu">
    <div class="container-menu">
        <div class="cont-menu">
            <nav>
                <a href="LoginReciclar.jsp" class="boton">
                    <img src="CSS/Image/Reciclar.png" alt="Icono" class="icono">
                    Realizar entrega
                </a>
                <a href="LoginColaborador.jsp" class="boton">
                    <img src="CSS/Image/MuchosUsuarios.png" alt="Icono" class="icono">
                    Administrar entregas
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

    <!-- Frase del medio -->
    <div class="frase-adicional">
        <p>Cuida el planeta, recicla y reduce, cada pequeño gesto cuenta y juntos podemos hacer una gran diferencia en la lucha contra el cambio climático.</p>
    </div>

    <!-- Frase adicional -->
    <div class="frase-medio">
        <p>El cambio esta en nosotros</p>
    </div>

</body>
</html>