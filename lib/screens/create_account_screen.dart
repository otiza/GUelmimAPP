import 'package:flutter/material.dart';

import '../models/CreateAccountForm.dart';
import '../services/storage_service.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  CreateAccountForm? formReturn;
  final formKey = GlobalKey<FormState>();
  bool is_moral = false;
  bool is_visible = true;
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Account"),
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
                  labelText: "First Name",
                  hintText: "First Name",
                  //color

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                onSaved: (value) {
                  formReturn!.first_name = value!;
                  // formReturn!.quantity = double.parse(value!);
                },
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 3) {
                    return "Please enter name";
                  }
                  //check if name is valid
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Last Name",
                  hintText: "Last Name",
                  //color

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                onSaved: (value) {
                  formReturn!.last_name = value!;
                  // formReturn!.quantity = double.parse(value!);
                },
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 3) {
                    return "Please enter name";
                  }
                  //check if name is valid
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Phone Number",
                  hintText: "Phone Number",
                  //color

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                onSaved: (value) {
                  formReturn!.phone = value!;
                  // formReturn!.quantity = double.parse(value!);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a valid phone number";
                  }
                  // check if phone number is valid
                  if (value.length != 10) {
                    return "Please enter a valid phone number";
                  }
                  if (value[0] != '0') {
                    return "Please enter a valid phone number";
                  }
                  if (value[1] != '5' && value[1] != '6' && value[1] != '7') {
                    return "Please enter a valid phone number";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
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
              TextFormField(
                obscureText: is_visible,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Confirm Password",
                  hintText: "Confirm Password",
                  //color

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                onSaved: (value) {
                  // formReturn!.quantity = double.parse(value!);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a valid password";
                  }
                  // check if password is password
                  if (value != passwordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Address",
                  hintText: "Address",
                  //color

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                onSaved: (value) {
                  formReturn!.address = value!;
                  // formReturn!.quantity = double.parse(value!);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Address";
                  }

                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "City",
                  hintText: "City",
                  //color

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                onSaved: (value) {
                  formReturn!.city = value!;
                  // formReturn!.quantity = double.parse(value!);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter City";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "State",
                  hintText: "State",
                  //color

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                onSaved: (value) {
                  formReturn!.state = value!;
                  // formReturn!.quantity = double.parse(value!);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter State";
                  }

                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Zip",
                  hintText: "Zip",
                  //color

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                onSaved: (value) {
                  formReturn!.zip = value!;
                  // formReturn!.quantity = double.parse(value!);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Zip code";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
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
                          formKey.currentState!.save();
                          await formReturn!.saveToDb();

                          await printUsers();
                          //create user
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => const CreateAccount(),
                          //   ),
                          // );
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
                        "Confirm",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(Size(
                            MediaQuery.of(context).size.width * 0.3,
                            MediaQuery.of(context).size.height * 0.05)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red[400]!),
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
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

List<String> Qualites = [
  "Proprietaire",
  "Architect",
  "Notaire",
  "Topographe",
  "Adoul",
  "Autre"
];
List<String> JuriForme = ["SARL", "SA", "SNC"];
List<String> status = ["T", "R", "TNI"];
List<DropdownMenuItem<String>> DropDownsFactor(List<String> input) {
  List<DropdownMenuItem<String>> output = [];
  for (var item in input) {
    output.add(DropdownMenuItem<String>(
      child: Text(item),
      value: item,
    ));
  }
  return output;
}
