'use strict'

var client = require('../database/db');
var db = client.db("pruebabd");

var controller = {
    //Listar
    list: function(req,res){
        console.log("------------------");
        console.log("ENTRANDO A LA FUNCION LISTAR");
        db.collection("PreubaEnviarData").find().toArray(
            (error, dataProductos)=>{
                if(error||!dataProductos){
                    return res.status(404).send({
                        message: "No se encontraron productos"
                    });
                }else{
                    return res.status(200).send({
                        status: "Success",
                        productos: dataProductos
                        
                    });
                }
            }
        );
    },

    //Buscar
    find: function(req, res){
        console.log("------------------");
        console.log("ENTRANDO A LA FUNCION FIND");
        db.collection("productos").find({ ProductoId: parseInt(req.params.id)}).toArray(
            (error, dataProductos) => {
                if(error||!dataProductos){
                    return res.status(404).send({
                        message: "No se encontro el producto"
                    });
                }else{
                    return res.status(200).send({
                        status:"exitoso",
                        productos: dataProductos[0]
                    });
                }
            }
        );
    },

    //Guardar
    save: function(req,res){
        console.log("------------------");
        console.log("ENTRANDO A LA FUNCION SAVE");
        console.log(req.body);
        if(req.body.ProductoId == "0"){ //nuevo
            db.collection("productos").count().then(
                countProductos => {
                    var producto = {}
                    producto.ProductoId = countProductos + 1;
                    producto.descripcion = req.body.descripcion;
                    producto.precio = req.body.precio;
                    db.collection("productos").insertOne(producto,
                        (error,result) => {
                            if(error){
                                return res.status(404).send({
                                    message: "No se pudo registrar el producto"
                                });
                            } else{
                                return res.status(200).send({
                                    status:"Success",
                                    productos: result
                                });

                            }
                        }
                    );
                }

            )
        }

    }
}   

module.exports = controller;