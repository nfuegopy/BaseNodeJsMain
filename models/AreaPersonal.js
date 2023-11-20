class AreaPersonal {

    constructor(id, nombre_rol, creado = null, actualizado = null) {
        this.id = id;
        this.nombre_rol = nombre_rol;
        this.creado = creado;
        this.actualizado = actualizado;
    }
}
module.exports = AreaPersonal;