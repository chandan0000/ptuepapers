import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:ptuepapers/config/routes/routesname.dart';
import 'package:ptuepapers/controller/authcontroller.dart';
import 'package:ptuepapers/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  final ValueNotifier<bool> _obsecuredPassword = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _obsecuredPassword2 = ValueNotifier<bool>(true);
  final _formKey = GlobalKey<FormState>();
  AuthController auth = AuthController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                  'Welcome To Ptupapers'.text.size(20).bold.make(),
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
                    onFieldSubmitted: (_) {},
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

                            hintText: 'Enter Your New Password',
                            labelText: 'New Password',
                            // border: OutlineInputBorder(),
                          ),
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
                            return null;
                          },
                        );
                      }),

                  const SizedBox(
                    height: 20,
                  ),
                  ValueListenableBuilder(
                      valueListenable: _obsecuredPassword2,
                      builder: (context, value, child) {
                        return TextFormField(
                          controller: _confirmPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _obsecuredPassword2.value,
                          focusNode: confirmPasswordFocusNode,
                          obscuringCharacter: '*',
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: () {
                                _obsecuredPassword2.value =
                                    !_obsecuredPassword2.value;
                              },
                              child: Icon(
                                _obsecuredPassword2.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility,
                              ),
                            ),

                            hintText: 'Confirm Your Password',
                            labelText: 'Confirm Password',
                            // border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter valid password';
                            } else if (value.length < 9) {
                              return 'Password must be at least 8 characters';
                            } else if (value != _passwordController.text) {
                              return 'Password is not match';
                            }
                            return null;
                          },
                        );
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // );
                          auth.signUp(
                              email: _emailController.text,
                              cPassword: _passwordController.text,
                              context: context);
                          // GoRouter.of(context).go(RoutesName.bottomNavBar);
                        }
                      },
                      child: const Text('Sign Up'),
                    ),
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
                        onPressed: () async {
                          UserCredential credential =
                              await AuthController().signInWithGoogle();
                          if (credential != null) {
                            GoRouter.of(context).go(RoutesName.bottomNavBar);
                          } else {
                            Utils.snackBar(
                                'Sometime wrong ', context, Colors.red);
                          }
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.google,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).go(RoutesName.signIn);
                    },
                    child: const Text.rich(TextSpan(
                      text: 'I have an already account? ',
                      children: [
                        TextSpan(
                          text: 'Login',
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
