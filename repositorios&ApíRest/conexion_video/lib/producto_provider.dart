

import 'package:conexion_video/models/modelo3.dart';
import 'package:conexion_video/models/producto.dart';
import 'package:conexion_video/models/producto_responde.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ProductoProvider extends ChangeNotifier{

   String  _baseUrl = '192.168.1.11:3999';

  List<Producto> listaProductos = [ 
    
  ];

  ProductoProvider(){
    print('Ingresando a ProductoProvider');
    this.getOnProductoList();
  }

  void getOnProductoList() async{

    var url = Uri.http(_baseUrl, '/api/productos',{});
    final response = await http.get(url);
    print(response.body);
    final productoResponse = MongoDbModel.fromJson(response.body);
    listaProductos = productoResponse.productos;
    notifyListeners();

  }

}