// src/index.js
require('dotenv').config();
const express = require('express');
const app = express();
const routes = require('./routes');

app.use(express.json()); // para receber JSON no body
app.use(routes); // importa as rotas

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`🚀 Servidor rodando na porta ${PORT}`);
});
