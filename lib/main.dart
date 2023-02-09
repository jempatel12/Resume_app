import 'package:flutter/material.dart';
import 'package:resume_builder/screens/achievements.dart';
import 'package:resume_builder/screens/carrier.dart';
import 'package:resume_builder/screens/contact_page.dart';
import 'package:resume_builder/screens/declaration.dart';
import 'package:resume_builder/screens/education.dart';
import 'package:resume_builder/screens/experience.dart';
import 'package:resume_builder/screens/interest.dart';
import 'package:resume_builder/screens/personal.dart';
import 'package:resume_builder/screens/projects.dart';
import 'package:resume_builder/screens/references.dart';
import 'package:resume_builder/screens/secend_page.dart';
import 'package:resume_builder/screens/technical.dart';

void main(){
  runApp(MaterialApp(
    routes: {
      '/': (context) => const Resume(),
      'secend': (context) => const Secend_Page(),
      'three': (context) => const three(),
      'Carrier': (context)  => const Carrier(),
      'personal' : (context) =>  const personal(),
      'education' : (context) => const education(),
      'experience' : (context) => const experience(),
      'technical' : (context) =>  const technical(),
      'interest'  : (context) => const interest(),
      'projects'  : (context) => const projects(),
      'achievements' : (context) => const achievements(),
      'references' : (context) => const references(),
      'declaration' : (context) => const declaration(),
    },
    debugShowCheckedModeBanner: false,
  ),
  );
}
class Resume extends StatefulWidget {
  const Resume({Key? key}) : super(key: key);

  @override
  State<Resume> createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  @override
  Widget build(BuildContext context) {
   // var appColor;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 165,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text(
              "\nResume Builder\n\n",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            Text(
              "RESUMES",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 5),
          ],
        ),
        centerTitle: true,
       // backgroundColor:
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.pushNamed(context, 'secend');
                });
              },
              child: Image.asset("assets/icons/open-cardboard-box.png",
                  height: 120),
            ),
            const Text(
              "No Resumes + Create new resume.",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff959595)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.pushNamed(context, 'secend');
          });
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, size: 50, color: Colors.white),
      ),
    );
  }
}
