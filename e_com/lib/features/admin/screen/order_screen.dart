import 'package:e_com/constants/global_variable.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/loader.dart';
import '../../../models/order.dart';
import '../../account/widgets/single_product.dart';
import '../../order_details.dart/order_details.dart';
import '../services/admin_services.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Order>? orders;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await adminServices.fetchAllOrders(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Center(child: CircularProgressIndicator())
        : Container(
            color: GlobalVariables.mainColor,
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              itemCount: orders!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                final orderData = orders![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      OrderDetails.routeName,
                      arguments: orderData,
                    );
                  },
                  child: SizedBox(
                    height: 120,
                    child: SingleProduct(
                      image: orderData.products[0].images[0],
                    ),
                  ),
                );
              },
            ),
          );
  }
}
