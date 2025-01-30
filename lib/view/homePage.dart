import 'package:flutter/material.dart';
import 'package:new_api/view/postProduct.dart';
import 'package:new_api/view/update.dart';
import 'package:provider/provider.dart';

import '../provider/provider_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
@override
  void initState() {
  super.initState();
   Future.delayed(Duration(seconds: 5),() {
     ProviderApi provider = Provider.of<ProviderApi>(context, listen: false);
     provider.getMultiRequest();
   },);


  }
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderApi>(context,listen: false) ;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Home Page')),
        actions: [
          InkWell(
             onTap: () {},
            child: const Icon(Icons.logout_outlined),
          ),
          SizedBox(width: 20,)
        ],
        backgroundColor: Colors.greenAccent,
      ),

      body: Consumer<ProviderApi>(builder: (context, value, child) {
        if(value.productList.isEmpty){
          return Center(
            child: Text("No data"),
          );
        } else {
         return ListView.builder(
            itemCount: provider.productList.length,
            itemBuilder: (context, index) {
              var data = provider.productList[index];
              return ListTile(
                  title: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Card(
                          child: Row(
                              children: [
                            SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(child: Text("${index}")),
                                SizedBox(
                                  width: 10,
                                ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${data.name}"),
                                Text("${data.price}"),
                                Text("${data.mob}"),
                              ],
                            ),
                            Spacer(),
                                PopupMenuButton(
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateScreen(model:data),));
                                          },
                                          child: Row(
                                            children: [
                                              InkWell(
                                                child: Text(
                                                  'Edit',
                                                ),
                                              ),
                                              Spacer(),
                                              Icon(Icons.edit)
                                            ],
                                          )),
                                    ),
                                    PopupMenuItem(
                                      child: InkWell(
                                          onTap: () {
                                           provider.deleteProduct(data);
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                'Delete',
                                              ),
                                              Spacer(),
                                              Icon(Icons.delete)
                                            ],
                                          )),
                                    ),
                                  ],
                                )
                          ]),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          }
        },),
      floatingActionButton: FloatingActionButton.extended(onPressed: () {
       Navigator.push(context, MaterialPageRoute(builder: (context) =>PostProduct(),));
      }, icon: Icon(Icons.add),label:Text('Post')),
    );
  }
}
