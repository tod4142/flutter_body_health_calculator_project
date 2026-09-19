import 'package:flutter/material.dart';
import 'package:flutter_body_health_calculator_project/views/about_ui.dart';
import 'package:flutter_body_health_calculator_project/views/bmi_ui.dart';
import 'package:flutter_body_health_calculator_project/views/bmr_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
 
class HomeUI extends StatefulWidget {
  const HomeUI({super.key});
 
  @override
  State<HomeUI> createState() => _HomeUIState();
}
 
class _HomeUIState extends State<HomeUI> {
  // สร้างตัวแปรเก็บหมายเลข index ของ BarItem ที่เลือก
  int selectedIndex = 1;
 
  // สร้างตัวแปรประเภท List เก็บหน้าจอ BmiUI, AboutUI, BmrUI
  // List เหมือนกับ Array
  List subViewShow = [
    BmiUi(),
    AboutUi(),
    BmrUi(),
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ส่วนของ AppBar-------------------------------
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[800],
        title: Text(
          'Body Health Calculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      // ส่วนของ BottomNavigationBar------------------
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          //***** โค้ดใดที่มีผลต่อการแสดงผลเขียนอยู่ใต้คำสั่ง setState( )
          setState(() {
            selectedIndex = value;
          });
        },
        currentIndex: selectedIndex,
        selectedItemColor: Colors.deepOrange[800],
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'BMI',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.heartCircleCheck,
            ),
            label: 'BMR',
          ),
        ],
      ),
      // ส่วนของ body---------------------------------
      body: subViewShow[selectedIndex],
    );
  }
}