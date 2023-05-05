import 'package:e_com/common/widgets/loader.dart';
import 'package:e_com/features/home/services/home_services.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// import '../../../common/widgets/loader.dart';
import '../../../constants/global_variable.dart';
import '../../../models/product.dart';
import '../../cart/screen/cart_screen.dart.dart';
import '../../product_details/screen/product_details_screen.dart';

class CategoryDealScreen extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryDealScreen({super.key, required this.category});

  @override
  State<CategoryDealScreen> createState() => _CategoryDealScreenState();
}

class _CategoryDealScreenState extends State<CategoryDealScreen> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    productList = await homeServices.fetchCategoryProducts(
      context: context,
      category: widget.category,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    double newheight = height - padding.top - padding.bottom;
    return Scaffold(
      backgroundColor: GlobalVariables.mainColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(padding.top),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Text(
            widget.category,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: productList == null
          ? const Loader()
          : Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Keep shopping for ${widget.category}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    height: newheight - 100,
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(20),
                      itemCount: productList!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              childAspectRatio: 2.2,
                              mainAxisSpacing: 20,
                              mainAxisExtent: 180),
                      itemBuilder: (context, index) {
                        final product = productList![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ProductDetailScreen.routeName,
                              arguments: product,
                            );
                          },
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  // ignore: prefer_const_constructors
                                  BoxShadow(
                                    color: Colors.black38,
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 100,
                                  child: Center(
                                    child: Image.network(
                                      product.images[0],
                                      fit: BoxFit.contain,
                                      height: 135,
                                      width: 135,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          product.name,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 2,
                                        ),
                                      ),
                                      Container(
                                        height: 20,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          // color: const Color(0xfff6d798),
                                          color: Colors.yellow[800],
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Image.asset(
                                                'assets/images/star.png'),
                                            Text(
                                              // '4.8',
                                              // product.rating.first
                                              product.rating!.isEmpty
                                                  ? '0'
                                                  : '${product.rating![0].rating}',

                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 4.0, left: 8.0, right: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: RichText(
                                              text: TextSpan(
                                                text: 'Price: ',
                                                style: const TextStyle(
                                                  // fontSize: 16,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        '₹${product.price.toInt()}',
                                                    style: const TextStyle(
                                                      // fontSize: 22,
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              // ignore: prefer_const_constructors
                                              Text(
                                                'Qty: ',
                                                // ignore: prefer_const_constructors
                                                style: TextStyle(
                                                    color: Colors.black38,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                product.quantity
                                                    .toInt()
                                                    .toString(),
                                                // ignore: prefer_const_constructors
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (ctx) =>
                                                const CartScreen(),
                                          ),
                                        ),
                                        child: Container(
                                          // padding:
                                          // const EdgeInsets.only(bottom: 10),
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: Color(0xff3dab85),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Image.asset(
                                            'assets/images/cart.png',
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                // SizedBox(
                                //   height: 100,
                                // )
                              ],
                            ),
                          ),

                          // child: Column(
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   children: [
                          //     SizedBox(
                          //       height: 160,
                          //       child: DecoratedBox(
                          //         decoration: BoxDecoration(
                          //           border: Border.all(
                          //             color: Colors.black12,
                          //             width: 0.3,
                          //           ),
                          //         ),
                          //         child: SingleChildScrollView(
                          //           scrollDirection: Axis.horizontal,
                          //           child: Column(
                          //             children: [
                          //               Image.network(
                          //                 product.images[0],
                          //                 fit: BoxFit.contain,
                          //                 height: 135,
                          //                 width: 135,
                          //               ),
                          //               Column(
                          //                 children: [
                          //                   Container(
                          //                     width: 235,
                          //                     // height: 10,
                          //                     padding:
                          //                         const EdgeInsets.symmetric(
                          //                             horizontal: 10),
                          //                     child: Text(
                          //                       product.name,
                          //                       style: const TextStyle(
                          //                           fontSize: 16,
                          //                           fontWeight:
                          //                               FontWeight.w500),
                          //                       maxLines: 2,
                          //                     ),
                          //                   ),
                          //                   const SizedBox(
                          //                     height: 10,
                          //                   ),
                          //                   Container(
                          //                     width: 235,
                          //                     padding: const EdgeInsets.only(
                          //                         left: 10, top: 5),
                          //                     child: Text(
                          //                       '₹${product.price}',
                          //                       style: const TextStyle(
                          //                         fontSize: 20,
                          //                         fontWeight: FontWeight.bold,
                          //                       ),
                          //                       maxLines: 2,
                          //                     ),
                          //                   ),
                          //                   Container(
                          //                     width: 235,
                          //                     padding: const EdgeInsets.only(
                          //                         left: 10),
                          //                     child: const Text(
                          //                         'Eligible for FREE Shipping'),
                          //                   ),
                          //                   Container(
                          //                     width: 235,
                          //                     padding: const EdgeInsets.only(
                          //                         left: 10, top: 5),
                          //                     child: const Text(
                          //                       'In Stock',
                          //                       style: TextStyle(
                          //                         color: Colors.teal,
                          //                       ),
                          //                       maxLines: 2,
                          //                     ),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
