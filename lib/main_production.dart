import 'package:flutter/material.dart';
import 'package:to_do/app/app.dart';
import 'package:to_do/app/core/config.dart';

void main() {
  Config.appFlavor = Flavor.production;

  runApp(
    MyApp(),
  );
}
