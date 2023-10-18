import 'package:flutter/material.dart';
import 'package:form_app/services/PdfService.dart';
import 'package:form_app/services/storage_service.dart';

class FormList extends StatefulWidget {
  const FormList({super.key});

  @override
  State<FormList> createState() => _FormListState();
}

class _FormListState extends State<FormList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        backgroundColor: Colors.grey[400],
        body: FutureBuilder(
            future: getCurrentUserForms(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: GestureDetector(
                          onTap: () async {
                            print("tapped");
                            await formToPdf(snapshot.data![index], context);
                          },
                          child: ListTile(
                            title: Text(snapshot.data![index].Social_reason),
                            subtitle:
                                Text(snapshot.data![index].Forme_juridique),
                            trailing: Text(snapshot.data![index].Quality),
                          ),
                        ),
                      );
                    });
              } else {
                return CircularProgressIndicator();
              }
            }));
  }
}
