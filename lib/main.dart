import 'package:flutter/material.dart';
import 'package:flutter_body_health_calculator_project/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';
 
//-----------------------------------------------
 
void main() {
  runApp(
    //เรียกใช้งาน Class ที่เรียกใช้ Widget หลักของ App
    FlutterBodyHealthCalculatorProject(),
  );
}
 
//------------------------------------------------
//แนะนำเป็น Class แบบ StatefulWidget โดยตั้งชื่อล้อกับชื่อโปรเจ็กต์
//Class นี้จะเรียกใช้ Widget หลักของ App โดย Widget หลักของแอปแนะนำ MaterialApp
class FlutterBodyHealthCalculatorProject extends StatefulWidget {
  const FlutterBodyHealthCalculatorProject({super.key});
 
  @override
  State<FlutterBodyHealthCalculatorProject> createState() =>
      _FlutterBodyHealthCalculatorProjectState();
}
 
class _FlutterBodyHealthCalculatorProjectState
    extends State<FlutterBodyHealthCalculatorProject> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
 