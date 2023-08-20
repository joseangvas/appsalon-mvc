<h1 class="nombre-pagina">Reestablecer Password</h1>
<p class="descripcion-pagina">coloca tu Nuevo Password a Continuación</p>

<?php 
  include_once __DIR__ . "/../templates/alertas.php";
?>

<?php if($error) return; ?>

<form class="formulario" method="POST">
  <div class="campo">
    <label for="password">Password</label>
    <input 
      type="password"
      id="password"
      name="password"
      placeholder="Tu Nuevo Password"
    />
  </div>
  <input type="submit" class="boton" value="Guardar Nuevo Password">
</form>

<div class="acciones">
  <a href="/">¿Ya Tienes Cuenta? Iniciar Sesión</a>
  <a href="/crear-cuenta">¿Aún No tienes Cuenta? Crear Una</a>
</div>

