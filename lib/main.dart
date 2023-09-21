import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gdgica/utils/dependency_injection.dart';
import 'package:gdgica/utils/devfest.dart';
import 'package:gdgica/utils/simple_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/config_page.dart';

Future<void> main() async {

WidgetsFlutterBinding.ensureInitialized();

  
  SystemChrome.setSystemUIOverlayStyle(
    //add const
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // * Get Shared Preference Instance for whole app
  Devfest.prefs = await SharedPreferences.getInstance();

  Devfest.checkDebug();

  Bloc.observer = SimpleBlocDelegate();

  Injector.configure(Flavor.mock, DataMode.json);

  runApp(ConfigPage());
}