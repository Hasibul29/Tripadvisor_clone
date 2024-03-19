import 'package:flutter/material.dart';
import 'package:tripadvisor/screens/AITrips/ai_trip.dart';
import 'package:tripadvisor/screens/signin_signup.dart';
import 'package:provider/provider.dart';

import 'controller/signin_controller.dart';
import 'theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignInController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tripadvisor',
      theme: lightThemeData(context),
      debugShowCheckedModeBanner: false,
      home: const AiTrip(),
    );
  }
}
