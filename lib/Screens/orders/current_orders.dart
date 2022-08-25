import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Utils/colors.dart';

class CurrentOrders extends StatelessWidget {
  const CurrentOrders({Key? key}) : super(key: key);

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
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Container(
                        height: 160,
                        width: MediaQuery.of(context).size.width,
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 50,
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
                                      //  Image.asset(
                                      //   'asset/Ellie2 1.png',
                                      //   fit: BoxFit.cover,
                                      //   height: 120,
                                      //   width: double.infinity,
                                      // )),
                                      Text(
                                        '${snapshot.data!.docs[i]['category']}',
                                        style: TextStyle(
                                            fontSize: 12, color: black),
                                      ),
                                      Text(
                                        'Item ${snapshot.data!.docs[i]['quantity']}',
                                        style: TextStyle(
                                            fontSize: 12, color: black),
                                      )
                                    ],
                                  ),
                                )),
                        // ListView.builder(
                        //     scrollDirection: Axis.horizontal,
                        //     itemCount: snapshot.data!.docs.length,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       return Padding(
                        //         padding: const EdgeInsets.all(8.0),
                        //         child: InkWell(
                        //             onTap: () {
                        //               Navigator.push(
                        //                   context,
                        //                   MaterialPageRoute(
                        //                       builder: (builder) =>
                        //                           ProductDescription(
                        //                             snap: snapshot.data!.docs[index]
                        //                                 .data(),
                        //                           )));
                        //             },
                        //             child: Image.network(
                        //               snapshot.data!.docs[index]['Photo Url'],
                        //               fit: BoxFit.cover,
                        //             )),
                        //       );
                        //     }),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
