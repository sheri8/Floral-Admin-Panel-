import 'package:floral/Screens/product_detail.dart';
import 'package:flutter/material.dart';

import '../Utils/colors.dart';

class Products extends StatefulWidget {
  Products({Key? key, required this.snap}) : super(key: key);
  final snap;
  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Image.network(
                widget.snap['Photo Url'],
                fit: BoxFit.cover,
                height: 120,
                width: double.infinity,
              )),
          SizedBox(height: 10),
          Text(
            widget.snap['Name'],
            style: TextStyle(
                fontSize: 15, color: black, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
