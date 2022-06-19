
import 'package:conexion_video/models/modelo3.dart';
import 'package:conexion_video/producto_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductoProvider(),
          lazy: false,
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    final productoProvider = Provider.of<ProductoProvider>(context);
    final List<Producto> productos = productoProvider.listaProductos;

    
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Comentarios..'),
      ),
      body: ListView.builder( 
        itemCount: productos.length,
        itemBuilder: (BuildContext context,int index) {
        return ListTile(
          title: Text(productos[index].firstName,
          style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
          
          ),
          subtitle: Text('s/.'+productos[index].lastName,
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.indigo),
          ),
          leading: Icon(Icons.account_circle_rounded),
          
        );
      }),
    ));
  }
}
