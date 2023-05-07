import 'package:flutter/material.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_widgets.dart';
import '../../../constants/global_variable.dart';
import '../services/auth_service.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/lo.png'), // Replace with your own image path
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 300),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      // child: Image.asset('assets/images/frontlogo.png'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      tileColor: _auth == Auth.signup
                          ? Colors.transparent
                          : Colors.transparent,
                      title: const Text(
                        'Create Account',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      leading: Radio(
                        activeColor: _auth == Auth.signup
                            ? GlobalVariables.selectedNavBarColor
                            : Colors.white,
                        value: Auth.signup,
                        groupValue: _auth,
                        onChanged: (Auth? val) {
                          setState(() {
                            _auth = val!;
                          });
                        },
                      ),
                    ),
                    if (_auth == Auth.signup)
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.transparent,
                        child: Form(
                          key: _signUpFormKey,
                          child: Column(
                            children: [
                              CustomTextField(
                                controller: _nameController,
                                hintText: 'Name',
                              ),
                              const SizedBox(height: 10),
                              CustomTextField(
                                controller: _emailController,
                                hintText: 'Email',
                              ),
                              const SizedBox(height: 10),
                              CustomTextField(
                                controller: _passwordController,
                                hintText: 'Password',
                              ),
                              const SizedBox(height: 10),
                              CustomButton(
                                text: 'Sign Up',
                                onTap: () {
                                  if (_signUpFormKey.currentState!.validate()) {
                                    signUpUser();
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ListTile(
                      tileColor: _auth == Auth.signin
                          ? Colors.transparent
                          : Colors.transparent,
                      title: const Text(
                        'Sign-In.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      leading: Radio(
                        activeColor: GlobalVariables.selectedNavBarColor,
                        value: Auth.signin,
                        groupValue: _auth,
                        onChanged: (Auth? val) {
                          setState(() {
                            _auth = val!;
                          });
                        },
                      ),
                    ),
                    if (_auth == Auth.signin)
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.transparent,
                        child: Form(
                          key: _signInFormKey,
                          child: Column(
                            children: [
                              CustomTextField(
                                controller: _emailController,
                                hintText: 'Email',
                              ),
                              const SizedBox(height: 10),
                              CustomTextField(
                                controller: _passwordController,
                                hintText: 'Password',
                              ),
                              const SizedBox(height: 10),
                              CustomButton(
                                text: 'Sign In',
                                onTap: () {
                                  if (_signInFormKey.currentState!.validate()) {
                                    signInUser();
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
