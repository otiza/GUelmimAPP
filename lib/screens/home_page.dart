import 'package:flutter/material.dart';
import 'package:form_app/screens/FormsList.dart';
import 'package:form_app/services/storage_service.dart';

import 'createFromScreen.dart';

class Home_PAge extends StatefulWidget {
  const Home_PAge({super.key});

  @override
  State<Home_PAge> createState() => _Home_PAgeState();
}

class _Home_PAgeState extends State<Home_PAge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        backgroundColor: Colors.grey[400],
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              FutureBuilder(
                  future: getCurrentUser(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                          "Welcome ${snapshot.data!.first_name} ${snapshot.data!.last_name}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold));
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueGrey[400]!),
                  ),
                  child: const Text(
                    "Creer une demande physique",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CreateMoralForm(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueGrey[400]!),
                  ),
                  child: const Text(
                    "Creer une demande Morale",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const FormList(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueGrey[400]!),
                  ),
                  child: const Text(
                    "historique des damandes",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          )),
        ));
  }
}
