<?php

namespace Controllers;

use Model\Usuario;
use MVC\Router;
use Classes\Email;

class LoginController {
  
  //*****  INICIO DE SESION DE USUARIO  ******//
  public static function login(Router $router) {
    $alertas = [];

    if($_SERVER['REQUEST_METHOD'] === 'POST') {
      $auth = new Usuario($_POST);
      $alertas = $auth->validarLogin();

      if(empty($alertas)) {
        // Comprobar que Existe el Usuario
        $usuario = Usuario::where('email', $auth->email);

        if($usuario) {
          // Verificar el Password del Usuario
          if($usuario->comprobarPasswordAndVerificado($auth->password)) {
            // Autenticar el Usuario
            session_start();

            $_SESSION['id'] = $usuario->id;
            $_SESSION['nombre'] = $usuario->nombre . " " . $usuario->apellido;
            $_SESSION['email'] = $usuario->email;
            $SESSION['login'] = true;

            // Redireccionamiento
            if($usuario->admin === "1") {
              $_SESSION['admin'] = $usuario->admin ?? null;
              header('Location: /admin');
            } else {
              header('Location: /cita');
            }
          }
        } else {
          Usuario::setAlerta('error', 'Usuario No Encontrado');
        }
      }
    }

    $alertas = Usuario::getAlertas();

    $router->render('auth/login', [
      'alertas' => $alertas
    ]);
  }


  //*****  CERRAR SESION DE USUARIO  ******//
  public static function logout() {
    echo 'Desde Logout';
  }


  //*****  CUANDO EL USUARIO OLVIDO SU PASSWORD  ******//
  public static function olvide(Router $router) {

    $alertas = [];

    if($_SERVER['REQUEST_METHOD'] == 'POST') {
      $auth = new Usuario($_POST);
      $alertas = $auth->validarEmail();

      if(empty($alertas)) {
        $usuario = Usuario::where('email', $auth->email);

        if($usuario && $usuario->confirmado === '1') {
          // Generar un Token
          $usuario->crearToken();
          $usuario->guardar();

          // Enviar el Email
          $email = new Email($usuario->nombre, $usuario->apellido, $usuario->email, $usuario->token);
          $email->enviarInstrucciones();

          // Alerta de Exito
          Usuario::setAlerta('exito', 'Revisa tu Email');



        } else {
          Usuario::setAlerta('error', 'El Usuario No Existe o No está Confirmado');
        }
      }
    }

    $alertas = Usuario::getAlertas();

    $router->render('auth/olvide-password', [
      'alertas' => $alertas
    ]);
  }


  //*****  RECUPERAR PASSWORD DE USUARIO  *****//
  public static function recuperar(Router $router) {
    $alertas = [];
    $error = false;
    $token = s($_GET['token']);

    // Buscar Usuario por su Token
    $usuario = Usuario::where('token', $token);

    if(empty($usuario)) {
      Usuario::setAlerta('error', 'Token No Válido');
      $error = true;
    }

    if($_SERVER['REQUEST_METHOD'] === 'POST') {
      // Leer el Nuevo Password y Guardarlo
      $password= new Usuario($_POST);
      $alertas = $password->validarPassword();

      if(empty($alertas)) {
        $usuario->password = null;
        $usuario->password = $password->password;
        $usuario->hashPassword();
        $usuario->token = null;

        // Grabar Datos en la BD
        $resultado = $usuario->guardar();

        // Redireccionar al Login si Ingresó Password Válido
        if($resultado) {
          header('Location: /');
        }
      }
    }

    $alertas = Usuario::getAlertas();

    $router->render('/auth/recuperar-password', [
      'alertas' => $alertas,
      'error' => $error
    ]);
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