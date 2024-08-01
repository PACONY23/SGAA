<%--
  Created by IntelliJ IDEA.
  User: pilih
  Date: 11/07/2024
  Time: 04:28 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String context = request.getContextPath();%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<%=context%>/css/cssFuenteLetra.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Crea tu Horario</title>
    <style>
        :root {
            --bs-body-font-family: 'Poppins', sans-serif !important;
        }
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        body {
            margin: 0;
            height: 100vh;
            width: 100%;
            background-color: white;
            display: flex;
            font-family: 'Poppins', sans-serif;
        }
        .contenido {
            width: calc(100% - 300px);
            margin-top: 100px;
            height: 600px;
            margin-left: 270px;
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
        .barra-lateral .nombre-pagina {
            width: 100%;
            height: 45px;
            display: flex;
            align-items: center;
            margin-top: 35px;
        }
        .barra-lateral .nombre-pagina img {
            margin-left: 15px;
            font-size: 50px;
        }
        .barra-lateral .nombre-pagina span {
            font-size: larger;
            opacity: 1;
            color: white;
            margin-left: 12px;
            transition: opacity 0.5s ease;
        }
        .barra-lateral .navegacion {
            margin-top: 55px;
            margin-left: 20px;
        }
        .barra-lateral .navegacion li {
            margin-top: 20px;
            list-style: none;
            display: flex;
            margin-bottom: 10px;
        }
        .barra-lateral .navegacion span {
            margin-left: 25px;
        }
        .barra-lateral .navegacion a {
            width: 100%;
            height: 50px;
            margin-left: 10px;
            display: flex;
            text-decoration: none;
            border-radius: 25px;
            color: white;
            transition: background-color 0.3s ease, color 0.3s ease, border-radius 0.3s ease;
        }
        .barra-lateral .navegacion a:hover {
            background-color: white;
            color: #141C32;
            border-top-right-radius: 0;
            border-bottom-right-radius: 0;
        }
        .barra-lateral .navegacion a:hover #perfil-img {
            content: url('<%=context%>/IMG/perfil_v.png');
        }
        .barra-lateral .navegacion a:hover #calendario-img {
            content: url('<%=context%>/IMG/calendario_v.png');
        }
        .barra-lateral .navegacion a:hover #historial-img {
            content: url('<%=context%>/IMG/historial_v.png');
        }
        .barra-lateral .navegacion img {
            margin-left: 15px;
        }
        .contenido-superior {
            width: calc(100% - 250px);
            height: 100px;
            background-color: white;
            padding: 32px 15px;
            margin-left: 250px;
            position: fixed;
        }
        .titulo-interfaz {
            width: 400px;
            height: 100px;
            font-weight: bold;
        }
        .titulo-interfaz span {
            font-size: xx-large;
            color: #141C32;
        }
        .rol-actual {
            position: fixed;
            top: 15px;
            right: 15px;
            padding: 10px 15px;
            border-radius: 5px;
            display: flex;
            align-items: center;
        }
        .rol-actual img {
            width: 40px;
            height: 40px;
        }
        .rol-actual span {
            color: #141C32;
            font-size: small;
            margin-right: 10px;
            margin-bottom: 20px;
            align-items: center;
        }
        .contenido {
            height: 700px;
        }
        h1 {
            color: #1A1A3E;
        }
        table {
            margin-left: 60px;
            border-collapse: collapse;
            width: 90%;
            max-width: 1000px;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #1E8A82;
            color: white;
        }
        td {
            background-color: #fff;
            cursor: pointer;
        }
        td:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
