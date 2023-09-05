<?php

namespace Controllers;

use MVC\Router;

class CitaController {
  public static function index(Router $router) {

    session_start();

    // Comprobar si el Usuario está Autenticado
    isAuth();

    // Renderizar Datos del Usuario Autenticado
    $router->render('cita/index', [
      'nombre' => $_SESSION['nombre'],
      'id' => $_SESSION['id']
    ]);
  }
}