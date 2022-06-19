'use strict'

const { application } = require('express');
const { default: mongoose } = require('mongoose');
//REQUIRES
var moongose = require('mongoose');
var app = require('./app');



//PUERTOS SERVIDOR
var port = process.env.port || 3999;
moongose.Promise = global.Promise;

mongoose.connect('mongodb+srv://Ricard2404:Programador24@clusterapps.rpmto.mongodb.net/?retryWrites=true&w=majority', 
        {useNewUrlParser: true})
        .then(()=>{
            console.log('La conexion a la bd es correcta')
            //CREAR EL SERVIDOR
            app.listen(port, ()=>{
                console.log('El servidor http://localhost:3999 esta funcionando.')
            });
        }
    )
    .catch(error => console.log(error));
