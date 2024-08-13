import 'package:flutter/material.dart';
import 'package:herd_service/models/homemodel.dart';
import 'package:herd_service/models/loginmodels.dart';

import 'package:herd_service/pages/Loginpage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Login_email(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (create) => userprofiledetails()),
        ChangeNotifierProvider(create: (create) => Login_email()),
        ChangeNotifierProvider(create: (create) => Login_id()),
        ChangeNotifierProvider(create: (create) => Login_phone()),
      ],
      child: MaterialApp(
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.1)),
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        home: const Loginpage(),
      ),
    );
  }
}
