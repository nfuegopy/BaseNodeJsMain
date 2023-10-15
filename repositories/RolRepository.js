const pool = require ('../config/database');
const Rol = require('../models/Role');
class RolRepository {
    async listarRoles(){
        const [rows] = await pool.execute('CALL ListarRoles()');
        return rows;
    }
}

module.exports = new RolRepository();