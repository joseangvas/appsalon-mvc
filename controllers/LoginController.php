<?php

namespace Controllers;

use Model\Usuario;
use MVC\Router;

class LoginController {

  public static function login(Router $router) {
    
    $router->render('auth/login');



  }


  public static function logout() {
    echo 'Desde Logout';
  }


  public static function olvide(Router $router) {
    
    $router->render('auth/olvide-password', [


    ]);

  }


  public static function recuperar() {
    echo 'Recuperar PASSWORD';
  }


  public static function crear(Router $router) {
    $usuario = new Usuario;

    // Alertas Vacías
    $alertas = [];

    if($_SERVER['REQUEST_METHOD'] === 'POST') {

      $usuario->sincronizar($_POST);
      $alertas = $usuario->validarNuevaCuenta();

      // Revisar que alertas esté Vacío
      if(empty($alertas)) {
        // Verificar que el Usuario No esté Registrado
        $resultado = $usuario->existeUsuario();

        if($resultado->num_rows) {
          $alertas = Usuario::getAlertas();
        } else {
          //* El Usuario No Está Registrado - Crearlo
          // Hashear el Password
          $usuario->hashPassword();

          // Generar un Token Unico
          $usuario->crearToken();

        }
      }

    }
    
    $router->render('auth/crear-cuenta', [
      'usuario' => $usuario,
      'alertas' => $alertas

    ]);
  }


}