// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../model/product_model.dart';
//
// class UpdateProduct extends StatefulWidget {
//   final ProductModel data;
//
//   const UpdateProduct({super.key, required this.data});
//
//   @override
//   State<UpdateProduct> createState() => _UpdateProductState();
// }
//
// class _UpdateProductState extends State<UpdateProduct> {
//   late TextEditingController nameController;
//   late TextEditingController mobController;
//   late TextEditingController priceController;
//   late TextEditingController discountedPriceController;
//
//   @override
//   void initState() {
//     super.initState();
//
//     nameController = TextEditingController(text: widget.data.name);
//     mobController = TextEditingController(text: widget.data.moq);
//     priceController = TextEditingController(text: widget.data.price);
//     discountedPriceController = TextEditingController(text: widget.data.discountedPrice);
//   }
//
//   @override
//   void dispose() {
//     nameController.dispose();
//     mobController.dispose();
//     priceController.dispose();
//     discountedPriceController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blueGrey,
//           title: const Text('Update Product'),
//           foregroundColor: Colors.white,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
//           child: Column(
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(hintText: 'Enter Name'),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: mobController,
//                 decoration: const InputDecoration(hintText: 'Mobile number'),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: priceController,
//                 decoration: const InputDecoration(hintText: 'Price'),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: discountedPriceController,
//                 decoration: const InputDecoration(hintText: 'Discounted Price'),
//               ),
//               const SizedBox(height: 50),
//               ElevatedButton(
//                 onPressed: () {
//                   var updatedData = ProductModel(
//                     name: nameController.text,
//                     moq: mobController.text,
//                     price: priceController.text,
//                     discountedPrice: discountedPriceController.text,
//                   );
//
//                   Provider.of<ProductProvider>(context, listen: false)
//                       .editProduct(context, updatedData,widget.data.id!);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
//                 ),
//                 child: const Text('Update Data'),
//               )
//             ],
//           ),
//         ),
//               );
//         }
// }