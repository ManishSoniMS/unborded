import 'package:flutter/material.dart';

import 'src/app/app.dart';
import 'src/app/injection/injection.dart';

void main() {
  configureDependencies();
  runApp(const App());
}
