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

import 'package:http/http.dart' as http;

Future downLoadPdf(String imgUrl) async {
  try {
    // Make a GET request to the PDF URL
    var response = await http.get(Uri.parse(imgUrl));

    // Check if the request was successful (status code 200)
    if (response.statusCode == 200) {
      // Get the app's documents directory
      final Directory appDocDir = await getApplicationDocumentsDirectory();
      final String appDocPath = appDocDir.path;

      // Save the PDF to local storage
      final File localFile = File('$appDocPath/downloaded_pdf.pdf');

      // Write the bytes to the local file
      await localFile.writeAsBytes(response.bodyBytes);

      print('PDF downloaded to: ${localFile.path}');

      // Return true to indicate successful download
      return true;
    } else {
      print('Failed to download PDF. Status code: ${response.statusCode}');
      return false;
    }
  } catch (error) {
    print('Error downloading PDF: $error');
    return false;
  }
}
