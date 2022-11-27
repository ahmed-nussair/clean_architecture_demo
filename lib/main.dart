import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'injector.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initInjection();
  runApp(const MyApp());
}
