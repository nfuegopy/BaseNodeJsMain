class Rol {
    constructor(RoleID = null, RoleName, RoleDescription, creado = null, actualizado = null){
        this.RoleID= RoleID;
        this.RoleName =RoleName;
        this.RoleDescription = RoleDescription;
        this.creado = creado;
        this.actualizado = actualizado;
    }
}
module.exports= Rol;