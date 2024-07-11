import 'package:flutter/material.dart';

import 'package:herd_service/pages/Loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.1)),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      home: const Loginpage(),
    );
  }
}
