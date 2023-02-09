import 'package:flutter/material.dart';

import 'global_page.dart';

class references extends StatefulWidget {
  const references({Key? key}) : super(key: key);

  @override
  State<references> createState() => _referencesState();
}

class _referencesState extends State<references> {

  TextEditingController twelve = TextEditingController(text: Global.ref);
  TextEditingController designation =
  TextEditingController(text: Global.designation);
  TextEditingController institute =
  TextEditingController(text: Global.institute);
  GlobalKey<FormState> key = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 165,
        leading: Align(
          alignment: const Alignment(0, -0.03),
          child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'second', (route) => false);
                });
              },
              child: const Icon(Icons.arrow_back_ios, size: 30)),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text(
              "References",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
          ],
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff0475ff),
        elevation: 5,
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: key,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30,left: 30),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.51,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Reference Name",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff0475ff),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: twelve,
                      onSaved: (val) {
                        setState(() {
                          Global.ref = val;
                        });
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "please enter twelve name...";
                        } else {
                          return null;
                        }
                      },
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Jinesh Vavadiya",
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      "Designation",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff0475ff),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: designation,
                      onSaved: (val) {
                        setState(() {
                          Global.designation = val;
                        });
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "please enter your designation...";
                        } else {
                          return null;
                        }
                      },
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: " Manager",
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Organization/Institute",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff0475ff),
                      ),
                    ),
                    // const SizedBox(height: 5),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: institute,
                      onSaved: (val) {
                        setState(() {
                          Global.institute = val;
                        });
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "please enter your organization/institute name...";
                        } else {
                          return null;
                        }
                      },
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "tech bar Pvt. Ltd",
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    if (key.currentState!.validate()) {
                      key.currentState!.save();
                    }
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width / 3,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    key.currentState!.reset();
                    setState(() {
                      twelve.clear();
                      designation.clear();
                      institute.clear();
                      Global.ref = null;
                      Global.designation = null;
                      Global.institute = null;
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width / 3,
                    alignment: Alignment.center,
                    child: const Text(
                      "Reset",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.grey.shade50,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}