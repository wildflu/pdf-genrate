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
  try {
    // Extract the path from the full PDF URL
    Uri uri = Uri.parse(imgUrl);
    String storagePath = uri.path;

    // Get the app's documents directory
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;

    // Save the PDF to local storage
    final File localFile = File('$appDocPath/downloaded_pdf.pdf');

    // Use storage path as reference
    final Reference ref = FirebaseStorage.instance.ref().child(storagePath);

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
