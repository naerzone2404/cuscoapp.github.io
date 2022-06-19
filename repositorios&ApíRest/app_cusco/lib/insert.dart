// ignore_for_file: prefer_const_constructors

import 'package:app_cusco/MongoDBModel.dart';
import 'package:app_cusco/dbHelper/mongodb.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart'as M;

class MongodbInsert extends StatefulWidget {
  MongodbInsert({Key? key}) : super(key: key);
  @override
  _MongodbInsertState createState() => _MongodbInsertState();
}

class _MongodbInsertState extends State<MongodbInsert> {
  var fnameController = new TextEditingController();
  var lnameController = new TextEditingController();
  var addressController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: Image.asset(
              "assets/unnamed.png",
              height: 300,
            ),),
            
            SizedBox(
              height: 50,
            ),
            TextField(
              controller: fnameController,
              decoration: InputDecoration(labelText: "Usuario"),
            ),
            TextField(
              controller: lnameController,
              decoration: InputDecoration(labelText: "Registrar"),
            ),
            TextField(
              controller: addressController,
              minLines: 3,
              maxLines: 3,
              decoration: InputDecoration(labelText: "Direccion"),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(onPressed: () {
                  _fakeData();
                }, child: Text('Generate Data')),
                ElevatedButton(onPressed: () {
                  _insertData(
                    fnameController.text,
                    lnameController.text,
                    addressController.text);
                },
                 child: Text('Insert Data'))
              ],
            )
          ],
        ),
      )),
    );
  }

  Future<void> _insertData(String fName, String lName, String address) async{
    var _id = M.ObjectId();
    final data = MongoDbModel(
      id: _id, firstName: fName, lastName: lName, address: address);
      var result = await MongoDatabase.insert(data);
    ScaffoldMessenger.of(context)
    .showSnackBar(SnackBar(content: Text("Insert ID"+ _id.$oid)));
     _clearAll();
  }

  void _clearAll(){
    fnameController.text ="";
    lnameController.text ="";
    addressController.text ="";
  }
  
  void _fakeData() {
    setState(() {
      fnameController.text = faker.person.firstName();
      lnameController.text = faker.person.firstName();
      addressController.text =
          faker.address.streetAddress() + "\n" + faker.address.streetAddress();
    });
  }
}
