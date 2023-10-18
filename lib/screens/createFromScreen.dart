import 'package:flutter/material.dart';
import 'package:form_app/models/CreateAccountForm.dart';
import 'package:form_app/screens/create_account_screen.dart';

import '../models/formModel.dart';
import '../services/storage_service.dart';

class CreateMoralForm extends StatefulWidget {
  const CreateMoralForm({super.key});

  @override
  State<CreateMoralForm> createState() => _CreateMoralFormState();
}

class _CreateMoralFormState extends State<CreateMoralForm> {
  final formKey = GlobalKey<FormState>();
  FormModel? formReturn;
  String Qualite = "";
  String FormJuri = "";
  String Status = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Morale Demand"),
      ),
      backgroundColor: Colors.grey[400],
      body: SingleChildScrollView(
          child: Column(
        children: [
          Center(
              child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Raison Social",
                          hintText: "Raison Social",
                          //color

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        onSaved: (value) {
                          formReturn!.Social_reason = value!;
                          //formReturn!.first_name = value!;
                          // formReturn!.quantity = double.parse(value!);
                        },
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 3) {
                            return "validate Raison Social";
                          }
                          //check if name is valid
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "RC",
                          hintText: "RC",
                          //color

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        onSaved: (value) {
                          formReturn!.Rc = value!;
                          //formReturn!.first_name = value!;
                          // formReturn!.quantity = double.parse(value!);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "validate rc";
                          }
                          //check if name is valid
                          return null;
                        },
                      ),

                      TextFormField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Patente",
                          hintText: "Patente",
                          //color

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        onSaved: (value) {
                          formReturn!.Patente = value!;
                          //formReturn!.first_name = value!;
                          // formReturn!.quantity = double.parse(value!);
                        },
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 3) {
                            return "validate patente";
                          }
                          //check if name is valid
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "IF",
                          hintText: "IF",
                          //color

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        onSaved: (value) {
                          formReturn!.If = value!;
                          //formReturn!.first_name = value!;
                          // formReturn!.quantity = double.parse(value!);
                        },
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 3) {
                            return "validate IF";
                          }
                          //check if name is valid
                          return null;
                        },
                      ),

                      DropdownButtonFormField<String>(
                        items: DropDownsFactor(JuriForme),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Forme Juridique",
                          hintText: "Forme Juridique",
                          //color

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "validate Forme Juridique";
                          }
                          if (!JuriForme.contains(value)) {
                            return "validate Forme Juridique";
                          }
                        },
                        onSaved: (ne) {
                          setState(() {
                            FormJuri = ne!;
                            formReturn!.Forme_juridique = ne!;
                          });
                        },
                        onChanged: (value) => setState(() {
                          FormJuri = value!;
                        }),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Adresse",
                          hintText: "Adresse",
                          //color

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        onSaved: (value) {
                          formReturn!.Address = value!;
                          //formReturn!.first_name = value!;
                          // formReturn!.quantity = double.parse(value!);
                        },
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 3) {
                            return "Validate Adresse";
                          }
                          //check if name is valid
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Ville",
                          hintText: "Ville",
                          //color

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        onSaved: (value) {
                          formReturn!.City = value!;
                          //formReturn!.first_name = value!;
                          // formReturn!.quantity = double.parse(value!);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Validate Ville";
                          }
                          //check if name is valid
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Telephone",
                          hintText: "Telephone",
                          //color

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        onSaved: (value) {
                          formReturn!.Phone = value!;
                          //formReturn!.first_name = value!;
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
                          if (value[1] != '5' &&
                              value[1] != '6' &&
                              value[1] != '7') {
                            return "Please enter a valid phone number";
                          }
                          return null;
                        },
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
                          formReturn!.Email = value!;
                          //formReturn!.first_name = value!;
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
                      //add a separator with a text
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 28,
                        child: const Center(
                          child: Text(
                            "INFORMATIONS TERRAIN",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      DropdownButtonFormField<String>(
                        items: DropDownsFactor(status),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Status",
                          hintText: "Status",
                          //color

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "validate Status";
                          }
                          if (!status.contains(value)) {
                            return "validate Status";
                          }
                        },
                        onSaved: (ne) {
                          setState(() {
                            Status = ne!;
                            formReturn!.Status = ne!;
                          });
                        },
                        onChanged: (value) => setState(() {
                          Status = value!;
                        }),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Némuro",
                          hintText: "Némuro",
                          //color

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        onSaved: (value) {
                          formReturn!.Nemuro = value!;
                          //formReturn!.first_name = value!;
                          // formReturn!.quantity = double.parse(value!);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "validate nemuro";
                          }
                          //check if name is valid
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Indice",
                          hintText: "Indice",
                          //color

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        onSaved: (value) {
                          formReturn!.Indice = value!;
                          //formReturn!.first_name = value!;
                          // formReturn!.quantity = double.parse(value!);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "validate Indice";
                          }
                          //check if name is valid
                          return null;
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Contenance Plan Cadastral (m²)",
                          hintText: "Contenance Plan Cadastral (m²)",
                          //color
                          //set keyboard type to number

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        validator: (value) {
                          try {
                            double.parse(value!);
                          } catch (e) {
                            return "Please enter a valid value";
                          }
                        },
                        onSaved: (value) {
                          formReturn!.Cadastrale = double.parse(value!);
                          //formReturn!.first_name = value!;
                          // formReturn!.quantity = double.parse(value!);
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Surface de la liste de contenance (m²)",
                          hintText: "Surface de la liste de contenance (m²)",
                          //color
                          //set keyboard type to number

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        onSaved: (value) {
                          formReturn!.CertPropriet = double.parse(value!);
                          //formReturn!.first_name = value!;
                          // formReturn!.quantity = double.parse(value!);
                        },
                        validator: (value) {
                          try {
                            double.parse(value!);
                          } catch (e) {
                            return "Please enter a valid value";
                          }
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Surface Certificat propriété (m²)",
                          hintText: "Surface Certificat propriété (m²)",
                          //color
                          //set keyboard type to number

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        onSaved: (value) {
                          formReturn!.Contonance = double.parse(value!);
                          //formReturn!.first_name = value!;
                          // formReturn!.quantity = double.parse(value!);
                        },
                        validator: (value) {
                          try {
                            double.parse(value!);
                          } catch (e) {
                            return "Please enter a valid value";
                          }
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Surface calculée (m²)",
                          hintText: "Surface calculée (m²)",
                          //color
                          //set keyboard type to number

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        onSaved: (value) {
                          formReturn!.Surface = double.parse(value!);
                          //formReturn!.first_name = value!;
                          // formReturn!.quantity = double.parse(value!);
                        },
                        validator: (value) {
                          try {
                            double.parse(value!);
                          } catch (e) {
                            return "Please enter a valid value";
                          }
                        },
                      ),
                    ]),
                  ))),
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
                      if (formKey.currentState!.validate()) {
                        formReturn = FormModel(
                            Social_reason: "",
                            Rc: "",
                            Quality: "",
                            Patente: "",
                            If: "",
                            Forme_juridique: "",
                            Address: "",
                            City: "",
                            Phone: "",
                            Email: "",
                            Status: "",
                            Nemuro: "",
                            Indice: "",
                            current_user_email: "",
                            Cadastrale: 0,
                            CertPropriet: 0,
                            Contonance: 0,
                            Surface: 0);

                        formKey.currentState!.save();
                        CreateAccountForm current = await getCurrentUser();
                        formReturn!.current_user_email = current.email!;
                        print("hplaaaaaaa");
                        print(formReturn!.toJson());
                        print("hplaaaaaaa");
                        formReturn!.saveToDb();
                        await printForms();
                        //close the screen
                        Navigator.pop(context);
                        //await formReturn!.saveToDb();
                      }
                    }
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(Size(
                        MediaQuery.of(context).size.width * 0.3,
                        MediaQuery.of(context).size.height * 0.05)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green[200]!),
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
      )),
    );
  }
}
