import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider_page.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderApi>(context,listen: false) ;
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Register Page')),backgroundColor: Colors.lightBlue,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: provider.emailController,
                decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Email'),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: provider.passController,
                decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Password'),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      provider.login(context, provider.emailController.text, provider.passController.text);
                    },
                    child: Text('Register',style: TextStyle(fontSize: 25, color: Colors.white),)),
              ),
            )

          ],

        ),
      ),
    );
  }
}
