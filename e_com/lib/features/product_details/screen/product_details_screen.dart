import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_com/features/cart/screen/cart_screen.dart.dart';
import 'package:e_com/features/product_details/services/product_details_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../../common/stars.dart';
import '../../../constants/global_variable.dart';
import '../../../models/product.dart';
import '../../../provider/user_provider.dart';
import '../../search/screen/search_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.product});
  static const String routeName = '/product-details';
  final Product product;
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();

  double avgRating = 0;
  double myRating = 0;

  @override
  void initState() {
    super.initState();
    double totalRating = 0;
    for (int i = 0; i < widget.product.rating!.length; i++) {
      totalRating += widget.product.rating![i].rating;
      if (widget.product.rating![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myRating = widget.product.rating![i].rating;
      }
    }

    if (totalRating != 0) {
      avgRating = totalRating / widget.product.rating!.length;
    }
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  void addToCart() {
    productDetailsServices.addToCart(context: context, product: widget.product);
  }

  @override
  Widget build(BuildContext context) {
    const kTextColor = Color(0xFF535353);
    Color colorTemp() {
      if (myRating <= 1) {
        return const Color.fromARGB(255, 253, 19, 3);
      } else if (myRating <= 2) {
        return const Color.fromARGB(255, 220, 72, 9);
      } else if (myRating <= 3) {
        return Colors.yellow;
      } else if (myRating <= 4) {
        return const Color.fromARGB(255, 209, 250, 3);
      } else {
        return const Color.fromARGB(255, 6, 145, 11);
      }
    }

    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    double newheight = height - padding.top - padding.bottom;
    return Scaffold(
        // backgroundColor: colo,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: AppBar(
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
                      margin: const EdgeInsets.only(left: 15),
                      child: Material(
                          borderRadius: BorderRadius.circular(15),
                          elevation: 1,
                          child: TextFormField(
                              onFieldSubmitted: navigateToSearchScreen,
                              decoration: InputDecoration(
                                  prefixIcon: InkWell(
                                      onTap: () {},
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                          left: 6,
                                        ),
                                        child: Icon(Icons.search,
                                            color: Colors.black, size: 23),
                                      )),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Search..',
                                  hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                  ),
                                  contentPadding:
                                      const EdgeInsets.only(top: 10),
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.black38,
                                      width: 1,
                                    ),
                                  ))))),
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => const CartScreen(),
                      ),
                    ),
                  },
                  child: Container(
                    color: Colors.transparent,
                    height: 42,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Icon(
                      Icons.shopping_cart_checkout,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Product id:'),
                    Text(
                      widget.product.id!,
                    ),
                    Stars(rating: avgRating),
                  ]),
            ),
            // ignore: prefer_const_constructors

            CarouselSlider(
              items: widget.product.images.map(
                (i) {
                  return Builder(
                    builder: (BuildContext context) => Image.network(
                      i,
                      fit: BoxFit.contain,
                      height: 200,
                    ),
                  );
                },
              ).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                height: 250,
              ),
            ),

            SingleChildScrollView(
              child: Container(
                // height: newheight - 300,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black87,
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: GlobalVariables.mainColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 10,
                      ),
                      child: Text(widget.product.name,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: RichText(
                            text: TextSpan(
                              text: 'Deal Price: ',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: '${widget.product.price} ₹',
                                  style: const TextStyle(
                                    fontSize: 22,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                const TextSpan(
                                  text: ' per Kg',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          // width: 80,
                          // alignment: Alignment.topRight,
                          child: RichText(
                            text: TextSpan(
                              style: const TextStyle(color: kTextColor),
                              children: [
                                // ignore: prefer_const_constructors
                                TextSpan(text: "Qty\n"),
                                TextSpan(
                                  text: '${widget.product.quantity.toInt()}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    // color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // ColorBar(kTextColor),

                    const SizedBox(
                      height: 20,
                    ),
                    // Container(
                    // padding: const EdgeInsets.all(20),
                    // child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // children: [
                    // Container(
                    // padding: const EdgeInsets.symmetric(),
                    // child:

                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Description',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                    // ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        height: 250,
                        child: ListView(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.product.description,
                              style: const TextStyle(height: 1.5),
                            ),
                          ),
                        ]),
                      ),
                    ),
                    // ],
                    // ),
                    // height: 10,
                    // ),
                    Container(
                      color: GlobalVariables.mainColor,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            height: 50,
                            width: 58,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: Colors.green,
                              ),
                            ),
                            child: IconButton(
                              icon:
                                  const Icon(Icons.add_shopping_cart_outlined),
                              color: Colors.black,
                              onPressed: addToCart,
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.green,
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                ),
                                onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (ctx) => const CartScreen(),
                                  ),
                                ),
                                child: Text(
                                  "Buy  Now".toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      child: RatingBar.builder(
                        initialRating: myRating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: colorTemp(),
                        ),
                        // onRatingUpdate: (rating) {},
                        onRatingUpdate: (rating) {
                          productDetailsServices.rateProduct(
                            context: context,
                            product: widget.product,
                            rating: rating,
                          );
                        },
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        )));
  }
}
