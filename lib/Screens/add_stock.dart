// import 'dart:html';

import 'dart:typed_data';

import 'package:floral/resources/firestore_methods.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';

import '../Utils/colors.dart';
import '../Utils/utils.dart';

class Add_Stock extends StatefulWidget {
  Add_Stock({Key? key}) : super(key: key);

  @override
  State<Add_Stock> createState() => _Add_StockState();
}

class _Add_StockState extends State<Add_Stock> {
  var DropDownC = TextEditingController();
  Uint8List? _image;
  void selectImage() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  TextEditingController name = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  bool loading = false;
  String dropdownValue = 'Shirt';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 5,
        title: Text(
          'Add Stock',
          style: TextStyle(
              color: black, fontWeight: FontWeight.w600, fontSize: 16),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: _image != null
                        ? Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: MemoryImage(_image!),
                                    fit: BoxFit.cover),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                          )
                        : DottedBorder(
                            color: black,
                            strokeWidth: 1,
                            borderType: BorderType.RRect,
                            radius: Radius.circular(12),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              child: Container(
                                  height: 100,
                                  width: 100,
                                  child: IconButton(
                                      onPressed: () {
                                        selectImage();
                                      },
                                      icon: Image.asset(
                                          'asset/bxs_camera-plus.png'))),
                            ),
                          ),
                  ),
                  SizedBox(width: 50),
                  Text(
                    'Add Image',
                    style: TextStyle(color: black, fontSize: 15),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                height: 50,
                width: double.infinity,
                child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_drop_down),
                          elevation: 16,
                          style: const TextStyle(color: grey),
                          // underline: Container(
                          //   height: 2,
                          //   color: Colors.deepPurpleAccent,
                          // ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>[
                            'Shirt',
                            'Pent',
                            'Shoes',
                            'Belt',
                            'Computer',
                            'Charger',
                            'Purse',
                            'Perfumes',
                            'Trouser',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    )),
              ),
              SizedBox(height: 10),
              textfield('Name', name),
              SizedBox(height: 10),
              textfield('Type', type),
              SizedBox(height: 10),
              textfield('Color', color),
              SizedBox(height: 10),
              textfield('Price', price),
              SizedBox(height: 10),
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: description,
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText: 'Description',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  height: 50,
                  width: 150,
                  margin: EdgeInsets.only(top: 60, bottom: 20),
                  child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        String result = await FirestoreMethods().saveData(
                            Name: name.text,
                            Type: type.text,
                            Color: color.text,
                            Description: description.text,
                            Category: dropdownValue,
                            Price: price.text,
                            image: _image);
                        if (result == 'success') {
                          debugPrint(result);
                          Navigator.pop(context);
                          setState(() {
                            loading = false;
                          });
                        } else {
                          setState(() {
                            loading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(result),
                            duration: Duration(seconds: 10),
                          ));
                        }
                      },
                      child: loading
                          ? Center(child: CircularProgressIndicator())
                          : Text(
                              'Save',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        primary: Color(0xffF4C2C2),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card textfield(String name, TextEditingController controler) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          controller: controler,
          decoration: InputDecoration(
              hintText: name,
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
