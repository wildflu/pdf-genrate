// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

import 'package:dio/dio.dart';

Future downLoadPdf(String imgUrl) async {
  // Add your function code here!
  try {
    final Reference ref = FirebaseStorage.instance.ref(imgUrl);

    // Get the app's documents directory
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;

    // Save the PDF to local storage
    final File localFile = File('$appDocPath/downloaded_pdf.pdf');

    await ref.writeToFile(localFile);

    print('PDF downloaded to: ${localFile.path}');

    // Return true to indicate successful download
    return true;
  } catch (error) {
    print('Error downloading PDF: $error');

    // Return false to indicate failure
    return false;
  }
}
