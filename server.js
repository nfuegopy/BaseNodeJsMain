// 1. Importación de módulos y rutas
const express = require('express');
const cors = require('cors');
const authRoutes = require('./routes/authRoutes');
const personalRoutes = require('./routes/PersonalRoutes');
const usuarioRoutes = require('./routes/UsuarioRoute');

const app = express();

// 2. Configuración de middlewares
app.use(cors());
app.use(express.json());

// 3. Definición de rutas
app.use('/auth', authRoutes);
app.use('/personal', personalRoutes);
app.use('/usuario', usuarioRoutes);

// 4. Inicio del servidor
app.listen(3000, () => {
    console.log('Servidor corriendo en el puerto 3000');
});
