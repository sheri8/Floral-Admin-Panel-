import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Utils/colors.dart';

class PreviousOrders extends StatefulWidget {
  const PreviousOrders({Key? key}) : super(key: key);

  @override
  State<PreviousOrders> createState() => _PreviousOrdersState();
}

class _PreviousOrdersState extends State<PreviousOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
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
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('cart')
                        .where('order', isEqualTo: 'complete')
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 10),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (ctx, i) => Card(
                                elevation: 5,
                                // color: white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                        child: Image.network(
                                          snapshot.data!.docs[i]['image url'],
                                          fit: BoxFit.cover,
                                          height: 120,
                                          width: double.infinity,
                                        )),
                                    Text(
                                      snapshot.data!.docs[i]['category'],
                                      style:
                                          TextStyle(fontSize: 12, color: black),
                                    ),
                                    Text(
                                      'Item ${snapshot.data!.docs[i]['quantity']}',
                                      style:
                                          TextStyle(fontSize: 12, color: black),
                                    )
                                  ],
                                ),
                              ));
                      // GridView.builder(
                      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //         crossAxisCount: 2,
                      //         mainAxisSpacing: 20,
                      //         crossAxisSpacing: 5),
                      //     itemCount: snapshot.data!.docs.length,
                      //     itemBuilder: (ctx, i) => InkWell(
                      //         onTap: () {
                      //           // Navigator.push(
                      //           //     context,
                      //           //     MaterialPageRoute(
                      //           //         builder: (builder) => Product_detail(
                      //           //               // 1snap: snapshot.data!.docs[i].data(),
                      //           //               snap1: snapshot.data!.docs[i].data(),
                      //           //             )));
                      //         },
                      //         child: Products(
                      //           snap: snapshot.data!.docs[i].data(),
                      //         )));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
