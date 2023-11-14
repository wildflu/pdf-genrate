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
  final tempDi = await getTemporaryDirectory();

  final path = '${tempDi.path}/contract.pdf';
  await Dio().download(imgUrl, path);
}