<div class="barra-lateral">
    <div class="nombre-pagina">
        <img src="<%=context%>/IMG/logoCalendario.png" id="cloud" class="img-fluid" style="height: 40px; width: auto"/>
        <span>UTESORATE</span>
    </div>
    <nav class="navegacion">
        <ul class="list-unstyled">
            <li>
                <a href="<%=context%>/vistas/Docente/PaginaPrincipalDocente.jsp" class="d-flex align-items-center">
                    <img id="perfil-img" src="<%=context%>/IMG/perfil_b.png" class="img-fluid" style="width: auto; height: 35px;" />
                    <span>Perfil</span>
                </a>
            </li>
            <li>
                <a href="<%=context%>/vistas/Docente/CrearHorario.jsp" class="d-flex align-items-center">
                    <img id="calendario-img" src="<%=context%>/IMG/calendario_b.png" class="img-fluid" style="width: auto; height: 35px;" />
                    <span>Mi calendario</span>
                </a>
            </li>
            <li>
                <a href="<%=context%>/vistas/Docente/HistorialDocente.jsp" class="d-flex align-items-center">
                    <img id="historial-img" src="<%=context%>/IMG/historial_b.png" class="img-fluid" style="width: auto; height: 35px;" />
                    <span>Historial</span>
                </a>
            </li>
        </ul>
    </nav>
</div>
<div class="contenido-superior">
    <div class="titulo-interfaz">
        <span>Crear horario</span>
    </div>
    <div class="rol-actual">
        <span class="rol" id="asigna_rol">Docente</span>
        <img src="imagenes/busqueda.png" alt="rol" />
    </div>
</div>
<div class="contenido">
    <table>
        <tr>
            <th>Hora</th>
            <th>Lunes</th>
            <th>Martes</th>
            <th>Miércoles</th>
            <th>Jueves</th>
            <th>Viernes</th>
        </tr>
        <tr>
            <td>7:00 - 8:00</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
        </tr>
        <tr>
            <td>9:00 - 10:00</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
        </tr>
        <tr>
            <td>10:00 - 11:00</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
        </tr>
        <tr>
            <td>11:00 - 12:00</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
        </tr>
        <tr>
            <td>12:00 - 13:00</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
        </tr>
        <tr>
            <td>13:00 - 14:00</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
        </tr>
        <tr>
            <td>14:00 - 15:00</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
        </tr>
        <tr>
            <td>15:00 - 16:00</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
        </tr>
        <tr>
            <td>16:00 - 17:00</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
        </tr>
        <tr>
            <td>17:00 - 18:00</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
        </tr>
        <tr>
            <td>18:00 - 19:00</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
        </tr>
        <tr>
            <td>19:00 - 20:00</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
        </tr>
        <tr>
            <td>20:00 - 21:00</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
            <td onclick="openModal(this)">Agregar evento</td>
        </tr>
        <!-- Más filas aquí -->
    </table>
</div>

<!-- Modal para agregar evento -->
<div class="modal fade" id="eventModal" tabindex="-1" aria-labelledby="eventModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="eventModalLabel">Agregar Evento</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="eventForm">
                    <div class="mb-3">
                        <label for="subjectInput" class="form-label">Materia</label>
                        <input type="text" class="form-control" id="subjectInput" required>
                    </div>
                    <div class="mb-3">
                        <label for="studentCount" class="form-label">Número de Alumnos</label>
                        <input type="text" class="form-control" id="studentCount" readonly>
                    </div>
                    <button type="button" class="btn btn-primary" onclick="saveEvent()">Guardar</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    let currentCell; // Variable para almacenar la celda actual

    function openModal(cell) {
        currentCell = cell;
        const modal = new bootstrap.Modal(document.getElementById('eventModal'));
        document.getElementById('subjectInput').value = cell.innerText.includes('Agregar evento') ? '' : cell.innerText;
        // Cargar el número de alumnos desde la base de datos
        document.getElementById('studentCount').value = obtenerNumeroAlumnos(); // Función para obtener el número de alumnos
        modal.show();
    }

    function saveEvent() {
        const subjectInput = document.getElementById('subjectInput').value;
        if (subjectInput) {
            currentCell.innerText = subjectInput;
            const modal = bootstrap.Modal.getInstance(document.getElementById('eventModal'));
            modal.hide();
        }
    }

    function obtenerNumeroAlumnos() {
        // Simulación de obtención de datos de la base de datos
        return 30; // Este valor debería ser obtenido de la base de datos
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
