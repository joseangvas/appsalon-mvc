let paso = 1;
let pasoInicial = 1;
let pasoFinal = 3;

document.addEventListener('DOMContentLoaded', function() {
  iniciarApp();
});


function iniciarApp() {
  mostrarSeccion();  // Muestra y Oculta las Secciones
  tabs();  // Cambia la Sección cuando se Presionen los Tabs
  botonesPaginador();  // Agrega o Quita Botones del Paginador
  paginaAnterior();
  paginaSiguiente();
};


function mostrarSeccion() {
  // Ocultar la Sección que tenga la Clase de mostrar
  const seccionAnterior = document.querySelector('.mostrar');
  if(seccionAnterior) {
    seccionAnterior.classList.remove('mostrar');
  }

  // Seleccionar la Sección con el paso...
  const pasoSelector = `#paso-${paso}`;
  const seccion = document.querySelector(pasoSelector);
  seccion.classList.add('mostrar');

  // Quita la Clase de actual al tab anterior
  const tabAnterior = document.querySelector('.actual');
  if (tabAnterior) {
    tabAnterior.classList.remove('actual');
  }

  // Resalta el Tab Actual
  const tab = document.querySelector(`[data-paso="${paso}"]`);
  tab.classList.add("actual");
}


function tabs() {
  const botones = document.querySelectorAll('.tabs button');
  botones.forEach(boton => {
    boton.addEventListener('click', function(e) {
      paso = parseInt(e.target.dataset.paso);

      mostrarSeccion();
      botonesPaginador();
    });
  });
};


function botonesPaginador() {
  const paginaAnterior = document.querySelector('#anterior');
  const paginaSiguiente = document.querySelector('#siguiente');

  if (paso === 1) {
    paginaAnterior.classList.add('ocultar');
    paginaSiguiente.classList.remove('ocultar');
  } else if (paso === 3) {
    paginaAnterior.classList.remove('ocultar');
    paginaSiguiente.classList.add('ocultar');
  } else {
    paginaAnterior.classList.remove('ocultar');
    paginaSiguiente.classList.remove('ocultar');
  }

  mostrarSeccion();
}

function paginaAnterior() {
  const paginaAnterior = document.querySelector('#anterior');
  paginaAnterior.addEventListener('click', function(e) {
    if (paso <= pasoInicial) return;
    paso--;
    botonesPaginador();
  });
};

function paginaSiguiente() {
  const paginaSiguiente = document.querySelector('#siguiente');
  paginaSiguiente.addEventListener('click', function(e) {
    if (paso >= pasoFinal) return;
      paso++;
      botonesPaginador();
  });
};
