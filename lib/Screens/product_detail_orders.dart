import 'package:floral/resources/firestore_methods.dart';
import 'package:flutter/material.dart';

class ProductDetailOrders extends StatefulWidget {
  ProductDetailOrders({Key? key, required this.snap2}) : super(key: key);
  final snap2;

  @override
  State<ProductDetailOrders> createState() => _ProductDetailOrdersState();
}

class _ProductDetailOrdersState extends State<ProductDetailOrders> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Stack(children: [
        Image.network(
          widget.snap2['image url'],
          fit: BoxFit.cover,
          height: 260,
          width: double.infinity,
        ),
        Positioned(
          top: 170,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.snap2['category'],
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                Text(
                  widget.snap2['date'],
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        )
      ]),
      Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Quantity ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Text(
                widget.snap2['quantity'],
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
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
                        String result = await FirestoreMethods().delivery(
                            category: widget.snap2['category'],
                            image: widget.snap2['image url'],
                            quantity: widget.snap2['date']);
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
      )
    ])));
  }
}
