import 'package:harvesthub/constants/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';
import '../../../provider/user_provider.dart';
import '../../product_details/services/product_details_services.dart';
import '../services/cart_services.dart';

class CartProduct extends StatefulWidget {
  final int index;
  const CartProduct({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();
  final CartServices cartServices = CartServices();

  void increaseQuantity(Product product) {
    productDetailsServices.addToCart(
      context: context,
      product: product,
    );
  }

  void decreaseQuantity(Product product) {
    cartServices.removeFromCart(
      context: context,
      product: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    final productCart = context.watch<UserProvider>().user.cart[widget.index];
    final product = Product.fromMap(productCart['product']);
    final quantity = productCart['quantity'];

    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              boxShadow: [
                // ignore: prefer_const_constructors
                BoxShadow(
                  color: Colors.black38,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              )),
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  product.images[0],
                  fit: BoxFit.contain,
                  height: 135,
                  width: 135,
                ),
              ),
              Column(
                children: [
                  Container(
                    width: 235,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      '₹${product.price}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text('Eligible for FREE Shipping'),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: const Text(
                      'In Stock',
                      style: TextStyle(
                        color: Colors.teal,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black12,
                ),
                child: prodAdd(product, quantity),
              ),
            ],
          ),
        ),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 10,
        )
      ],
    );
  }

  Row prodAdd(Product product, quantity) {
    return Row(
      children: [
        InkWell(
          onTap: () => decreaseQuantity(product),
          child: Container(
            width: 35,
            height: 32,
            color: GlobalVariables.selectedNavBarColor,
            alignment: Alignment.center,
            child: const Icon(
              Icons.remove,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 1.5),
            color: Colors.white,
            borderRadius: BorderRadius.circular(0),
          ),
          child: Container(
            width: 35,
            height: 32,
            alignment: Alignment.center,
            child: Text(
              quantity.toString(),
            ),
          ),
        ),
        InkWell(
          onTap: () => increaseQuantity(product),
          child: Container(
            color: GlobalVariables.selectedNavBarColor,
            width: 35,
            height: 32,
            alignment: Alignment.center,
            child: const Icon(
              Icons.add,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
