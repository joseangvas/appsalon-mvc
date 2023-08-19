<?php

namespace Controllers;

use Model\Usuario;
use MVC\Router;
use Classes\Email;

class LoginController {
  
  //*****  INICIO DE SESION DE USUARIO  ******//
  public static function login(Router $router) {
    $router->render('auth/login');
  }


  //*****  CERRAR SESION DE USUARIO  ******//
  public static function logout() {
    echo 'Desde Logout';
  }


  //*****  CUANDO EL USUARIO OLVIDO SU PASSWORD  ******//
  public static function olvide(Router $router) {

    $router->render('auth/olvide-password', [

    ]);
  }

  //*****  RECUPERAR PASSWORD DE USUARIO  *****//
  public static function recuperar() {
    echo 'Recuperar PASSWORD';
  }

  //*****  CREAR UN USUARIO NUEVO  *****//
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

          // Enviar el Email
          $email = new Email($usuario->nombre, $usuario->apellido, $usuario->email, $usuario->token);

          $email->enviarConfirmacion();

          // Crear el Usuario
          $resultado = $usuario->guardar();

          if($resultado) {
            header('Location: /mensaje');
          }
        }
      }
    }
    
    $router->render('auth/crear-cuenta', [
      'usuario' => $usuario,
      'alertas' => $alertas
    ]);
  }


  //* Llamar a la Vista de Mensajes
  public static function mensaje(Router $router) {
    $router->render('auth/mensaje');
  }


  //* Confirmar el Registro de Usuario
  public static function confirmar(Router $router) {
    // Alertas Vacías
    $alertas = [];

    // Sanitizar el Token
    $token = s($_GET['token']);

    // Obtener los Datos del Usuario por su Token
    $usuario = Usuario::where('token', $token);
    
    // Validar el Usuario por el Token
    if(empty($usuario)) {
      // Mostrar Mensaje de Error
      Usuario::setAlerta('error', 'Token No Válido');
    } else {
      // Modificar Usuario Confirmado
      $usuario->confirmado = '1';

      // Blanquear el Token para Evitar Reutilización
      $usuario->token = null;

      // Guardar los Datos del Registro
      $usuario->guardar();

      // Mensaje de aviso de Registro Exitoso
      Usuario::setAlerta('exito', 'Cuenta comprobada Correctamente');
    }

    // Obtener Alertas
    $alertas = Usuario::getAlertas();

    // Renderizar la Vista
    $router->render('auth/confirmar-cuenta', [
      'alertas' => $alertas
    ]);
  }
}