import 'package:flutter/material.dart';
import 'global_page.dart';

class technical extends StatefulWidget {
  const technical({Key? key}) : super(key: key);

  @override
  State<technical> createState() => _technicalState();
}

class _technicalState extends State<technical> {

  List<TextEditingController> skillControllers = [];
  GlobalKey<FormState> formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              "Technical Skill",
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:30,right: 30),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 20, right: 20),
              color: Colors.grey.shade50,
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Enter your skill",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff0475ff),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ...skillControllers.map(
                            (e) => myTextField(controller: e),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  skillControllers.add(TextEditingController());
                });
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Text(
                  "ADD",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
// color: Colors.black,
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.grey.shade50,
                ),
              ),
            ),
          ),
          const SizedBox(height:10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
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
              ),SizedBox(height: 80),
              GestureDetector(
                onTap: () {
                  formKey.currentState!.reset();
                  setState(() {
                    skillControllers.clear();
                    Global.skills.toString();
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
    );
  }
  Widget myTextField({required TextEditingController controller}) {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: TextFormField(
            controller: controller,
            onSaved: (val) {
              // setState(() {
              //   Global.skills.add(val);
              // });
            },
            validator: (val) {
              if (val!.isEmpty) {
                return "Please enter eight...";
              } else {
                return null;
              }
            },
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            cursorColor: Colors.black,
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              hintText: "flutter , c++ , exel",
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              hintStyle: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade500,
              ),
            ),
          ),
        ),
        const Spacer(flex: 1),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              setState(() {
                skillControllers.removeAt(
                  skillControllers.indexOf(controller),
                );
              });
            },
            child: const Icon(Icons.delete, size: 35),
          ),
        ),
      ],
    );
  }
}
