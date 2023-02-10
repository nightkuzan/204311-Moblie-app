import 'package:flutter/material.dart'; //เพื่อใช้ MaterialApp, Scaffold, AppBar, Text, Column, TextFormField, ElevatedButton, Form, GlobalKey, TextEditingController, TextEditingValue, Iterable, Autocomplete
import 'package:flutter/services.dart'; //เพื่อใช้ rootBundle.loadString
import 'dart:core'; //เพื่อใช้ RegExp
import 'package:csv/csv.dart'; //เพื่อใช้ CsvToListConverter
import 'package:email_validator/email_validator.dart';

void main() {
  runApp(const MyWidget()); //เรียกใช้ MyWidget
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key}); //สร้าง MyWidget

  @override //เรียกใช้ _MyWidgetState
  State<MyWidget> createState() => _MyWidgetState(); //สร้าง _MyWidgetState
}

class _MyWidgetState extends State<MyWidget> {
  List<List<dynamic>> data = []; //สร้าง List ชื่อ data ของ List ของ dynamic

  @override //เรียกใช้ initState
  void initState() {
    super.initState(); //เรียกใช้ initState ของ State
    loadCSV(); //เรียกใช้ loadCSV
  }

  void loadCSV() async {
    //สร้าง loadCSV
    final rawData = await rootBundle.loadString("assets/tambon_chiangmai.csv");
    //สร้าง rawData และเก็บค่าจาก rootBundle.loadString ที่อยู่ใน assets/tambon_chiangmai.csv
    // rootBundle.loadString จะใช้เพื่ออ่านไฟล์ csv ที่อยู่ใน assets ของโปรเจค
    List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);
    //สร้าง listData และเก็บค่าจาก CsvToListConverter ที่แปลง rawData ให้เป็น List ของ List ของ dynamic
    setState(() {
      data = listData; //เก็บค่า listData ใน data
    });
    data.removeAt(0); //ลบข้อมูลใน data ที่อยู่ใน index ที่ 0
  }

  final formkey = GlobalKey<FormState>();
  //สร้าง formkey และเก็บค่า GlobalKey<FormState>
  // GlobalKey จะใช้เพื่อเก็บค่าของ Widget ที่เราสร้างขึ้นมาเอง
  final emailController = TextEditingController();
  //สร้าง emailController และเก็บค่า TextEditingController
  // TextEditingController จะใช้เพื่อเก็บค่าของ TextField ที่เราสร้างขึ้นมาเอง
  final zipCodeController = TextEditingController();
  final districtController = TextEditingController();
  final tambonController = TextEditingController();
  final _emailRegExp = RegExp(r".+@globex\.com");
  //สร้าง _emailRegExp และเก็บค่า RegExp

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //สร้าง MaterialApp
      home: Scaffold(
        //สร้าง Scaffold
        appBar: AppBar(
          //สร้าง AppBar
          title: const Text('Address Form'), //สร้าง Text แสดงชื่อ Address Form
        ),
        body: Form(
          //สร้าง Form
          key: formkey, //เก็บค่า formkey ใน key
          child: Column(
            //สร้าง Column
            children: [
              //สร้าง children
              TextFormField(
                //สร้าง TextFormField
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Enter Email Address',
                  //สร้าง Text แสดงชื่อ Enter Email Address
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    //เช็คว่า value เป็น null หรือไม่
                    return 'Please write your Email.';
                  } else if (EmailValidator.validate(value) == false) {
                    //เช็คว่า value ตรงกับ _emailRegExp หรือไม่
                    return 'Invalid Email Format.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: zipCodeController,
                decoration: const InputDecoration(
                  labelText: 'Enter Zip Code',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please write your Zip Code.';
                  } else if (value.length != 5 ||
                      !RegExp(r'^[0-9]+$').hasMatch(value) ||
                      value.startsWith('0')) {
                    //เช็คว่า value มีความยาวเท่ากับ 5 หรือไม่ และเป็นตัวเลขทั้งหมดหรือไม่ และ value ไม่เริ่มต้นด้วย 0 หรือไม่
                    return 'Invalid Zip Code Format.';
                  }
                  return null;
                },
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: const Text("Province: Chiang Mai",
                      style: TextStyle(
                        fontSize: 25,
                      ))),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text("District",
                    style: TextStyle(
                      fontSize: 25,
                    )),
              ),
              Autocomplete<String>(
                //สร้าง Autocomplete
                optionsBuilder: (TextEditingValue textEditingValue) {
                  //สร้าง optionsBuilder
                  if (textEditingValue.text == '') {
                    //เช็คว่า textEditingValue เป็นค่าว่างหรือไม่
                    return const Iterable<
                        String>.empty(); //ถ้าเป็นค่าว่างให้ return ค่าว่าง
                  }
                  final List<String> options =
                      <String>[]; //สร้าง List ชื่อ options
                  for (var i = 0; i < data.length; i++) {
                    //วนลูป data
                    if (!options.contains(data[i][1])) {
                      //เช็คว่า options มี data[i][1] หรือไม่
                      options.add(data[i]
                          [1]); //ถ้าไม่มีให้เพิ่ม data[i][1] ลงใน options
                    }
                  }
                  return options.where((String option) {
                    //เช็คว่า option มีค่าเท่ากับ textEditingValue หรือไม่
                    return option
                        //เช็คว่า option มีค่าเท่ากับ textEditingValue หรือไม่
                        .toLowerCase() //เปลี่ยน option ให้เป็นตัวเล็กทั้งหมด
                        .contains(textEditingValue.text
                            .toLowerCase()); //เช็คว่า option มีค่าเท่ากับ textEditingValue หรือไม่
                  });
                },
                onSelected: (String selection) {
                  //เมื่อเลือก option
                  districtController.text =
                      selection; //ให้ districtController.text เท่ากับ selection
                },
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Tambon",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  )),
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }
                  final List<String> options = <String>[]; //
                  for (var i = 0; i < data.length; i++) {
                    if (data[i][1] == districtController.text) {
                      //เช็คว่า data[i][1] มีค่าเท่ากับ districtController.text หรือไม่
                      options.add(data[i][0]);
                    }
                  }
                  return options.where((String option) {
                    //เช็คว่า option มีค่าเท่ากับ textEditingValue หรือไม่
                    return option.toLowerCase().contains(textEditingValue.text
                        .toLowerCase()); //เช็คว่า option มีค่าเท่ากับ textEditingValue หรือไม่
                  });
                },
                onSelected: (String selection) {
                  tambonController.text = selection;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  //เมื่อกดปุ่ม
                  if (formkey.currentState!.validate()) {
                    //เช็คว่า formKey.currentState มีค่าเท่ากับ null หรือไม่
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Processing Data'),
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
