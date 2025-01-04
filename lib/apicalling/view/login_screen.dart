import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/apicalling/model/auth_view_model.dart';
import 'package:provider_tutorial/apicalling/resources/component/custom_round_button.dart';
import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            title: 'Login',
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
                authViewModel.login(data, context);
                Utils.snackBar("Hit button", context);
              }
            })
      ],
    )));
  }
}
