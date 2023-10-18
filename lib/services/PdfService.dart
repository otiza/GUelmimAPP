import 'package:flutter/material.dart';
import 'package:form_app/models/formModel.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

formToPdf(FormModel form, BuildContext context) async {
  print("ytttt");
  try {
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(children: [
            pw.Center(
                child: pw.Text("Demande Urbaine",
                    style: pw.TextStyle(
                        fontSize: 30, fontWeight: pw.FontWeight.bold))),
            pw.SizedBox(height: 30),
            pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Column(children: [
                  pw.Text("Social Reason: ${form.Social_reason}"),
                  pw.SizedBox(height: 10),
                  pw.Text("Forme Juridique: ${form.Forme_juridique}"),
                  pw.SizedBox(height: 10),
                  pw.Text("Quality: ${form.Quality}"),
                  pw.SizedBox(height: 10),
                  pw.Text("Patente: ${form.Patente}"),
                  pw.SizedBox(height: 10),
                  pw.Text("IF: ${form.If}"),
                  pw.SizedBox(height: 10),
                  pw.Text("Address: ${form.Address}"),
                  pw.SizedBox(height: 10),
                  pw.Text("Ville: ${form.City}"),
                  pw.SizedBox(height: 10),
                  pw.Text("Phone: ${form.Phone}"),
                  pw.SizedBox(height: 10),
                  pw.Text("Email: ${form.Email}"),
                  pw.SizedBox(height: 10),
                  pw.Container(
                    width: double.infinity,
                    height: 30,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black),
                      //make it take al the page horizontally

                      borderRadius: pw.BorderRadius.circular(10.0),
                      color: PdfColors.grey,
                    ),
                    child: pw.Center(child: pw.Text("INFORMATION DE TERRAIN")),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Text("Status: ${form.Status}"),
                  pw.SizedBox(height: 10),
                  pw.Text("Indice: ${form.Indice}"),
                  pw.SizedBox(height: 10),
                  pw.Text("Nemuro: ${form.Nemuro}"),
                  pw.SizedBox(height: 30),
                  pw.Container(
                    width: double.infinity,
                    height: 30,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black),
                      //make it take al the page horizontally

                      borderRadius: pw.BorderRadius.circular(10.0),
                      color: PdfColors.grey,
                    ),
                    child: pw.Center(child: pw.Text("Geomethrie de project")),
                  ),
                  pw.SizedBox(height: 30),
                  pw.Text("Contenance Plan Cadastral (m²): ${form.Cadastrale}"),
                  pw.SizedBox(height: 10),
                  pw.Text(
                      "Surface de la liste de contenance (m²): ${form.Contonance}"),
                  pw.SizedBox(height: 10),
                  pw.Text(
                      "Surface Certificat propriété (m²): ${form.CertPropriet}"),
                  pw.SizedBox(height: 10),
                  pw.Text("Surface (m²): ${form.Surface}"),
                ])),
          ]);
        }));
    //display the pdf
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PdfPreview(
              build: (format) => pdf.save(),
            )));
  } catch (e) {
    print(e);
  }
}
