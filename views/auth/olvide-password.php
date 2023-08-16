<h1 class="nombre-pagina">Olvido de Password</h1>
<p class="descripcion-pagina">Reestablece tu Password escribiendo tu Email a Continuación</p>

<form action="/olvide" class="formulario" method="POST">

  <div class="campo">
    <label for="email">Email</label>
    <input 
      type="email" 
      name="email"
      id="email"
      placeholder="Tu Email"
    />
  </div>

  <input type="submit" class="boton" value="Enviar Instrucciones"/>

</form>

<div class="acciones">
  <a href="/">¿Ya Tienes una Cuenta? Inicia Sesión</a>
  <a href="/crear-cuenta">¿Aún No Tienes una Cuenta? Crear Una</a>
</div>