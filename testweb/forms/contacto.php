<?php
//Recibimos los campos del formulario
$nombre=$_POST[user_name];
$correo=$_POST[user_email];
$mensaje=$_POST[user_message];
//Acomodamos todo para darle orden al cuerpo del mensaje
$texto_mensaje="El usuario ".$nombre." dijo: \n".$mensaje." \n
Puedes contactarlo a su correo: ".$correo;
mail("micorreo@ejemplo.com",$texto_mensaje);
echo "Su mensaje se ha enviado! Nos pondremos en contacto contigo.";
?>