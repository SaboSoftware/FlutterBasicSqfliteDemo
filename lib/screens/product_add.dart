import 'package:flutter/material.dart';
import 'package:sqflite_demo/data/dbHelper.dart';

import 'package:sqflite_demo/models/product.dart';


class ProductAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductAddState();
  }

}

class ProductAddState extends State{
  var txtName = TextEditingController();
  var txtDescription = TextEditingController();
  var txtUnitPrice = TextEditingController();
  var dbHelper = DbHelper();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Ürün Ekle"),
      ),
    body: Padding(
      padding: EdgeInsets.all(30.0),
    child: Column(
      children: [
        buildNameField(),
        buildDescriptionField(),
        buildUnitField(),
        buildSaveButton(),
      ],
    ),
    ),
    );
  }

  Widget buildNameField() {
  return TextField(
    decoration: InputDecoration(labelText: "Ürün Adı"),
    controller: txtName,
  );
  }

  Widget buildDescriptionField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün Açıklaması"),
      controller: txtDescription,
    );
  }

  Widget  buildUnitField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün Fiyatı"),
      controller: txtUnitPrice,
    );
  }

 Widget buildSaveButton() {
    return FlatButton(
      child: Text("Ekle"),
      onPressed: () {
        AddProduct();

      },
    );
  }

  void AddProduct() async {
   var result = await dbHelper.insert(new Product (name:txtName.text, description:txtDescription.text, unitPrice: double.tryParse(txtUnitPrice.text)));
   Navigator.pop(context);



  }
  }