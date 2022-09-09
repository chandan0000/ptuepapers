import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:ptuepapers/config/routes/routesname.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ValueNotifier<bool> _obsecuredPassword = ValueNotifier<bool>(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
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
                    focusNode: emailFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.email),

                      hintText: 'Enter Your Email',
                      labelText: 'Email',
                      // border: OutlineInputBorder(),
                    ),
                    onFieldSubmitted: (_) {
                      Utils.filedFocusChange(
                          context, emailFocusNode, passwordFocusNode);
                    },
                    validator: (value) {
                      // email validation
                      if (value!.isEmpty) {
                        return 'Please Enter Your Email';
                      }
                      if (!value.contains('@')) {
                        return 'Please Enter Valid Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ValueListenableBuilder(
                      valueListenable: _obsecuredPassword,
                      builder: (context, value, child) {
                        return TextFormField(
                          controller: _passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _obsecuredPassword.value,
                          focusNode: passwordFocusNode,
                          obscuringCharacter: '*',
                          validator: (String? value) {
                            RegExp regex = RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                            if (value!.isEmpty) {
                              return 'Please enter password';
                            } else if (value.length < 9) {
                              return 'Password must be at least 8 characters';
                            } else {
                              if (!regex.hasMatch(value)) {
                                return 'Please Enter password start eg: A192352@k';
                              } else {
                                return null;
                              }
                            }
                          },
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: () {
                                _obsecuredPassword.value =
                                    !_obsecuredPassword.value;
                              },
                              child: Icon(
                                _obsecuredPassword.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility,
                              ),
                            ),

                            hintText: 'Enter Your Password',
                            labelText: 'Password',
                            // border: OutlineInputBorder(),
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 6,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        GoRouter.of(context)
                            .pushNamed(RoutesName.forgetPassowrd);
                      },
                      child: 'Forgot Password?'.text.blue500.bold.fade.make(),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            GoRouter.of(context).go(RoutesName.bottomNavBar);
                          }
                        },
                        child: 'Login'.text.white.center.bold.make()),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  // ! Dash Line
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      VxDash(
                        dashColor: Colors.black,
                        length: 100,
                      ),
                      Text(' OR '),
                      VxDash(
                        dashColor: Colors.black,
                        length: 100,
                      )
                    ],
                  ),

                  //icon Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.google,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.github,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).go(RoutesName.signUp);
                    },
                    child: const Text.rich(TextSpan(
                      text: 'Don\'t have an account? ',
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
