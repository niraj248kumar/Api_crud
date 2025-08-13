import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:new_api/model/product.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../register/login.dart';
import '../view/homePage.dart';

class ProviderApi extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController discountedPriceController = TextEditingController();
  List<ProductModel> productList = [];

  Future<void> login(BuildContext context, String email, String pass) async {
    try {
      Uri url =
          Uri.parse("https://shareittofriends.com/demo/flutter/Login.php");
      Response response = await post(
        url,
        body: {
          'email': email,
          'password': pass,
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        // Check if login is successful
        if (data['title'] == "Logged In!") {
          var userData = data['data'];
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setBool('isLogin', true);
          await pref.setString('user_token', userData['user_token']);
          await pref.setString('id', userData['id']);
          await pref.setString('name', userData['name']);
          await pref.setString('mobile', userData['mobile']);
          await pref.setString('email', userData['email']);
          Fluttertoast.showToast(msg: 'Login successful!');

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Homepage()),
          );
        } else {
          Fluttertoast.showToast(msg: 'Invalid credentials!');
        }
      } else {
        Fluttertoast.showToast(msg: 'Error: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: 'An error occurred: ${e.toString()}');
    }
  }

  void login_splash(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? isRegister = pref.getBool('isLogin');
    if (isRegister != null && isRegister) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Homepage(),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    }
  }

  Future<List<ProductModel>> getMultiRequest() async {
    try {
      Uri uri = Uri.parse("https://shareittofriends.com/demo/flutter/productList.php");
      var response = http.MultipartRequest("POST", uri);
      response.fields.addAll({"user_login_token": "c2a2f674c6f6a1d2374da1ebfab69adc"});
      response.headers.addAll({"Content-Type": "application/json"});
      var result = await response.send();
      if (result.statusCode == 200) {
        var data = await result.stream.bytesToString();
        List<dynamic> dataResult = json.decode(data);
        var product = dataResult.map(
              (e) => ProductModel.fromJson(e),
            )
            .toList();
        productList.clear();
        productList.addAll(product);

        Fluttertoast.showToast(msg: "successfully ${result.statusCode}");
        notifyListeners();
        return productList;
      } else {
        Fluttertoast.showToast(msg: "Error ${result.statusCode}");
      }
      return List<ProductModel>.empty();
    } catch (e) {
      print(e);
      return List<ProductModel>.empty();
    }
  }

  Future<void> postMultiRequest(BuildContext context, ProductModel data) async {
    try {
      Uri uri =
          Uri.parse("https://shareittofriends.com/demo/flutter/addProduct.php");
      var response = http.MultipartRequest("POST", uri);
      response.fields.addAll({
        "user_login_token": "c2a2f674c6f6a1d2374da1ebfab69adc",
        'name': data.name!,
        'moq': data.mob!,
        'price': data.price!,
        'discounted_price': data.discountedPrice!
      });
      // response.headers.addAll({"Content-Type": "application/json"});
      var result = await response.send();
      if (result.statusCode == 200) {
        nameController.clear();
        priceController.clear();
        mobileController.clear();
        discountedPriceController.clear();
        await getMultiRequest();

        Fluttertoast.showToast(msg: "successfully ${result.statusCode}");
        Navigator.pop(context);
        notifyListeners();
      } else {
        Fluttertoast.showToast(msg: "Error ${result.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteProduct(ProductModel delete) async {
    var request = http.MultipartRequest(
        "POST",
        Uri.parse("https://shareittofriends.com/demo/flutter/deleteProduct.php"));
    request.fields.addAll({
      "user_login_token": "c2a2f674c6f6a1d2374da1ebfab69adc",
      "id": delete.id!
    });
    var response = await request.send();
    if (response.statusCode == 200) {
      await getMultiRequest();
      Fluttertoast.showToast(msg: 'Product delete Success');
    } else {
      Fluttertoast.showToast(msg: 'Product delete fail');
    }
  }

  Future<List<ProductModel>> updateMultiRequest(
      BuildContext context, ProductModel modelProduct, String userId) async {
    try {
      Uri uri = Uri.parse(
          "https://shareittofriends.com/demo/flutter/editProduct.php");
      var response = http.MultipartRequest("POST", uri);
      response.fields.addAll({
        "user_login_token": "c2a2f674c6f6a1d2374da1ebfab69adc",
        'name': modelProduct.name!,
        'moq': modelProduct.mob!,
        'price': modelProduct.price!,
        "id": userId,
        'discounted_price': modelProduct.discountedPrice!
      });
      var result = await response.send();
      if (result.statusCode == 200) {
        nameController.clear();
        priceController.clear();
        mobileController.clear();
        discountedPriceController.clear();
        Fluttertoast.showToast(msg: "successfully ${result.statusCode}");
        Navigator.pop(context);
        await getMultiRequest();
        notifyListeners();
        return productList;
      } else {
        Fluttertoast.showToast(msg: "Error ${result.statusCode}");
      }
      return List<ProductModel>.empty();
    } catch (e) {
      print(e);
      return List<ProductModel>.empty();
    }
  }
}
