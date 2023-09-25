<?php

namespace Controllers;

use Model\Servicio;
use MVC\Router;
class ServicioController {
  //* Obtener los Datos de los Servicios
  public static function index(Router $router) {
    session_start();

    $servicios = Servicio::all();

    $router->render('servicios/index', [
      'nombre' => $_SESSION['nombre'],
      'servicios' => $servicios
    ]);
  }

  //* Ingresar Nuevos Servicios
  public static function crear(Router $router) {
    session_start();
    $servicio = new Servicio;
    
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
      $servicio->sincronizar($_POST);
      $alertas = $servicio->validar();

      if(empty($alertas)) {
        $servicio->guardar();
        header('Location: /servicios');
      }
    };
    
    $router->render('servicios/crear', [
      'nombre' => $_SESSION['nombre'],
      'servicio' => $servicio,
      'alertas' => $alertas
    ]);
  }

  //* Actualizar los Datos de los Servicios
  public static function actualizar(Router $router) {
    session_start();

    if($_SERVER['REQUEST_METHOD'] === 'POST') {

    };

    $router->render('servicios/actualizar', [
      'nombre' => $_SESSION['nombre']
    ]);
  }

  //* Eliminar un Servicio
  public static function eliminar(Router $router) {

    if($_SERVER['REQUEST_METHOD'] === 'POST') {

    };

  }
}