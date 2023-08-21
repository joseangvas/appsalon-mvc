<h1 class="nombre-pagina">Crear Nueva Cita</h1>
<p class="descripcion-pagina">Elige tus Servicios y Coloca tus Datos</p>

<div id="app">
  <div id="paso-1" class="seccion">
    <h2>Servicios</h2>
    <p class="text-center" >Elige tus Servicios a Continuación</p>
  </div>

  <div id="servicios" class="listado-servicios">

  </div>

  <div id="paso-2" class="seccion">
    <h2>Tus Datos y Cita</h2>
    <p class="text-center" >Coloca tus Datos y Fecha de tu Cita</p>

    <form action="" class="formulario">
      <div class="campo">
        <label for="nombre" class="nombre">Nombre</label>
        <input 
          type="text"
          id="nombre"
          placeholder="Tu Nombre"
          value="<?php echo $nombre; ?>"
          disabled
        />
      </div>

      <div class="campo">
        <label for="fecha" class="fecha">Fecha</label>
        <input 
          type="date"
          id="fecha"
        />
      </div>

      <div class="campo">
        <label for="hora" class="hora">Hora</label>
        <input 
          type="time"
          id="hora"
        />
      </div>
    </form>
  </div>

  <div id="paso-3" class="seccion">
    <h2>Resumen</h2>
    <p>Verifica que la Información sea Correcta</p>
  </div>
</div>