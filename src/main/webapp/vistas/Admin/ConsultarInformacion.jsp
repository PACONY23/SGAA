<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String context = request.getContextPath();%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%--<link rel="stylesheet" href="<%=context%>/css/cssPlantillaBarra.css" />--%>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="<%=context%>/css/cssFuenteLetra.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Consulta Información</title>
    <style>
        /* ESTILO DE PLANTILLABARRA*/
        :root{
            --bs-body-font-family: 'Poppins', sans-serif !important;
        }
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        body{
            margin: 0;
            height: 100vh;
            width: 100%;
            background-color: white;
            display: flex; /* Usar flexbox para el diseño */
            font-family: 'Poppins', sans-serif;
        }
        .contenido {
            width: calc(100% - 300px);
            margin-top: 100px; /* Ajusta según sea necesario */
            height: 600px; /* Ajusta según sea necesario */
            margin-left: 270px; /* Ajusta para evitar solapamiento con la barra lateral */
        }
        .barra-lateral {
            width: 250px;
            height: 100%;
            overflow: hidden;
            background-color: #141C32;
            transition: width 0.5s ease;
            position: fixed;
            top: 0;
        }
        /*nombre de la pagina*/
        .barra-lateral .nombre-pagina{
            width: 100%;
            height: 45px;
            display: flex;
            align-items: center;
            margin-top: 35px;
        }
        .barra-lateral .nombre-pagina img{
            margin-left: 15px;
            font-size: 50px;
        }
        .barra-lateral .nombre-pagina span{
            font-size: larger;
            opacity: 1;
            color: white;
            margin-left: 12px;
            transition: opacity 0.5s ease;
        }

        /*Menu de navegacion*/
        .barra-lateral .navegacion{
            margin-top: 50px;
            margin-right: 0;
            margin-left: 20px;
        }
        .barra-lateral .navegacion li{
            margin-top: 20px;
            list-style: none;
            display: flex;
            margin-bottom: 5px;
            margin-right: 0;
        }
        .barra-lateral .navegacion span{
            margin-left: 25px;
        }
        .barra-lateral .navegacion a{
            width: 100%;
            height: 50px;
            margin-left: 10px;
            display: flex;
            text-decoration: none;
            border-radius: 25px;
            color: white;
            transition: background-color 0.3s ease, color 0.3s ease, border-radius 0.3s ease;
        }
        .barra-lateral .navegacion a:hover{
            margin-right: 0;
            background-color: white;
            color: #141C32;
            border-top-right-radius: 0; /* Quitar radio del borde superior derecho */
            border-bottom-right-radius: 0; /* Quitar radio del borde inferior derecho */
        }

        .barra-lateral .navegacion a:hover #perfil-img {
            content: url('<%=context%>/IMG/perfil_v.png'); /* Cambia la imagen al hacer hover */
        }
        .barra-lateral .navegacion a:hover #materias-img {
            content: url('<%=context%>/IMG/materias_v.png'); /* Cambia la imagen al hacer hover */
        }
        .barra-lateral .navegacion a:hover #solicitud-acceso{
            content: url('<%=context%>/IMG/solicitud_v.png'); /* Cambia la imagen al hacer hover */
        }
        .barra-lateral .navegacion a:hover #asesorias-img{
            content: url('<%=context%>/IMG/asesorias_v.png'); /* Cambia la imagen al hacer hover */
        }
        .barra-lateral .navegacion a:hover #historial-img {
            content: url('<%=context%>/IMG/historial_v.png'); /* Cambia la imagen al hacer hover */
        }

        .barra-lateral .navegacion img{
            margin-left: 15px;
        }
        .contenido-superior{
            width: calc(100% - 250px); /* Resto del ancho de barra-lateral */
            height: 100px; /* Ajustar la altura según se necesite */
            overflow: hidden;
            background-color: white;
            padding: 32px 15px;
            margin-left: 250px;
            position: fixed;
        }
        .titulo-interfaz{
            width: 400px;
            height: 100px;
            font-weight: bold;
        }
        .titulo-interfaz span{
            font-size: xx-large;
            color: #141C32; /* Añadir color para que el texto sea visible */
        }
        .rol-actual{
            position: fixed; /* Posiciona este div de manera absoluta */
            top: 15px; /* Ajusta según la necesidad */
            right: 15px; /* Ajusta según la necesidad */
            padding: 10px 15px; /* Añadir padding si es necesario */
            border-radius: 5px;
            display: flex;
            align-items: center;
        }
        .rol-actual img{
            width: 40px;
            height: 40px;
        }
        .rol-actual span{
            color: #141C32;
            font-size: small;
            margin-right: 10px;
            top: 0;
            margin-bottom: 20px;
            align-items: center;
        }




        .cuadro {
            margin-top: 30px;
            margin-left: 250px;
            background-color: #141C32;
            padding: 40px;
            border-radius: 80px;
            color: white;
            width: 100%;
            max-width: 550px;
            height: 450px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .cuadro h2 {
            margin: 0 0 20px 0;
            font-size: 1.5em;
        }
        .cuadro input {
            width: 80%;
            padding: 10px;
            margin-bottom: 30px;
            background-color: #141C32;
            color: white;
            border: 1px solid #fff;
            border-radius: 5px;
        }
        .cuadro .botones {
            display: flex;
            justify-content: center;
            width: 60%;
            margin-top: 40px;
        }
        .cuadro .botones button {
            padding: 10px 20px;
            border: none;
            border-radius: 20px;
            background-color: #1D815A;
            color: white;
            cursor: pointer;
        }
        .cuadro .botones button:hover {
            background-color: #145A42;
        }
    </style>
</head>
<body>
<!-- Barra lateral -->
<div class="barra-lateral">
    <div class="nombre-pagina">
        <img src="<%=context%>/IMG/logoCalendario.png" id="cloud" class="img-fluid" style="height: 40px; width: auto"/>
        <span>UTESORATE</span>
    </div>
    <nav class="navegacion">
        <ul class="list-unstyled">
            <li>
                <a href="<%=context%>/vistas/Admin/PaginaPrincipalAdmin.jsp" class="d-flex align-items-center">
                    <img id="perfil-img" src="<%=context%>/IMG/perfil_b.png" class="img-fluid" style="width: auto; height: 35px;" />
                    <span>Perfil</span>
                </a>
            </li>
            <li>
                <a href="<%=context%>/vistas/Admin/GestionDeMaterias.jsp" class="d-flex align-items-center">
                    <img id="materias-img" src="<%=context%>/IMG/materias_b.png" class="img-fluid" style="width: auto; height: 35px;" />
                    <span>Gestión de materias</span>
                </a>
            </li>
            <li>
                <a href="<%=context%>/vistas/Admin/AprobarRegistro.jsp" class="d-flex align-items-center" >
                    <img id="solicitud-acceso" src="<%=context%>/IMG/solicitud_b.png" class="img-fluid" style="width: auto; height: 35px;" />
                    <span>Solicitud de acceso</span>
                </a>
            </li>
            <li>
                <a href="<%=context%>/vistas/Admin/GestionAsesorias.jsp" class="d-flex align-items-center" >
                    <img id="asesorias-img" src="<%=context%>/IMG/asesorias_b.png" class="img-fluid" style="width: auto; height: 35px;" />
                    <span>Gestión de asesorías</span>
                </a>
            </li>
            <li>
                <a href="<%=context%>/vistas/Admin/ConsultarInformacion.jsp" class="d-flex align-items-center" >
                    <img id="historial-img" src="<%=context%>/IMG/historial_b.png" class="img-fluid" style="width: auto; height: 35px;" />
                    <span>Información de usuarios</span>
                </a>
            </li>
        </ul>
    </nav>
</div>
<div class="contenido-superior">
    <div class="titulo-interfaz">
        <span></span>
    </div>
    <div class="rol-actual">
        <span class="rol" id="asigna_rol">Administrador</span>
        <img src="imagenes/busqueda.png" alt="rol" />
    </div>
</div>

<div class="contenido">
    <div class="cuadro">
        <h2>Consulta el usuario</h2>
        <input id="matricula" type="text" placeholder="matricula">
        <input id="rol-usuario" type="text" placeholder="rol usuario">
        <div class="botones">
            <button id="consultar-btn" data-toggle="modal" data-target="#consultarModal">Consultar</button>
        </div>
    </div>
</div>

<!-- Modal de consulta -->
<div class="modal fade" id="consultarModal" tabindex="-1" role="dialog" aria-labelledby="consultarModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="consultarModalLabel">Acerca de:</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3">
                            <label for="nombre">Nombre:</label>
                            <input type="text" id="nombre" class="form-control" readonly>
                        </div>
                        <div class="col-md-3">
                            <label for="email">Email:</label>
                            <input type="email" id="email" class="form-control" readonly>
                        </div>
                        <div class="col-md-3">
                            <label for="rol">Rol:</label>
                            <input type="text" id="rol" class="form-control" readonly>
                        </div>
                        <div class="col-md-3">
                            <label for="estado">Estado:</label>
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" id="estado">
                                <label class="form-check-label" for="estado">Activo</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" id="guardar-cambios">Guardar cambios</button>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    $('#consultar-btn').on('click', function() {
        // Simulación de datos del usuario
        var usuario = {
            nombre: 'Juan Pérez',
            email: 'juan.perez@example.com',
            rol: 'Estudiante',
            estado: true
        };

        $('#nombre').val(usuario.nombre);
        $('#email').val(usuario.email);
        $('#rol').val(usuario.rol);
        $('#estado').prop('checked', usuario.estado);
    });

    $('#guardar-cambios').on('click', function() {
        var estado = $('#estado').is(':checked');
        alert('El estado del usuario se ha cambiado a: ' + (estado ? 'Activo' : 'Inactivo'));
        $('#consultarModal').modal('hide');
    });
</script>
</body>
</html>
