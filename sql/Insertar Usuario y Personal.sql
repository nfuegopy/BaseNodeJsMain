use sistemainicial;
CALL InsertarPersonal('V1234567', 'Antonio Cesar', 'Barrios Leguizamon', '1234567890', 'antonibarrios@gmail.com');
CALL InsertarPersonal('V7654321', 'Joel Hugo', 'Mereles Bonachon', '1234567890', 'coreeos@email.com');
CALL InsertarPersonal('V2345678', 'Jose', 'Martinez Garcia', '2222222222', 'jose@email.com');
CALL InsertarPersonal('V3456789', 'Ana', 'Rodriguez Lopez', '3333333333', 'ana@email.com');
CALL InsertarPersonal('V4567890', 'Carlos', 'Hernandez Sanchez', '4444444444', 'carlos@email.com');
CALL InsertarPersonal('V5678901', 'Paula', 'Fernandez Morales', '5555555555', 'paula@email.com');
CALL InsertarPersonal('V6789012', 'Juan', 'Torres Peña', '6666666666', 'juan@email.com');
CALL InsertarPersonal('V7890123', 'Monica', 'Ramirez Herrera', '7777777777', 'monica@email.com');
CALL InsertarPersonal('V8901234', 'Pedro', 'Gomez Jimenez', '8888888888', 'pedro@email.com');
CALL InsertarPersonal('V9012345', 'Isabel', 'Vazquez Mora', '9999999999', 'isabel@email.com');
CALL InsertarPersonal('V0123456', 'Luis', 'Castillo Rojas', '1010101010', 'luis@email.com');
-- Preparar los datos
SET @CI := 'V1234567';
SET @NombreUsuario := 'Admin';
SET @Password := '1989';
-- Insertar nuevo usuario con contraseña encriptada 
INSERT INTO usuario (CI, Nombre_Usuario, Password)
VALUES (@CI, @NombreUsuario, SHA2(@Password, 256));

CALL InsertarRol('Administrador','Se encarga del manteniemiento total del sistema con acceso total');
CALL AsignarRolUsuario(1,1);
CALL InsertarUsuario('V0123456');
