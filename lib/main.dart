import 'package:evote_web/app.dart';
import 'package:evote_web/app/core/app_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async{
  // Bloc Observer
  Bloc.observer = AppBlocObserver();

  // LOAD DOT ENV 
  await dotenv.load(fileName: ".env");

  runApp(const Evote());
}
