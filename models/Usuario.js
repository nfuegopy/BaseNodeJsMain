class Usuario {

    constructor(ID,CI,Usuario,Password,Creado,Actualizado){
        this.ID= ID;
        this.CI= CI;
        this.Usuario = Usuario;
        this.Password = Password;
        this.Creado = Creado;
        this.Actualizado= Actualizado;
    }
}

module.exports= Usuario;