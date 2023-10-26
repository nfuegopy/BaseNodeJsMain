const pool = require('../config/database');  // Asegúrate de que la ruta sea la correcta

class AuthService {
    async iniciarSesion(nombreUsuario, password) {
        try {
            // Inicia una transacción
            const connection = await pool.getConnection();
            await connection.beginTransaction();

            try {
                // Llama al procedimiento almacenado
                await connection.execute('CALL IniciarSesion(?, ?, @resultado, @UsuarioID);', [nombreUsuario, password]);
                // Recupera el valor de la variable
                const [rows] = await connection.execute('SELECT @resultado AS resultado, @UsuarioID AS UsuarioID;');
                const resultado = rows[0].resultado;
                const UsuarioID = rows[0].UsuarioID;
                // Confirma la transacción
                await connection.commit();
                return {resultado, UsuarioID}; //Se agrego la llave y UsuarioID
            } catch (error) {
                // Si hay un error, deshace la transacción
                await connection.rollback();
                throw error;
            } finally {
                // Asegúrate de liberar la conexión
                connection.release();
            }
        } catch (error) {
            throw error;
        }
    }
}

module.exports = new AuthService();
