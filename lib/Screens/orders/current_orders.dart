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
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 50,
                        crossAxisSpacing: 10),
                    itemCount: 4,
                    itemBuilder: (ctx, i) => Card(
                          elevation: 5,
                          // color: white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
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
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
