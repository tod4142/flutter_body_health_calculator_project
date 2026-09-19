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
                    fontSize: MediaQuery.of(context).size.height*0.025,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  'assets/images/calculate.png',
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
                    fontSize: MediaQuery.of(context).size.height*0.025,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'คำนวณหาแคลลอรี่ที่ร่างกายต้องการ (ฺBMR)',
                  style: TextStyle(
                    color:Colors.deepOrange,
                    fontSize: MediaQuery.of(context).size.height*0.025,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
              ],
            ),

          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                'assets/images/saulogo.png',
                width: MediaQuery.of(context).size.height*0.2,
                height: MediaQuery.of(context).size.height*0.2,
                fit: BoxFit.cover
                ),
                Text(
                  '© 2026 SAU. All right reserved.😀✌✌✌'
                ),
                Text(
                  'Created by Software Devleopment Team'
                ),
                SizedBox(height: 30,),
              ],
            ),
          )
        ],
      ),
    );
  }
}