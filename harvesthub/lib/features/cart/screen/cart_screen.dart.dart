import 'package:harvesthub/features/cart/widgets/cart_subtotal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../constants/global_variable.dart';
import '../../../provider/user_provider.dart';
import '../../address/screen/address_screen.dart';
import '../../search/screen/search_screen.dart';
import '../widgets/cart_product.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = '/cart-details';
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  void navigateToAddress(int sum) {
    Navigator.pushNamed(
      context,
      AddressScreen.routeName,
      arguments: sum.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();
    return Scaffold(
        backgroundColor: GlobalVariables.mainColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            backgroundColor: Colors.white,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                      height: 42,
                      margin:
                          const EdgeInsets.only(left: 15, top: 15, right: 15),
                      child: Material(
                          borderRadius: BorderRadius.circular(15),
                          // elevation: 1,
                          child: TextFormField(
                              onFieldSubmitted: navigateToSearchScreen,
                              decoration: InputDecoration(
                                  prefixIcon: InkWell(
                                      onTap: () {},
                                      child: const Padding(
                                        padding: EdgeInsets.only(left: 6),
                                        child: Icon(Icons.search,
                                            color: Colors.white, size: 23),
                                      )),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 73, 125, 89),
                                  hintText: 'Search..',
                                  hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                  contentPadding:
                                      const EdgeInsets.only(top: 10),
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                  ))))),
                ),
                // Container(
                //     color: Colors.transparent,
                //     height: 42,
                //     margin: const EdgeInsets.symmetric(horizontal: 10),
                //     child: const Icon(Icons.mic, color: Colors.black, size: 25)),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CartSubtotal(),
              SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // foregroundColor: Color.fromARGB(255, 24, 181, 29),
                    backgroundColor: GlobalVariables.selectedNavBarColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                  ),
                  onPressed: () => navigateToAddress(sum),
                  child: Text(
                    "Proceed to Buy (${user.cart.length} items)".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                color: Colors.black12.withOpacity(0.08),
                height: 1,
              ),
              const SizedBox(height: 10),
              ListView.builder(
                itemCount: user.cart.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CartProduct(
                    index: index,
                  );
                },
              ),
            ],
          ),
        ));
  }

  // navigateToAddress(int sum) {}
}
