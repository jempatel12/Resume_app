import 'package:flutter/material.dart';
import 'global_page.dart';

class declaration extends StatefulWidget {
  const declaration({Key? key}) : super(key: key);

  @override
  State<declaration> createState() => _declarationState();
}

class _declarationState extends State<declaration> {

  TextEditingController desc = TextEditingController(text: Global.desc);
  TextEditingController date = TextEditingController(text: Global.date);
  TextEditingController place = TextEditingController(text: Global.place);
  bool isTrue = false;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    isTrue = Global.isTrue;
  }


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
              "Declaration",
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
            (isTrue)
                ? Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(right: 30,left: 30),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Declaration",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff0475ff),
                          ),
                        ),
                        Switch(
                          value: isTrue,
                          onChanged: (val) {
                            setState(() {
                              isTrue = val;
                            });
                          },
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Image.network(
                        "https://cdn.onlinewebfonts.com/svg/img_453391.png",
                        height: 80,
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: desc,
                      onSaved: (val) {
                        setState(() {
                          Global.desc = val;
                        });
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "please enter description...";
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
                        hintText: "Description",
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
                    const SizedBox(height: 40),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Date\n",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 120,
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                controller: date,
                                onTap: () async {
                                  DateTime? pick = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2101),
                                  );
                                  if (pick != null) {
                                  }
                                },
                                onSaved: (val) {
                                  setState(() {
                                    val;
                                  });
                                },
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "please enter date...";
                                  } else {
                                    return null;
                                  }
                                },
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: "DD/MM/YYYY",
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black)),
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Place (Interview\nvenue/city)",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 120,
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                controller: place,
                                onSaved: (val) {
                                  setState(() {
                                    Global.place = val;
                                  });
                                },
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "please enter place...";
                                  } else {
                                    return null;
                                  }
                                },
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: "Eg. Surat",
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.black),
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
                : Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Declaration",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff0475ff),
                      ),
                    ),
                    Switch(
                      value: isTrue,
                      onChanged: (val) {
                        setState(() {
                          isTrue = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    if (key.currentState!.validate()) {
                      key.currentState!.save();
                    }
                    setState(() {
                      Global.isTrue = isTrue;
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
                    key.currentState!.reset();
                    setState(() {
                      desc.clear();
                      date.clear();
                      place.clear();
                      Global.desc = null;
                      Global.date = null;
                      Global.place = null;
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
