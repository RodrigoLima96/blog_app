import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'app_module.dart';
import 'app_widget.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await _setupHiveDirectory();

  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

Future<void> _setupHiveDirectory() async {
  final dir = await getApplicationDocumentsDirectory();
  Hive.defaultDirectory = dir.path;
}