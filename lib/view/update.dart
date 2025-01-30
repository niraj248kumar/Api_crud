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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),hintText: "Product Name"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: priceController,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),hintText: "Price"),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: mobileController,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),hintText: "Mobile"),
                keyboardType: TextInputType.phone,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: discountedPriceController,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),hintText: "Discounted Price"),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    style:ElevatedButton.styleFrom(backgroundColor: Colors.blue) ,
                    onPressed: () {
                  var update = ProductModel(
                    name: nameController.text,
                    price: priceController.text,
                    discountedPrice: discountedPriceController.text,
                    mob: mobileController.text,
                  );
                  Provider.of<ProviderApi>(context, listen: false)
                      .updateMultiRequest(context, update,widget.model.id!);
                }, child: Text('Update',style: TextStyle(color: Colors.white,fontSize: 18),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
