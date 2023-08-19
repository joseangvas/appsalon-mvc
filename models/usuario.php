<?php

namespace Model;

class Usuario extends ActiveRecord {
  //* Base de Datos
  protected static $tabla = 'usuarios';
  protected static $columnasDB = ['id', 'nombre', 'apellido', 'email', 'password', 'telefono', 'admin', 'confirmado', 'token'];

  public $id;
  public $nombre;
  public $apellido;
  public $email;
  public $password;
  public $telefono;
  public $admin;
  public $confirmado;
  public $token;


  //*****  FUNCION CONSTRUCTORA DE LA CLASE  *****//
  public function __construct($args = []) {
    $this->id = $args['id'] ?? null;
    $this->nombre = $args['nombre'] ?? '';
    $this->apellido = $args['apellido'] ?? '';
    $this->email = $args['email'] ?? '';
    $this->password = $args['password'] ?? '';
    $this->telefono = $args['telefono'] ?? '';
    $this->admin = $args['admin'] ?? '0';
    $this->confirmado = $args['confirmado'] ?? '0';
    $this->token = $args['token'] ?? '';
  }


  //*****  MENSAJE DE VALIDACION PARA LA CREACION DE UNA CUENTA  *****//
  public function validarNuevaCuenta() {
    if(!$this->nombre) {
      self::$alertas['error'][] = 'El Nombre es Obligatorio';
    }

    if(!$this->apellido) {
      self::$alertas['error'][] = 'El Apellido es Obligatorio';
    }

    if(!$this->email) {
      self::$alertas['error'][] = 'El Email es Obligatorio';
    }

    if(!$this->password) {
      self::$alertas['error'][] = 'El Password es Obligatorio';
    }
    
    if($this->password) {
      if(strlen($this->password) < 6) {
        self::$alertas['error'][] = 'El Password debe Contener al menos 6 Caracteres';
      }
    }

    return self::$alertas;
  }


  //*****  REVISAR SI EL USUARIO YA EXISTE  *****//
  public function existeUsuario() {
    $query = "SELECT * FROM " . self::$tabla . " WHERE email = '" . $this->email . "' LIMIT 1" ;

    $resultado = self::$db->query($query);

    if($resultado->num_rows) {
      self::$alertas['error'][] = 'El Usuario ya Está Registrado';
    }

    return $resultado;
  }


  //*****  HASHEAR EL PASSWORD NUEVO  *****//
  public function hashPassword() {
    $this->password = password_hash($this->password, PASSWORD_BCRYPT);
  }

  
  //*****  CREAR UN TOKEN  *****//
  public function crearToken() {
    $this->token = uniqid();
  }

}