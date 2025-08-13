// src/routes.js
const express = require('express');
const router = express.Router();
const connection = require('./models/ConnectDatabase');

// rota de teste
router.get('/teste', (req, res) => {
  connection.query('SELECT NOW() AS agora', (err, results) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    res.json(results[0]);
  });
});

module.exports = router;
