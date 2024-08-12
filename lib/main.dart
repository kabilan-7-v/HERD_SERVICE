import 'package:flutter/material.dart';
import 'package:herd_service/models/customercard.dart';

import 'package:herd_service/pages/Loginpage.dart';
import 'package:provider/provider.dart';

import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (create) => userprofiledetails()),
        ChangeNotifierProvider(create: (create) => Login_email())
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
