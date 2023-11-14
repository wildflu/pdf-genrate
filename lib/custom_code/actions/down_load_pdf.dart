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
  const theurl =
      "https://storage.googleapis.com/gestion-locative-privee.appspot.com/files/contracts/Karl0724.pdf?GoogleAccessId=gestion-locative-privee%40appspot.gserviceaccount.com&Expires=16447017600&Signature=CDuidIqSsSIfDHWI2M8BtT40KHMsvOLzZQ5n1288IuNnmtth3ve%2FslfdcdTRJDMr3jzKZ%2Bg%2Fkf7X7lK%2FeZJpbXN98PIFc3o0nlLxJks62MJd34mDs96AQ4bIGnl9aerZuNUM6DYSpT6Si15BNMUSbgLGIQgyuNzV4lJhjKQBAmMYUA4Ds5dAchqsvoNlEzW8DWVGdk09uWai02d5uaAVx%2BFtYMXwsaMRjJNAkM30LO3sMUvfIKV8mrSv6TS%2FVBjOuIvHeWfP6KVdiFST63WMv3p6F9A8zeuwnez4zINZL9j0JcSQEr4PAhv6REH%2FarNQUad9Rd9R6%2BaS5tC6SyxreQ%3D%3D";
  try {
    // Make a GET request to the PDF URL
    var response = await http.get(Uri.parse(theurl));

    // Check if the request was successful (status code 200)
    if (response.statusCode == 200) {
      // Get the external storage directory
      final Directory? extDir = await getExternalStorageDirectory();
      final String extDirPath = extDir!.path;

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
