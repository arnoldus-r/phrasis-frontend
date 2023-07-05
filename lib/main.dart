import 'package:flutter/material.dart';
import 'package:phrasis_frontend/widget/password_field.dart';
import 'package:phrasis_frontend/widget/email_field.dart';
import 'package:phrasis_frontend/login_view.dart';

const phPrimary = Color(0xFF604777);
const phSecondary = Color(0xFFEBE8EE);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pharasis',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: phPrimary,
          brightness: Brightness.light,
        ),
      ),
      home: Login(),
    );
  }
}
