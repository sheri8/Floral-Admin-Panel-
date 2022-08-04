import 'package:floral/Screens/add_stock.dart';
import 'package:floral/Screens/product_detail.dart';
import 'package:flutter/material.dart';

import '../Utils/colors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 5,
        title: Text(
          'Home',
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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => Add_Stock()));
              },
              icon: Icon(
                Icons.add,
                color: black,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.message,
                color: black,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_checkout_outlined,
                color: black,
              )),
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 50,
                width: 300,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: grey,
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: grey)),
                ),
              ),
              Text(
                'Sort',
                style: TextStyle(
                    color: grey, fontSize: 14, fontWeight: FontWeight.w400),
              )
            ],
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: double.infinity,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 50,
                    crossAxisSpacing: 10),
                itemCount: 4,
                itemBuilder: (ctx, i) => InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => Product_detail()));
                  },
                  child: Card(
                    elevation: 5,
                    // color: white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: Image.asset(
                              'asset/Ellie2 1.png',
                              fit: BoxFit.cover,
                              height: 120,
                              width: double.infinity,
                            )),
                        Text(
                          'Causal Dress\nAED 450.00',
                          style: TextStyle(fontSize: 12, color: black),
                        )
                      ],
                    ),
                  ),
                ),
              ))
        ]),
      )),
    );
  }
}
