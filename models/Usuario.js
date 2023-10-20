class Usuario {
// aqui uso el null para poder condicionar en los casos que no usare este atributo de tal manera que pueda funcionar siempre el model
    constructor(ID = null,CI ,Usuario,Creado,Actualizado, Password = null){
        this.ID= ID;
        this.CI= CI;
        this.Usuario = Usuario;
        this.Password = Password;
        this.Creado = Creado;
        this.Actualizado= Actualizado;
    }
}

module.exports= Usuario;