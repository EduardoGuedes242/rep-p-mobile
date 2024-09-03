import 'package:flutter/material.dart';
import 'package:rep_p_mobile/src/pages/login_page.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting('pt_BR', null).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
