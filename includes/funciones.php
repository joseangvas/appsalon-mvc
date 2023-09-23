<?php

//* Para Hacer Pruebas de Código
function debuguear($variable): string {
  echo "<pre>";
  var_dump($variable);
  echo "</pre>";
  exit;
}


//* Escapa / Sanitizar el HTML
function s($html) : string {
  $s = htmlspecialchars($html);
  return $s;
}


//* Comprobar cuando se muestra el Ultimo Servicio de un Cliente
function esUltimo(string $actual, string $proximo): bool {
  if($actual !== $proximo) {
    return true;
  }
  return false;
}


//* comprobar que el Usuario esté Autenticado
function isAuth() : void {
  if(!isset($_SESSION['login'])) {
    header('Location: /');
  }
}


function isAdmin() : void {
  if(!isset($_SESSION['admin'])) {
    header('Location: /');
  }
}
