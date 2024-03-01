import 'package:adrash/screens/home_screen.dart';
import 'package:adrash/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login_register_app.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(const HomePage()),
  );
}
