import 'package:flutter/material.dart';

class AboutUi extends StatelessWidget {
  const AboutUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Body Health Calculator',
                  style: TextStyle(
                    color:Colors.deepOrange,
                    fontSize: MediaQuery.of(context).size.height*0.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  'assets/image/calculate.png',
                width: MediaQuery.of(context).size.height*0.2,
                height: MediaQuery.of(context).size.height*0.2,
                fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'คำนวณหาค่าดัชนีมวลกาย (BMI)',
                  style: TextStyle(
                    color:Colors.deepOrange,
                    fontSize: MediaQuery.of(context).size.height*0.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'คำนวณหาแคลลอรี่ที่ร่างกายต้องการ (ฺBMR)',
                  style: TextStyle(
                    color:Colors.deepOrange,
                    fontSize: MediaQuery.of(context).size.height*0.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
              ],
            ),

          ),
        ],
      ),
    );
  }
}