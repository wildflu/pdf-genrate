// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'package:syncfusion_flutter_pdf/pdf.dart';

Future<String> modifyPDF() async {
  final PdfDocument document =
      PdfDocument(inputBytes: File('adil_Grola.pdf').readAsBytesSync());
//Get the existing PDF page.
  final PdfPage page = document.pages[0];
  //Draw text in the PDF page.
  page.graphics.drawString(
      'Hello World!', PdfStandardFont(PdfFontFamily.helvetica, 12),
      brush: PdfSolidBrush(PdfColor(0, 0, 0)),
      bounds: const Rect.fromLTWH(0, 0, 150, 20));

  final pdfData = await document.save();

  final bytes = Uint8List.fromList(pdfData);

  return "None";
}
