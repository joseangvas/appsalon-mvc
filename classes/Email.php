<?php

namespace Classes;

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

class Email {

  public $nombre;
  public $apellido;
  public $email;
  public $token;

  public function __construct($nombre, $apellido, $email, $token) {
    $this->nombre = $nombre;
    $this->apellido = $apellido;
    $this->email = $email;
    $this->token = $token;
  }

  public function enviarConfirmacion() {
    try {
      // Crear el Objeto de Email
      $mail = new PHPMailer();
      $mail->isSMTP();
      $mail->Host = 'sandbox.smtp.mailtrap.io';
      $mail->SMTPAuth = true;
      $mail->Port = 2525;
      $mail->Username = 'f1ecf0cbfbb712';
      $mail->Password = '996cf78b53e82f';

      // Configurar el Email Remitente y Destinatario
      $mail->setFrom('cuentas@appsalon.com');     // Email de AppSalon
      $mail->addAddress('cuentas@appsalon.com');  // Email del Cliente
      $mail->Subject = 'Confirma tu Cuenta';

      // Set HTML
      $mail->isHTML(TRUE);
      $mail->CharSet = 'UTF-8';

      // Cuerpo del Email
      $nombreUsuario = $this->nombre . " " . $this->apellido;

      $contenido = "<html>";
        $contenido .= "<p><strong>Hola " . $nombreUsuario . "</strong> Has Creado tu Cuenta en AppSalon. Solo debes confirmarla Presionando el Siguiente Enlace:</p>";
        $contenido .= "<p>Presiona aquí: <a href='http://localhost:3000/confirmar-cuenta?token=" . $this->token . "'>Confirmar Cuenta</a></p>";
        $contenido .= "<p>Si tu no solicitaste este Cambio, puedes ignorar este mensaje.</p>";
      $contenido .= "</html>";
      $mail->Body = $contenido;

      // Enviar el Email
      $mail->send();
      echo 'El Email ha sido Enviado';
    } catch (Exception $e) {
      echo 'El Email No pudo ser Enviado. ' . $mail->ErrorInfo;
    }
  }

  public function enviarInstrucciones() {
    try {
      // Crear el Objeto de Email
      $mail = new PHPMailer();
      $mail->isSMTP();
      $mail->Host = 'sandbox.smtp.mailtrap.io';
      $mail->SMTPAuth = true;
      $mail->Port = 2525;
      $mail->Username = 'f1ecf0cbfbb712';
      $mail->Password = '996cf78b53e82f';

      // Configurar el Email Remitente y Destinatario
      $mail->setFrom('cuentas@appsalon.com');     // Email de AppSalon
      $mail->addAddress('cuentas@appsalon.com');  // Email del Cliente
      $mail->Subject = 'Reestablece tu Password';

      // Set HTML
      $mail->isHTML(TRUE);
      $mail->CharSet = 'UTF-8';

      // Cuerpo del Email
      $nombreUsuario = $this->nombre . " " . $this->apellido;

      $contenido = "<html>";
        $contenido .= "<p><strong>Hola " . $nombreUsuario . "</strong> Has Solicitado Reestablecer tu Password. Reestablecelo Presionando el Siguiente Enlace:</p>";
        $contenido .= "<p>Presiona aquí: <a href='http://localhost:3000/recuperar?token=" . $this->token . "'>Reestablecer Password</a></p>";
        $contenido .= "<p>Si tu no solicitaste este Cambio, puedes ignorar este mensaje.</p>";
      $contenido .= "</html>";
      $mail->Body = $contenido;

      // Enviar el Email
      $mail->send();
      // echo 'El Email ha sido Enviado';
    } catch (Exception $e) {
      echo 'El Email No pudo ser Enviado. ' . $mail->ErrorInfo;
    }
  }
}