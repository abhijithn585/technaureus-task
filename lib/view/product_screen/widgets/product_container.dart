// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:task/model/product_model.dart';
// // import 'package:task/service/api_service.dart';

// // class ProductContainer extends StatelessWidget {
// //   const ProductContainer({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return FutureBuilder<List<ProductModel>>(
// //       future: ApiService().getProducts(),
// //       builder: (context, snapshot) {
// //         if (snapshot.connectionState == ConnectionState.waiting) {
// //           return const Center(
// //             child: CircularProgressIndicator(),
// //           );
// //         } else if (snapshot.hasData) {
// //           final products = snapshot.data;
// //           return Expanded(
// //             child: GridView.builder(
// //               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //                 crossAxisCount: 2,
// //                 crossAxisSpacing: 10,
// //                 mainAxisSpacing: 15,
// //               ),
// //               itemCount: products!.length,
// //               itemBuilder: (context, index) {
// //                 final product = products[index];
// //                 return Padding(
// //                   padding: const EdgeInsets.all(8),
// //                   child: Container(
// //                     height: 110,
// //                     width: 150,
// //                     decoration: BoxDecoration(
// //                       borderRadius: BorderRadius.circular(20),
// //                       color: Colors.white,
// //                       boxShadow: [
// //                         BoxShadow(
// //                           color: Colors.grey.withOpacity(0.5),
// //                           spreadRadius: 5,
// //                           blurRadius: 7,
// //                           offset: const Offset(0, 3),
// //                         ),
// //                       ],
// //                     ),
// //                     child: Column(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         SizedBox(
// //                           height: 120,
// //                           child: Image.network(
// //                               'http://143.198.61.94${product.image}'),
// //                         ),
// //                         Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                           children: [
// //                             Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 Padding(
// //                                   padding: const EdgeInsets.only(left: 10),
// //                                   child: Text(product.name!),
// //                                 ),
// //                                 Padding(
// //                                   padding: const EdgeInsets.only(left: 10),
// //                                   child:
// //                                       Text('\$${product.price.toString()}/-'),
// //                                 ),
// //                               ],
// //                             ),
// //                             Padding(
// //                               padding: const EdgeInsets.all(8.0),
// //                               child: Container(
// //                                 height: 30,
// //                                 width: 40,
// //                                 decoration: BoxDecoration(
// //                                   color: const Color.fromARGB(255, 0, 52, 143),
// //                                   borderRadius: BorderRadius.circular(5),
// //                                 ),
// //                                 child: Center(
// //                                   child: Text(
// //                                     'Add',
// //                                     style: GoogleFonts.urbanist(
// //                                       fontSize: 15,
// //                                       fontWeight: FontWeight.bold,
// //                                       color: Colors.white,
// //                                     ),
// //                                   ),
// //                                 ),
// //                               ),
// //                             )
// //                           ],
// //                         )
// //                       ],
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //           );
// //         } else {
// //           return Center(
// //             child: Text(snapshot.error.toString()),
// //           );
// //         }
// //       },
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:task/controllers/api_provider.dart';
// import 'package:task/model/product_model.dart';
// import 'package:task/service/api_service.dart';

// class ProductContain extends StatelessWidget {
//   const ProductContain({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ApiProvider>(
//       builder: (context, apiProvider, child) {
//         return FutureBuilder<List<ProductModel>>(
//           future: apiProvider.fetchProducts(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else if (snapshot.hasData) {
//               final products = snapshot.data!;
//               return Expanded(
//                 child: GridView.builder(
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 15,
//                   ),
//                   itemCount: products.length,
//                   itemBuilder: (context, index) {
//                     final product = products[index];
//                     return Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: Container(
//                         height: 110,
//                         width: 150,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: Colors.white,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               spreadRadius: 5,
//                               blurRadius: 7,
//                               offset: const Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SizedBox(
//                               height: 120,
//                               child: Image.network(
//                                   'http://143.198.61.94${product.image}'),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 10),
//                                       child: Text(product.name!),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 10),
//                                       child: Text('\$${product.price.toString()}/-'),
//                                     ),
//                                   ],
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Container(
//                                     height: 30,
//                                     width: 40,
//                                     decoration: BoxDecoration(
//                                       color: const Color.fromARGB(255, 0, 52, 143),
//                                       borderRadius: BorderRadius.circular(5),
//                                     ),
//                                     child: Center(
//                                       child: Text(
//                                         'Add',
//                                         style: GoogleFonts.urbanist(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               );
//             } else {
//               return Center(
//                 child: Text(snapshot.error.toString()),
//               );
//             }
//           },
//         );
//       },
//     );
//   }
// }

