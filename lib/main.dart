import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:happy_hour_app/application.dart';
import 'package:happy_hour_app/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setup();
  runApp(const Application());
}
