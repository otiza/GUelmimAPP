import 'package:flutter/material.dart';
import 'package:form_app/screens/home_page.dart';

import '../models/CreateAccountForm.dart';
import '../services/storage_service.dart';

class loginAccount extends StatefulWidget {
  const loginAccount({super.key});

  @override
  State<loginAccount> createState() => _loginAccountState();
}

class _loginAccountState extends State<loginAccount> {
  CreateAccountForm? formReturn;
  final formKey = GlobalKey<FormState>();

  bool is_visible = true;
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login to account"),
      ),
      backgroundColor: Colors.grey[400],
      body: SingleChildScrollView(
          child: Center(
              child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              //create user form
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),

              TextFormField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Email",
                  hintText: "Email",
                  //color

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                onSaved: (value) {
                  formReturn!.email = value!;
                  // formReturn!.quantity = double.parse(value!);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a valid email";
                  }
                  // check if email is valid
                  final emailRegex =
                      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              TextFormField(
                obscureText: is_visible,
                controller: passwordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Password",
                  hintText: "Password",

                  prefixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          is_visible = !is_visible;
                        });
                      },
                      icon: Icon(is_visible
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  //color

                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                onSaved: (value) {
                  formReturn!.password = value!;
                  // formReturn!.quantity = double.parse(value!);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a valid password";
                  }
                  // check if password is valid
                  if (value.length < 8) {
                    return "Please enter a valid password";
                  }
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),

              //checkbox for moral user
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () async {
                        //validate form
                        if (formKey.currentState!.validate()) {
                          formReturn = CreateAccountForm(
                            first_name: "",
                            last_name: "",
                            email: "",
                            password: "",
                            phone: "",
                            address: "",
                            city: "",
                            state: "",
                            zip: "",
                          );

                          //save form
                          String email = "";
                          String password = "";
                          formKey.currentState!.save();
                          if (formReturn!.email != null &&
                              formReturn!.password != null) {
                            email = formReturn!.email!;
                            password = formReturn!.password!;
                          }
                          bool log = await formReturn!.login(email, password);
                          if (log) {
                            //
                            //clear the navigation stack
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const Home_PAge()),
                                (route) => false);
                          }
                          await printUsers();
                        }
                      },
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(Size(
                            MediaQuery.of(context).size.width * 0.3,
                            MediaQuery.of(context).size.height * 0.05)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.green[200]!),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ))),
    );
  }
}
