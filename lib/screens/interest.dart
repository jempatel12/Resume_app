import 'package:flutter/material.dart';
import 'global_page.dart';

class interest extends StatefulWidget {
  const interest({Key? key}) : super(key: key);

  @override
  State<interest> createState() => _interestState();
}

class _interestState extends State<interest> {
  TextEditingController nine = TextEditingController(text: Global.interest);
  GlobalKey<FormState> keys = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 165,
        leading: Align(
          alignment: const Alignment(0, -0.05),
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
              "Interest",
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
        key: keys,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                color: Colors.grey.shade50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Interest",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff0475ff),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: nine,
                      onSaved: (val) {
                        setState(() {
                          Global.interest = val;
                        });
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "please enter Interest...";
                        } else {
                          return null;
                        }
                      },
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      maxLines: 5,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Eg. Coding\nEg. fluttr\nEg. c&c++",
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
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
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    if (keys.currentState!.validate()) {
                      keys.currentState!.save();
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
                    keys.currentState!.reset();
                    setState(() {
                      nine.clear();
                      Global.interest = null;
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