import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/auth_view_model.dart';
import '../resources/component/custom_round_button.dart';
import '../utils/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _email = TextEditingController();

  final TextEditingController _pass = TextEditingController();

  final FocusNode emailFocus = FocusNode();

  final FocusNode passFocus = FocusNode();

  final ValueNotifier _obscurePassword = ValueNotifier(false);

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _pass.dispose();
    passFocus.dispose();
    emailFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          controller: _email,
          focusNode: emailFocus,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: "Email",
              hintText: "e.g. xyz@gmail.com",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
          onFieldSubmitted: (value) {
            Utils.fieldFocusNode(context, emailFocus, passFocus);
          },
        ),
        SizedBox(height: 10),
        ValueListenableBuilder(
            valueListenable: _obscurePassword,
            builder: (context, value, child) => TextFormField(
                  controller: _pass,
                  focusNode: passFocus,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: _obscurePassword.value,
                  decoration: InputDecoration(
                      labelText: "password",
                      hintText: "e.g. 123456",
                      suffixIcon: InkWell(
                        onTap: () {
                          _obscurePassword.value = !_obscurePassword.value;
                        },
                        child: Icon(_obscurePassword.value
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                  onFieldSubmitted: (value) {
                    Utils.fieldFocusNode(context, passFocus, passFocus);
                  },
                )),
        SizedBox(height: 20),
        CustomRoundButton(
            title: 'Sign up',
            loading: authViewModel.loading,
            onPressed: () {
              if (_email.text.isEmpty || _email.text == null) {
                Utils.snackBar("Please enter email", context);
              } else if (_pass.text.isEmpty) {
                Utils.snackBar("Please enter password", context);
              } else if (_pass.text.length < 6) {
                Utils.snackBar("Password is less then 6", context);
              } else {
                Map<String, dynamic> data = {
                  'email': _email.text.toString().trim(),
                  'password': _pass.text.toString().trim()
                };
                authViewModel.signUp(data, context);
              }
            }),
      ],
    )));
  }
}
