import 'package:flutter/material.dart';

import 'global_page.dart';

class achievements extends StatefulWidget {
  const achievements({Key? key}) : super(key: key);

  @override
  State<achievements> createState() => _achievementsState();
}

class _achievementsState extends State<achievements> {

  List<TextEditingController> achievementController = [];
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    achievementController.add(TextEditingController());
    achievementController.add(TextEditingController());
  }

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
              "Achievements",
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
      body: Padding(
        padding: const EdgeInsets.only(left: 30,right: 30),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              color: Colors.grey.shade50,
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Enter Achievements",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff0475ff),
                        ),
                      ),
                      const SizedBox(height: 5),
                      ...achievementController.map(
                            (e) => myRow(achieveController: e),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                setState(() {
                  achievementController.add(TextEditingController());
                });
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: const Text(
                  "ADD",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.grey.shade50,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    }
                    setState(() {
                      Global.achievements =
                          achievementController.map((e) => (e.text)).toList();
                    });
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
                    formKey.currentState!.reset();
                    setState(() {
                      Global.achievements.clear();
                      achievementController.clear();
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
  Widget myRow({required TextEditingController achieveController}) {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: TextFormField(
            textInputAction: TextInputAction.next,
            controller: achieveController,
            onSaved: (val) {
              setState(() {
                Global.achievements.add(val);
              });
            },
            validator: (val) {
              if (val!.isEmpty) {
                return "Please enter Skill...";
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
              hintText: "Exceeded sales 17% average",
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
                achievementController
                    .removeAt(achievementController.indexOf(achieveController));
              });
            },
            child: const Icon(Icons.delete, size: 35),
          ),
        ),
      ],
    );
  }
}
