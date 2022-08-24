import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:floral/Screens/add_stock.dart';
import 'package:floral/Screens/messages/chats/screens/chat_page.dart';
import 'package:floral/Screens/orders/orders.dart';
import 'package:floral/Screens/product_detail.dart';
import 'package:floral/Screens/products.dart';
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
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => ChatPage()));
              },
              icon: Icon(
                Icons.message,
                color: black,
              )),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => OrdersList()));
              },
              child: Text(
                "ORDERS",
              )),
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          Row(
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
            child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('Order').snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 5),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (ctx, i) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => Product_detail(
                                          // 1snap: snapshot.data!.docs[i].data(),
                                          snap1: snapshot.data!.docs[i].data(),
                                        )));
                          },
                          child: Products(
                            snap: snapshot.data!.docs[i].data(),
                          )));
                }),
          )
        ]),
      )),
    );
  }
}
