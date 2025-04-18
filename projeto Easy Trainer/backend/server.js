require('dotenv').config();
const express = require('express');
const cors = require('cors');
const sequelize = require('./config/db');
const authController = require('./src/controller/authController')
const authRoutes = require('./src/routes/authroutes');
const Usuario = require('./src/models/User'); 



const app = express();

app.use(cors());
app.use(express.json());
app.use('/api/auth', authRoutes);

// sincroniza e inicia servidor
Usuario.init(sequelize); 
sequelize.sync().then(() => {
  console.log('Banco sincronizado com modelo Usuario');
  app.listen(process.env.PORT, '0.0.0.0', () => {
    console.log(`Servidor rodando na porta ${process.env.PORT}`);
  });
}).catch(err => console.error(err));