class Personal {

    constructor (CI,Nombre,Apellido,Telefono,Email, creado = null, actualizado = null){
        this.CI= CI;
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.Telefono = Telefono;
        this.Email = Email;
        this.creado = creado;
        this.actualizado = actualizado;
    }
}
module.exports= Personal;