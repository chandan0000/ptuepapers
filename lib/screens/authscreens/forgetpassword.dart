import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({Key? key}) : super(key: key);

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
              'Welcome To Ptupapers'.text.size(20).bold.make().shimmer(
                    primaryColor: Colors.black,
                    secondaryColor: Colors.white,
                  ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
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
                  onPressed: () {},
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
