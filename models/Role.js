class Rol {
    constructor(RoleID,RoleName,RoleDescription,creado,actualizado){
        this.RoleID= RoleID;
        this.RoleName =RoleName;
        this.RoleDescription = RoleDescription;
        this.creado = creado;
        this.actualizado = actualizado;
    }
}
module.exports= Rol;