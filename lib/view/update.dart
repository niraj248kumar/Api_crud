import 'package:flutter/material.dart';
import 'package:new_api/provider/provider_page.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';

class UpdateScreen extends StatefulWidget {
  final ProductModel model;
  const UpdateScreen({super.key, required this.model});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  late TextEditingController  nameController;
  late TextEditingController  priceController;
  late TextEditingController  mobileController;
  late TextEditingController  discountedPriceController;


  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.model.name);
    mobileController = TextEditingController(text: widget.model.mob);
    priceController = TextEditingController(text: widget.model.price);
    discountedPriceController = TextEditingController(text: widget.model.discountedPrice);
  }
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    mobileController.dispose();
    priceController.dispose();
    discountedPriceController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderApi>(context,listen: false);
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Update Product')),backgroundColor: Colors.blue,),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: "Product Name"),
          ),
          TextField(
            controller: priceController,
            decoration: InputDecoration(labelText: "Price"),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: mobileController,
            decoration: InputDecoration(labelText: "Mobile"),
            keyboardType: TextInputType.phone,
          ),
          TextField(
            controller: discountedPriceController,
            decoration: InputDecoration(labelText: "Discounted Price"),
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(onPressed: () {
            var update = ProductModel(
              name: nameController.text,
              price: priceController.text,
              discountedPrice: discountedPriceController.text,
              mob: mobileController.text,
            );
            Provider.of<ProviderApi>(context, listen: false)
                .updateMultiRequest(context, update,widget.model.id!);
          }, child: Text('Update'))
        ],
      ),
    );
  }
}
