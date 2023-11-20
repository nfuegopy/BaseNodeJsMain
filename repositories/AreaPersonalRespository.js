const pool = require('../config/database');
class AreaPersonalRepository {
    //Metodo para listar personales 
    async listarAreas() {
        const [rows] = await pool.execute('Select * from area_personal');
        return rows;
    }

    //Metodo insertar registro personales
    // async insertarPersonal(personal){
    //     const {CI, Nombre, Apellido, Telefono, Email} = personal;
    //     console.log("Se insertaron correctamente los siguientes datos",CI, Nombre, Apellido, Telefono, Email);
    //     if (!CI || !Nombre || !Apellido || !Telefono || !Email) {
    //         // Uno o más campos están faltando o son undefined.
    //         // Responde con un error antes de llamar a PersonalRepository.
    //         res.status(400).json({ success: false, message: 'Faltan campos requeridos' });
    //         return;
    //     }
    //     const [result] = await pool.execute('CALL InsertarPersonal(?, ?, ?, ?, ?)', [CI, Nombre, Apellido, Telefono, Email]);
    //     return result;
    // }

    //   //Metodo Actualizar registro personales
    //   async actualizarPersonal(personal){
    //     const { CI, Nombre, Apellido, Telefono, Email} = personal;
    //      const [result] = await pool.execute('CALL ActualizarPersonal(?, ?, ?, ?, ?)',[CI, Nombre, Apellido, Telefono, Email]);
    //      return result;
    //   }

    //       //Metodo Eliminar Registro Personal
    //       async eliminarPersonal(CI){
    //         const [result] = await pool.execute('CALL EliminarPersonal(?)', [CI]);
    //         return result;
    //       }


}

module.exports = new AreaPersonalRepository();