let paso = 1;
let pasoInicial = 1;
let pasoFinal = 3;

const cita = {
  id: '',
  nombre: '',
  fecha: '',
  hora: '',
  servicios: []
}


document.addEventListener('DOMContentLoaded', function() {
  iniciarApp();
});


function iniciarApp() {
  mostrarSeccion();  // Muestra y Oculta las Secciones
  tabs();  // Cambia la Sección cuando se Presionen los Tabs
  botonesPaginador();  // Agrega o Quita Botones del Paginador
  paginaAnterior();
  paginaSiguiente();

  consultarAPI();  // Consulta la API en el Backend de PHP

  idCliente();  // Añade el ID del Cliente
  nombreCliente();  // Añade el Nombre del Cliente al Objeto de cita
  seleccionarFecha();  // Añade la Fecha de la Cita en el Objeto
  seleccionarHora();  // Añade la Hora de la Cita en el Objeto

  mostrarResumen();  // Muestra el Resumen de la Cita
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

    mostrarResumen();
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


async function consultarAPI() {
  try {
    const url = 'http://localhost:3000/api/servicios';
    const resultado = await fetch(url);
    const servicios = await resultado.json();

    mostrarServicios(servicios);

   } catch (error) {
    alert(error);
  }
}


function mostrarServicios(servicios) {
  servicios.forEach(servicio => {
    const {id, nombre, precio} = servicio;

    const nombreServicio = document.createElement('P');
    nombreServicio.classList.add('nombre-servicio');
    nombreServicio.textContent = nombre;

    const precioServicio = document.createElement('P');
    precioServicio.classList.add('precio-servicio');
    precioServicio.textContent = `$${precio}`;

    const servicioDiv = document.createElement('DIV');
    servicioDiv.classList.add('servicio');
    servicioDiv.dataset.idServicio = id;

    servicioDiv.appendChild(nombreServicio);
    servicioDiv.appendChild(precioServicio);

    servicioDiv.onclick = function() {
      seleccionarServicio(servicio);
    }

    document.querySelector('#servicios').appendChild(servicioDiv);
  })
}


function seleccionarServicio(servicio) {
  const {id} = servicio;
  const {servicios} = cita;

  // Identificar el elemento al que se le da Click
  const divServicio = document.querySelector(`[data-id-servicio="${id}"]`);

  // Comprobar si un Servicio fué Agregado o Quitarlo
  if(servicios.some(agregado => agregado.id === id)) {
    // Eliminar el Servicio agregado
    cita.servicios = servicios.filter(agregado => agregado.id !== id);
    divServicio.classList.remove('seleccionado');
  } else {
    // Agregar Servicio Nuevo
    cita.servicios = [...servicios, servicio];
    divServicio.classList.add('seleccionado');
  }
}


function idCliente() {
  cita.id = document.querySelector('#id').value;
}


function nombreCliente() {
  cita.nombre = document.querySelector('#nombre').value;
}


function seleccionarFecha() {
  const inputFecha = document.querySelector('#fecha');
  inputFecha.addEventListener('input', function(e) {
    const dia = new Date(e.target.value).getUTCDay();
    
    // Evaluar si Fecha es Fin de Semana para mostrar Error
    if([6,0].includes(dia)) {
      e.target.value = '';
      mostrarAlerta('Fines de Semana No Permitidos', 'error', '.formulario');
    } else {
      cita.fecha = e.target.value;
    }
  });
}


function seleccionarHora() {
  const inputHora = document.querySelector('#hora');
  inputHora.addEventListener('input', function(e) {
    const horaCita = e.target.value;
    const hora = horaCita.split(":")[0];

    if(hora < 9 || hora > 18) {
      e.target.value = '';
      mostrarAlerta('Hora No Válida', 'error', '.formulario');
    } else {
      cita.hora = e.target.value;
    }
  });
}


function mostrarAlerta(mensaje, tipo, elemento, desaparece = true) {
  // Previene que se Genere más de una alerta
  const alertaPrevia = document.querySelector('.alerta');

  if(alertaPrevia) {
    alertaPrevia.remove();
  };

  // Scripting para Crear la Alerta
  const alerta = document.createElement('DIV');
  alerta.textContent = mensaje;
  alerta.classList.add('alerta');
  alerta.classList.add(tipo);

  const referencia = document.querySelector(elemento);
  referencia.appendChild(alerta);

  if(desaparece) {
    // Calcular Tiempo de 4 Segs. de Muestra de la Alerta
    setTimeout(() => {
      alerta.remove();
    }, 4000);
  }
}


function mostrarResumen() {
  const resumen = document.querySelector('.contenido-resumen');

  // Limpiar el Contenido del Resumen
  while(resumen.firstChild) {
    resumen.removeChild(resumen.firstChild);
  }

  if(Object.values(cita).includes('') || cita.servicios.length === 0) {  // Iterar en cita para ver si existe string vacío
    mostrarAlerta('Faltan Datos de Servicios, Fecha u hora', 'error', '.contenido-resumen', false);
  
    return;
  }

  // Formatear el DIV de Resumen
  const {nombre, fecha, hora, servicios} = cita;

  // Heading para Resumen de Servicios
  const headingServicios = document.createElement('H3');
  headingServicios.textContent = 'Resumen de Servicios';
  resumen.appendChild(headingServicios);

  // Iterar y Mostrar los Servicios
  servicios.forEach(servicio => {
    const {id, precio, nombre} = servicio;
    const contenedorServicio = document.createElement('DIV');
    contenedorServicio.classList.add('contenedor-servicio');

    const textoServicio = document.createElement('P');
    textoServicio.textContent = nombre;

    const precioServicio = document.createElement('P');
    precioServicio.innerHTML = `<span>Precio:</span> $${precio}`;

    contenedorServicio.appendChild(textoServicio);
    contenedorServicio.appendChild(precioServicio);

    resumen.appendChild(contenedorServicio);

  });

  // Heading para Resumen de Cita
  const headingCita = document.createElement('H3');
  headingCita.textContent = 'Datos del Cliente';
  resumen.appendChild(headingCita);

  const nombreCliente = document.createElement('P');
  nombreCliente.innerHTML = `<span>Nombre:</span> ${nombre}`

  // Formatear la Fecha en Español
  const fechaObj = new Date(fecha);
  const mes = fechaObj.getMonth();
  const dia = fechaObj.getDate() + 2;
  const year = fechaObj.getFullYear();

  const fechaUTC = new Date(Date.UTC(year, mes, dia));

  const opciones = {weekday: 'long', year: 'numeric', month: 'long', day: 'numeric'};
  const fechaFormateada = fechaUTC.toLocaleDateString('es-MX', opciones);

  // Crear Elementos de fecha y Hora
  const fechaCita = document.createElement('P');
  fechaCita.innerHTML = `<span>Fecha:</span> ${fechaFormateada}`

  const horaCita = document.createElement('P');
  horaCita.innerHTML = `<span>Hora:</span> ${hora} Horas`;

  // Boton para Crear una Cita
  const botonReservar = document.createElement('BUTTON');
  botonReservar.classList.add('boton');
  botonReservar.textContent = 'Reservar Cita';
  botonReservar.onclick = reservarCita;

  resumen.appendChild(nombreCliente);
  resumen.appendChild(fechaCita);
  resumen.appendChild(horaCita);

  resumen.appendChild(botonReservar);
};


async function reservarCita() {
  const {nombre, fecha, hora, servicios, id} = cita;

  const idServicios = servicios.map(servicio => servicio.id);

  const datos = new FormData();
  datos.append('fecha', fecha);
  datos.append('hora', hora);
  datos.append('servicios', idServicios);
  datos.append('usuarioId', id);

  try {
    // Petición hacia la API
    const url = 'http://localhost:3000/api/citas';
    const respuesta = await fetch(url, {
      method: 'POST',
      body: datos
    });

    const resultado = await respuesta.json();

    // console.log(resultado.resultado);

    if(resultado.resultado) {
      Swal.fire({
        icon: 'success',
        title: 'Cita Creada',
        text: 'Tu Cita fué Creada Correctamente',
        button: 'OK'
      }).then(() => {
        setTimeout(() => {
          window.location.reload();
        }, 3000);
      })
    }
  } catch (error) {
    Swal.fire({
      icon: 'error',
      title: 'Error',
      text: 'Hubo un Error al Guardar la Cita'
    })
  }
}