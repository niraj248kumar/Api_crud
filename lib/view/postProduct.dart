import 'package:flutter/material.dart';
import 'package:new_api/model/product.dart';
import 'package:provider/provider.dart';
import '../provider/provider_page.dart';

class PostProduct extends StatefulWidget {
  const PostProduct({super.key});
  @override
  State<PostProduct> createState() => _PostProductState();
}
class _PostProductState extends State<PostProduct> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderApi>(context,listen: false);
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('PostProduct')),backgroundColor: Colors.lightBlue,),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: provider.nameController,
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Name..'),),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: provider.priceController,
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Price..'),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: provider.mobileController,
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Mobile..'),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: provider.discountedPriceController,
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'discounted_price..'),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    if (provider.nameController.text.isEmpty ||
                        provider.priceController.text.isEmpty ||
                        provider.mobileController.text.isEmpty||
                        provider.discountedPriceController.text.isEmpty
                    ) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please fill all fields!")),
                      );
                    } else {
                      var productModel = ProductModel(
                        name:provider.nameController.text,
                        price:provider.priceController.text,
                        mob:provider.mobileController.text,
                        discountedPrice:provider.discountedPriceController.text,
                      );
                      provider.postMultiRequest(context,productModel);
                    }
                  },
                  child: Text('Post',style: TextStyle(fontSize: 25, color: Colors.white),)),
            ),
          )

        ],
      ),
    );
  }
}
