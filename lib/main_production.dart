import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do/app/app.dart';
import 'package:to_do/app/core/config.dart';
import 'package:to_do/app/injection_container.dart';
import 'package:to_do/app/notifications/firebase_api.dart';
import 'package:to_do/firebase_options.dart';

void main() async {
  Config.appFlavor = Flavor.production;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();

  configureDependencies();
  runApp(
    const MyApp(),
  );
}
