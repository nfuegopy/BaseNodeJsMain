const pool = require ('../config/database');
class PersonalRepository {
    async listarPersonales(){
        const [rows] = await pool.execute('CALL ListarPersonales()');
        return rows;
    }
}

module.exports = new PersonalRepository();