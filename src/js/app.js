let paso = 1;

document.addEventListener('DOMContentLoaded', function() {
  iniciarApp();
});

function iniciarApp() {
  tabs();  // Cambia la Sección cuando se Presionen los Tabs
};

function mostrarSeccion() {
  // Ocultar la Sección que tenga la Clase de mostrar
  const seccionAnterior = document.querySelector('.mostrar');
  if(seccionAnterior) {
    seccionAnterior.classList.remove('mostrar');
  }

  // Seleccionar la Sección con el paso
  const pasoSelector = `#paso-${paso}`;
  const seccion = document.querySelector(pasoSelector);
  seccion.classList.add('mostrar');
}

function tabs() {
  const botones = document.querySelectorAll('.tabs button');
  botones.forEach(boton => {
    boton.addEventListener('click', function(e) {
      paso = parseInt(e.target.dataset.paso);

      mostrarSeccion();
    });
  });
};