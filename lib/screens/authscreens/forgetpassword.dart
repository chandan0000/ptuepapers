import 'package:flutter/material.dart';
import 'package:ptuepapers/controller/authcontroller.dart';
import 'package:velocity_x/velocity_x.dart';

class Forgetpassword extends StatelessWidget {
  // final String name;
  Forgetpassword({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  AuthController auth = AuthController();
  dispose() {
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 140,
              ),
              VxCircle(
                radius: 90,
                backgroundImage: const DecorationImage(
                  image: AssetImage(
                    'assets/ptulogo.png',
                  ),
                ),
              ).centered(),
              const SizedBox(
                height: 10,
              ),
              'Welcome To Ptupapers'.text.size(20).bold.make(),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.email),

                  hintText: 'Enter Your Email',
                  labelText: 'Email',
                  // border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    if (_emailController.text.isNotEmpty) {
                      auth.forgetPassword(
                          email: _emailController.text, context: context);
                    }
                  },
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
