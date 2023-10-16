const pool = require ('../config/database');
class PersonalRepository {
    //Metodo para listar personales 
    async listarPersonales(){
        const [rows] = await pool.execute('CALL ListarPersonales()');
        return rows;
    }

    //Metodo insertar registro personales

    async insertarPersonal(personal){
        const {CI, Nombre, Apellido, Telefono, Email} = personal;
        console.log(CI, Nombre, Apellido, Telefono, Email);
        if (!CI || !Nombre || !Apellido || !Telefono || !Email) {
            // Uno o más campos están faltando o son undefined.
            // Responde con un error antes de llamar a PersonalRepository.
            res.status(400).json({ success: false, message: 'Faltan campos requeridos' });
            return;
        }
        const [result] = await pool.execute('CALL InsertarPersonal(?, ?, ?, ?, ?)', [CI, Nombre, Apellido, Telefono, Email]);
        return result;
    }
}

module.exports = new PersonalRepository();