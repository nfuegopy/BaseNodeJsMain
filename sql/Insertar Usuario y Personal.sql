use odontologo;
CALL InsertarPersonal(5116168, 'Antonio Cesar', 'Barrios Leguizamon', '1234567890', 'antonibarrios@gmail.com');
CALL InsertarUsuario(5116168);

CALL InsertarRol('Administrador','Se encarga del manteniemiento total del sistema con acceso total');
CALL AsignarRolUsuario(1,1);

