// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/widgets.dart';
import 'package:pdf/widgets.dart';

import 'package:firebase_storage/firebase_storage.dart';

import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<String> generatePdf(String name, String? age, String city, String gender,
    String wight, String height, String desc, String cin, String imgUrl) async {
  final pdf = pw.Document();
  final netImage = await networkImage(imgUrl);

  pdf.addPage(
    pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(children: [
            pw.Text('Personal Information'),
            pw.SizedBox(height: 10),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('Name: $name'),
                pw.Text('Age: $age'),
              ],
            ),
            pw.SizedBox(height: 10),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('City: $city'),
                pw.Text('Gender: $gender'),
              ],
            ),
            pw.SizedBox(height: 10),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('Weight: $wight'),
                pw.Text('Height: $height'),
              ],
            ),
            pw.SizedBox(height: 20),
            pw.Text('Description'),
            pw.SizedBox(height: 10),
            pw.Text(desc),
            pw.SizedBox(height: 20),
            pw.Text('Identification'),
            pw.SizedBox(height: 10),
            pw.Text('CIN: $cin'),
            pw.SizedBox(height: 20),
            pw.Text('Signature'),
            pw.SizedBox(height: 10),
            pw.Image(netImage),
          ]);
        }),
  );

  // Return the file path

  final pdfData = await pdf.save();

  final storageRef = FirebaseStorage.instance.ref().child('pdfs/$name.pdf');

  final uploadTask = storageRef.putData(
      pdfData, SettableMetadata(contentType: 'application/pdf'));

  final snapshot = await uploadTask.whenComplete(() {});

  final downloadUrl = await snapshot.ref.getDownloadURL();

  return downloadUrl;
}
