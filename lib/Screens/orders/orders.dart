import 'package:floral/Screens/orders/current_orders.dart';
import 'package:floral/Screens/orders/previousorders.dart';

import 'package:flutter/material.dart';

class OrdersList extends StatefulWidget {
  const OrdersList({Key? key}) : super(key: key);

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Current Orders",
              ),
              Tab(
                text: "Previous Orders",
              ),
            ],
          ),
          title: const Text('Orders'),
        ),
        body: TabBarView(
          children: [
            CurrentOrders(),
            PreviousOrders(),
          ],
        ),
      ),
    );
  }
}
