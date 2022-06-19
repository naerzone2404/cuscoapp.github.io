const { MongoClient } = require("mongodb");
const client = new MongoClient("mongodb+srv://Ricard2404:Programador24@clusterapps.rpmto.mongodb.net/?retryWrites=true&w=majority");


client.connect().then(
    (response)=>{
        console.log('La conexion a la bd 1 es correcta - url:'+ response.Url);

    },
    (error)=>{
        console.log('error:'+ error);
    }
)

module.exports = client;