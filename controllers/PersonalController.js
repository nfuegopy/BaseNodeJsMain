const PersonalService  = require ('../services/PersonalService');
exports.listarPersonales = async(req, res)=>
{
    try{
        const personales = await PersonalService.listarPersonales();
        res.json({success: true , personales});
       }catch(error){
        res.status(500).json({success: false, message:'Ocurrio un error fatal en la consulta'});
       }
};