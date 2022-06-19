'use strict'

//REQUIRES
var express = require('express');
var bodyParser = require('body-parser');



// USANDO EXPRES
var app = express()

// CARGA DE ARCHIVOS DE RUTAS
var producto_routes = require('./routes/producto');
var producto_routes = require('./routes/producto');


//MIDDLEWARES
app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());
//CONFIGURACION DE CABERAS Y CORS
app.use((req, res, next)=>{
    res.header('Access-Control-Allow-Origin','*');
    res.header('Access-Control-Allow-Headers','Authorrization, X-API-KEY, Origin, x-Requested-With,content-Type, Accept, Access-Control-Allow-Resquest-Method');
    res.header('Access-Control-Allow-Method','GET, POST, OPTIONS, PUT, DELETE');
    res.header('Allow','GET, POST, OPTIONS, PUT, DELETE');
    next();
})


// REESCRIBIR RUTAS
app.use('/api', producto_routes);
//EXPORTAR MODULO

module.exports = app;