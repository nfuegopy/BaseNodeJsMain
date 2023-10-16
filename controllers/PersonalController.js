const PersonalService  = require ('../services/PersonalService');
const Personal = require('../models/Personal')
//Controllador para listarPersonales
exports.listarPersonales = async(req, res)=>
{
    try{
        const personales = await PersonalService.listarPersonales();
        res.json({success: true , personales});
       }catch(error){
        res.status(500).json({success: false, message:'Ocurrio un error fatal en la consulta'});
       }
};

//Controllador para insertar Personales
exports.insertarPersonal = async(req, res) => {
try{
    const {CI, Nombre, Apellido, Telefono, Email} = req.body;
    const personal = new Personal(CI, Nombre, Apellido, Telefono, Email);
    const result = await PersonalService.insertarPersonal(personal);
    res.json({success: true, message: 'Personal insertado correctamente desde Nodejs', result});
    }catch(error){
        console.log(error); 
        res.status(500).json({success: false, message: 'Ocurrio un error al intentar registrar personal', error});
    }
};