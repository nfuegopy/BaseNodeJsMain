use odontologo;
DELIMITER //

CREATE PROCEDURE InsertarPersonal (
    IN p_CI INT, 
    IN p_Nombre VARCHAR(50), 
    IN p_Apellido VARCHAR(50), 
    IN p_Telefono VARCHAR(15), 
    IN p_Email VARCHAR(100)
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM personal WHERE Email = p_Email) THEN
        INSERT INTO personal (CI, Nombre, Apellido, Telefono, Email) 
        VALUES (p_CI, p_Nombre, p_Apellido, p_Telefono, p_Email);
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El email ya existe.';
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ActualizarPersonal (
    IN p_CI INT, 
    IN p_Nombre VARCHAR(50), 
    IN p_Apellido VARCHAR(50), 
    IN p_Telefono VARCHAR(15), 
    IN p_Email VARCHAR(100)
)
BEGIN
    UPDATE personal 
    SET Nombre = p_Nombre, Apellido = p_Apellido, Telefono = p_Telefono, Email = p_Email 
    WHERE CI = p_CI;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE EliminarPersonal (
    IN p_CI INT
)
BEGIN
    DELETE FROM personal WHERE CI = p_CI;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertarUsuario (
    IN p_CI INT
)
BEGIN
    DECLARE v_Password VARCHAR(255) DEFAULT 'micodigo';
    DECLARE v_NombreUsuario VARCHAR(50);
    DECLARE v_Nombre, v_Apellido VARCHAR(50);
    SELECT Nombre, Apellido INTO v_Nombre, v_Apellido FROM personal WHERE CI = p_CI;
    SET v_Apellido = SUBSTRING_INDEX(v_Apellido, ' ', 1);
    SET v_NombreUsuario = CONCAT(LEFT(v_Nombre, 1), v_Apellido);
    SET v_Password = SHA2(v_Password, 256);
    INSERT INTO usuario (CI, Nombre_Usuario, Password) VALUES (p_CI, v_NombreUsuario, v_Password);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ActualizarNombreUsuario (
    IN p_ID INT,
    IN p_Nombre_Usuario VARCHAR(50)
)
BEGIN
    UPDATE usuario 
    SET Nombre_Usuario = p_Nombre_Usuario 
    WHERE ID = p_ID;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ResetearPassword (
    IN p_ID INT,
    IN p_Password VARCHAR(255)
)
BEGIN
    DECLARE v_PasswordHashed VARCHAR(255);
    SET v_PasswordHashed = SHA2(p_Password, 256);
    UPDATE usuario 
    SET Password = v_PasswordHashed 
    WHERE ID = p_ID;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE EliminarUsuario (
    IN p_ID INT
)
BEGIN
    DELETE FROM usuario WHERE ID = p_ID;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ListarPersonales ()
BEGIN
    SELECT * FROM personal;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ListarUsuarios ()
BEGIN
    SELECT ID, CI, Nombre_Usuario, creado, actualizado FROM usuario;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ListarUsuariosConPassword ()
BEGIN
    SELECT ID, CI, Nombre_Usuario, Password FROM usuario;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE IniciarSesion (
    IN p_Nombre_Usuario VARCHAR(50), 
    IN p_Password VARCHAR(255), 
    OUT p_Resultado INT,
    OUT p_UsuarioID INT
)
BEGIN
    SET p_Resultado = 0;
    SET p_UsuarioID = NULL;
    IF EXISTS (SELECT ID FROM usuario WHERE Nombre_Usuario = p_Nombre_Usuario AND Password = SHA2(p_Password, 256)) THEN
        IF p_Password = 'micodigo' THEN
            SET p_Resultado = 2;
        ELSE
            SET p_Resultado = 1;
        END IF;
        SELECT ID INTO p_UsuarioID FROM usuario WHERE Nombre_Usuario = p_Nombre_Usuario AND Password = SHA2(p_Password, 256);
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ObtenerNombreUsuario (
    IN p_Nombre_Usuario VARCHAR(50), 
    OUT p_Nombre VARCHAR(50), 
    OUT p_Apellido VARCHAR(50), 
    OUT p_UsuarioID INT
)
BEGIN
    SELECT p.Nombre, p.Apellido, u.ID INTO p_Nombre, p_Apellido, p_UsuarioID 
    FROM personal p
    INNER JOIN usuario u ON p.CI = u.CI
    WHERE u.Nombre_Usuario = p_Nombre_Usuario;
END //
DELIMITER ;
