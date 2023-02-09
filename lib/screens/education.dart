import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'global_page.dart';

class education extends StatefulWidget {
  const education({Key? key}) : super(key: key);

  @override
  State<education> createState() => _educationState();
}

class _educationState extends State<education> {
  final GlobalKey<FormState> education_key = GlobalKey<FormState>();

  late TextEditingController course_controller = TextEditingController();
  late TextEditingController college_name_controller = TextEditingController();
  late TextEditingController clg_CGPA_controller = TextEditingController();
  late TextEditingController passing_year_controller = TextEditingController();

  int savebtn = 0;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;




    return Scaffold(
        appBar: AppBar(
        leading: InkWell(
        onTap: () {
          setState(() {
            Navigator.pushNamedAndRemoveUntil(
                context, 'education', (route) => false);
          });

    },
    child: const Icon(Icons.arrow_back_ios),
    ),
    //backgroundColor: appColor.appCLR,
    title: const Text(
    "Education",
    style: TextStyle(
    fontSize: 22,
    color: Colors.white,
    ),
    ),
    centerTitle: true,
    elevation: 0,
    ),
    body: Column(
    children: [
    Expanded(
    flex: 1,
    child: Container(
    //color: appColor.appCLR,
    alignment: const Alignment(0, 0.5),
    child: Text(
    "About Education",
    style: TextStyle(
      fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black
    ),
    ),
    ),
    ),
    Expanded(
    flex: 9,
    child: Container(
    padding: const EdgeInsets.all(25),
    alignment: Alignment.topCenter,
    child: SingleChildScrollView(
    child: Column(
    children: [
    Form(
    key: education_key,
    child: Container(
    width: _width,
    height: _height * 0.63,
    //color: appColor.fromCLR,
    padding: const EdgeInsets.all(25),
    child: SingleChildScrollView(
    child: Column(
    children: [
    EducationField(
    title: "Course/Degree",
    hint: "B.C.A",
    error: "Enter Your Course Name",
    controller: course_controller,
    ),
    EducationField(
    title: "School/College/Institute",
    hint: "VNSGU",
    error: "Enter Your College Name",
    controller: college_name_controller,
    ),
    EducationField(
    title: "School/College/Institute",
    hint: "60% ",
    error: "Enter Your last CGPA",
    controller: clg_CGPA_controller,
    ),
    EducationField(
    title: "Year Of Pass",
    hint: "2020",
    error: "Enter Year Of Passing",
    controller: passing_year_controller,
    ),
    ],
    ),
    ),
    ),
    ),
    const SizedBox(height: 20),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    Container(
    width: _width * 0.3,
    height: _height * 0.06,
    child: ElevatedButton(
    onPressed: () {
    if (education_key.currentState!.validate()) {
    education_key.currentState!.save();
    Global.education = Global.edu.toString();
    savebtn++;
    if (savebtn > 0) {
    Global.edu.toString();
    }
    }
    print(Global.education);
    },
    style: ElevatedButton.styleFrom(
    //primary: appColor.appCLR,
    ),
    child: const Text(
    'Save',
    style: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    ),
    ),
    ),
    ),
    Container(
    width: _width * 0.3,
    height: _height * 0.06,
    child: OutlinedButton(
    onPressed: () {
    education_key.currentState!.reset();

    course_controller.clear();
    college_name_controller.clear();
    clg_CGPA_controller.clear();
    passing_year_controller.clear();

    setState(() {
    Global.education.toString();
    });
    },
    style: OutlinedButton.styleFrom(
    //primary: appColor.appCLR,
    ),
    child: const Text(
    'Clear',
    style: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    ),
    ),
    ),
    ),
    ],
    ),
    ],
    ),
    ),
    ),
    ),
    ],
    ),
    );
  }
  Column EducationField({
    required String title,
    required String hint,
    required String error,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        //color: appColor.appCLR,
        fontSize: 22,
      ),
    ),
    const SizedBox(height: 7),
    TextFormField(
    controller: controller,
    validator: (val) {
    if (val!.isEmpty) {
    return error;
    }
    return null;
    },
    onSaved: (val) {
    //Global.edu.add(controller.text);
    },
    decoration: InputDecoration(
    hintText: hint,
    //hintStyle: appTextField.appTxtFld,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    ),
    ),
        const SizedBox(height: 10),
      ],
    );
  }
}





