// import 'dart:html';

import 'package:floral/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class Add_Stock extends StatelessWidget {
  Add_Stock({Key? key}) : super(key: key);
  var DropDownC = TextEditingController();

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
                  DottedBorder(
                    color: black,
                    strokeWidth: 1,
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Container(
                          height: 100,
                          width: 100,
                          child: IconButton(
                              onPressed: () {},
                              icon: Image.asset('asset/bxs_camera-plus.png'))),
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
                margin: EdgeInsets.only(top: 50),
                height: 50,
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  child: ListTile(
                    leading: Text(
                      'Category',
                      style: TextStyle(color: grey),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_downward,
                        color: grey,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              textfield('Name'),
              SizedBox(height: 10),
              textfield('Type'),
              SizedBox(height: 10),
              textfield('Color'),
              SizedBox(height: 10),
              Text(
                'Description',
                style: TextStyle(color: grey, fontSize: 15),
              ),
              SizedBox(height: 10),
              Card(
                  elevation: 5,
                  child: TextFormField(
                    maxLines: 6,
                    decoration: InputDecoration(border: InputBorder.none),
                  )),
              Card(
                shape: StadiumBorder(),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Select',
                    style: TextStyle(color: black),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Add Video + Image',
                style: TextStyle(
                    color: black, fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset('asset/Group (1).png'),
                SizedBox(width: 8),
                Image.asset('asset/Group (1).png'),
                SizedBox(width: 8),
                Image.asset('asset/Group (1).png'),
                SizedBox(width: 8),
                Image.asset('asset/Group (1).png'),
              ]),
              SizedBox(height: 50),
              Center(
                child: Container(
                  height: 50,
                  width: 150,
                  // decoration: BoxDecoration(
                  //     // borderRadius: BorderRadius.all(Radius.circular(60)
                  //     )),
                  margin: EdgeInsets.only(top: 60, bottom: 20),
                  child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (builder) => Home()
                        // ));
                      },
                      child: Text(
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

  Card textfield(String name) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextFormField(
          decoration: InputDecoration(
              hintText: name,
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
