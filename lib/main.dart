import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/home/bloc/home_bloc.dart';
import 'screens/home/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel',
      theme: ThemeData.dark(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => HomeBloc(),
          ),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}

