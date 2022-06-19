'use strict'

var express = require('express');
const { model} = require('mongoose');
var ProductosController = require('../controllers/producto');

var router = express.Router();

//rutas para productos
router.get('/productos', ProductosController.list);
router.get('/productos/:id', ProductosController.find);
router.post('/productos/save', ProductosController.save);

module.exports = router;