import 'package:flutter/material.dart';
import './mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('This is a Login screen'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
            key: formKey,
            child: Column(
              children: [
                emailField(),
                passwordField(),
                const SizedBox(
                  height: 20,
                ),
                submitButton(),
              ],
            )),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      validator: validateEmail,
      onSaved: (newValue) {
        email = newValue!;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        label: Text('Email Address'),
        hintText: 'jn@domain.com',
      ),
    );
  }

  Widget passwordField() {
    return TextFormField(
      validator: validatePassword,
      onSaved: (newValue) {
        password = newValue!;
      },
      obscureText: true,
      decoration: const InputDecoration(
        label: Text('Password'),
      ),
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      style: ButtonStyle(
          // shape: MaterialStatePropertyAll(),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          padding: const MaterialStatePropertyAll(EdgeInsets.all(10))),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState?.save();
          print(
              'It is time to send the email: $email and password: $password to my API');
        }
      },
      child: const Text('Submit'),
    );
  }
}
