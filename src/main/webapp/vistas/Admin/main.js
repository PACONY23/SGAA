document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById('form');

    // Manejar la validación del formulario en el envío
    form.addEventListener('submit', function(event) {
        if (!form.checkValidity()) {
            event.preventDefault();
            event.stopPropagation();
        }
        form.classList.add('was-validated');
    }, false);

    // Añadir eventos de entrada para validar los campos en tiempo real
    Array.from(form.elements).forEach(function(input) {
        input.addEventListener('input', function() {
            if (input.checkValidity()) {
                input.classList.add('is-valid');
                input.classList.remove('is-invalid');
            } else {
                input.classList.add('is-invalid');
                input.classList.remove('is-valid');
            }
        });
    });
});

