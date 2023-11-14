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
      // Get the external storage directory
      final Directory extDir = await getExternalStorageDirectory();
      final String extDirPath = extDir.path;

      // Save the PDF to external storage
      final File localFile = File('$extDirPath/downloaded_pdf.pdf');

      // Print debug information
      print('File object created: $localFile');

      // Write the bytes to the local file
      await localFile.writeAsBytes(response.bodyBytes);

      print('PDF downloaded to: ${localFile.path}');

      // Return true to indicate successful download
      return true;
    } else {
      print('Failed to download PDF. Status code: ${response.statusCode}');
      return false;
    }
  } catch (error, stackTrace) {
    print('Error downloading PDF: $error');
    print('Stack trace: $stackTrace');
    return false;
  }
}
