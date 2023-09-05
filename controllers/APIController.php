<?php

namespace Controllers;

use Model\Servicio;
use Model\Cita;
use Model\CitaServicio;

class APIController {
  public static function index() {
    $servicios = Servicio::all();
    echo json_encode($servicios);
  }


  public static function guardar() {
    // Almacena la Cita y Devuelve el Id
    $cita = new Cita($_POST);
    $resultado = $cita->guardar();

    $id = $resultado['id'];

    // Almacena los Servicios con el Id de la Cita
    $idServicios = explode(",", $_POST['servicios']);
    foreach($idServicios as $idServicio) {
      $args = [
        'citaId' => $id,
        'servicioId' => $idServicio
      ];
      $citaServicio = new CitaServicio($args);
      $citaServicio->guardar();
    }

    echo json_encode(['resultado' => $resultado]);
  }
}
