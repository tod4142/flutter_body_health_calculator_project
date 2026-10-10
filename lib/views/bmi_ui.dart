import 'package:flutter/material.dart';

class BmiUi extends StatefulWidget {
  const BmiUi({super.key});

  @override
  State<BmiUi> createState() => BmiUiState();
}

class BmiUiState extends State<BmiUi> {
   //ตัวควบคุม textfield  TextEditingController weightController = TextEditingController();
  TextEditingController heightctrl = TextEditingController();
  TextEditingController weightctrl = TextEditingController();
 
  //สร้างตัวแปรเพื่อเก็บค่าที่คำนวณได้
  String bmivalue = '0.00';
  String bmiresult = 'การแปรผล';
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 250),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 45.0,
              right: 45.0,
              top: 50.0,
              bottom: 50.0,
            ),
            child: Column(
              children: [
                Text(
                  'คำนวนหาค่าดัชนีมวลกาย (BMI)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Image.asset(
                  'assets/images/bmi.png',
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.3,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "น้ำหนัก (kg.)",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w100,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextField(
                  controller: weightctrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                        width: 2.0,
                      ),
                    ),
                    hintText: 'กรอกน้ำหนักของคุณ',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 253, 253, 253),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "ส่วนสูง (cm.)",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w100,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextField(
                  controller: heightctrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                        width: 2.0,
                      ),
                    ),
                    hintText: 'กรอกส่วนสูงของคุณ',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 253, 253, 253),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                ElevatedButton(
                  onPressed: () {
                    //validate input ว่าผู้ใช้กรอกข้อมูลครบหรือไม่
                    if (weightctrl.text.isEmpty || heightctrl.text.isEmpty) {
                      //ถ้าไม่ครบให้แสดงข้อความว่ากรอกข้อมูลไม่ครบ
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('กรุณากรอกข้อมูลให้ครบถ้วน'),
                          backgroundColor: Color.fromARGB(255, 255, 65, 0),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return; //หยุดการทำงานของฟังก์ชัน
                    }
                    //ถ้าครบให้คำนวณ BMI และแสดงผลลัพธ์
                    //แปลงค่าที่กรอกเป็น ตัวเลข double
                    double weight = double.parse(weightctrl.text);
                    double height = double.parse(heightctrl.text) / 100;
                    //คำนวณค่า BMI = น้ำหนัก (kg) / ส่วนสูง (m)²
                    double bmi = weight / (height * height);
                    //แสดงผลค่า bmi พร้อมกับการแปรผล
                    setState(() {
                      //code ใดที่มีผลการแสดงผล เขียนอยู่ใต้ setState
                      bmivalue = bmi.toStringAsFixed(2);
                      if (bmi < 18.5) {
                        bmiresult = 'น้ำหนักต่ำกว่าเกณฑ์';
                      } else if (bmi <= 22.9) {
                        bmiresult = 'น้ำหนักปกติ / สมส่วน';
                      } else if (bmi <= 24.9) {
                        bmiresult = 'น้ำหนักเกิน / โรคอ้วนระดับ 1';
                      } else if (bmi <= 29.9) {
                        bmiresult = 'โรคอ้วนระดับ 1';
                      } else {
                        bmiresult = 'โรคอ้วนระดับ 2';
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      55,
                    ),
                    backgroundColor: Color.fromARGB(255, 255, 65, 0),
                  ),
                  child: Text('คำนวณ BMI',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.white)),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                ElevatedButton(
                  onPressed: () {
                    //ล้างข้อมูลใน textfield ทั้งหมด เหมือนเปิดเข้ามาใหม่ ๆ
                    setState(() {
                      weightctrl.text = '';
                      heightctrl.text = '';
                      bmivalue = '0.00';
                      bmiresult = 'การแปรผล';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      55,
                    ),
                    backgroundColor: Colors.grey,
                  ),
                  child: Text('ล้างข้อมูล',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.white)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 200, 230, 200),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.035,
                      ),
                      Text('BMI',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(bmivalue,
                          style: TextStyle(
                              fontSize: 32,
                              color: Color.fromARGB(255, 255, 65, 0))),
                      Text(bmiresult,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.035,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}