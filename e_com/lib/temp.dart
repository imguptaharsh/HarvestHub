// import 'package:flutter/material.dart';

// import 'models/product.dart';

// class ProductCard extends StatelessWidget {
//   final Product product;
//   final ValueChanged<Product> onSelected;
//   ProductCard({Key key, this.product, this.onSelected}) : super(key: key);

// //   @override
// //   _ProductCardState createState() => _ProductCardState();
// // }

// // class _ProductCardState extends State<ProductCard> {
// //   Product product;
// //   @override
// //   void initState() {
// //     product = widget.product;
// //     super.initState();
// //   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // ignore: prefer_const_constructors
//       decoration: BoxDecoration(
//         // color: LightColor.background,
//         borderRadius: const BorderRadius.all(Radius.circular(20)),
//         // ignore: prefer_const_literals_to_create_immutables
//         boxShadow: <BoxShadow>[
//           const BoxShadow(
//               color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
//         ],
//       ),
//       // margin: EdgeInsets.symmetric(vertical: !product.isSelected ? 20 : 0),
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         child: Stack(
//           alignment: Alignment.center,
//           children: <Widget>[
//             // Positioned(
//             //   left: 0,
//             //   top: 0,
//             //   child: IconButton(
//             //     icon: Icon(
//             //       product.isliked ? Icons.favorite : Icons.favorite_border,
//             //       color:
//             //           product.isliked ? LightColor.red : LightColor.iconColor,
//             //     ),
//             //     onPressed: () {},
//             //   ),
//             // ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 // SizedBox(height: product.isSelected ? 15 : 0),
//                 Expanded(
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: <Widget>[
//                       CircleAvatar(
//                         radius: 40,
//                         // backgroundColor: LightColor.orange.withAlpha(40),
//                       ),
//                       // Image.asset(product.images)
//                     ],
//                   ),
//                 ),
//                 // SizedBox(height: 5),
//                 // TitleText(
//                 //   text: product.name,
//                 //   fontSize: product.isSelected ? 16 : 14,
//                 // ),
//                 // TitleText(
//                 //   text: product.category,
//                 //   fontSize: product.isSelected ? 14 : 12,
//                 //   color: LightColor.orange,
//                 // ),
//                 // TitleText(
//                 //   text: product.price.toString(),
//                 //   fontSize: product.isSelected ? 18 : 16,
//                 // ),
//               ],
//             ),
//           ],
//         ),
//       ).ripple(() {
//         Navigator.of(context).pushNamed('/detail');
//         onSelected(product);
//       }, borderRadius: BorderRadius.all(Radius.circular(20))),
//     );
//   }
// }
