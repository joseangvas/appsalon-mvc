<?php

namespace Controllers;

use Model\Servicio;
use MVC\Router;
class ServicioController {
  //* Obtener los Datos de los Servicios
  public static function index(Router $router) {
    session_start();

    isAdmin();

    $servicios = Servicio::all();

    $router->render('servicios/index', [
      'nombre' => $_SESSION['nombre'],
      'servicios' => $servicios
    ]);
  }


  //* Ingresar Nuevos Servicios
  public static function crear(Router $router) {
    session_start();
    isAdmin();
    $servicio = new Servicio;
    $alertas = [];
    
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
    isAdmin();
    if(!is_numeric($_GET['id'])) return;
    $servicio = Servicio::find($_GET['id']);
    $alertas = [];

    if($_SERVER['REQUEST_METHOD'] === 'POST') {
      $servicio->sincronizar($_POST);
      $alertas = $servicio->validar();

      if(empty($alertas)) {
        $servicio->guardar();
        header('Location: /servicios');
      }
    };

    $router->render('servicios/actualizar', [
      'nombre' => $_SESSION['nombre'],
      'servicio' => $servicio,
      'alertas' => $alertas
    ]);
  }


  //* Eliminar un Servicio
  public static function eliminar(Router $router) {
    session_start();
    isAdmin();
    
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
      $id = $_POST['id'];
      $servicio = Servicio::find($id);
      $servicio->eliminar(); ?>
      
      <script>
        Swal.fire({
          icon: 'success',
          title: 'BORRAR SERVICIO',
          text: 'El Servicio Fué Borrado Correctamente',
          button: 'OK'
        })
      </script>
      
      <?php
      header('Location: /servicios');
    };
  }
}