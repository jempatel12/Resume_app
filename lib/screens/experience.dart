import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'global_page.dart';

class experience extends StatefulWidget {
  const experience({Key? key}) : super(key: key);

  @override
  State<experience> createState() => _experienceState();
}

class _experienceState extends State<experience> {
  TextEditingController company = TextEditingController(text: Global.company);
  TextEditingController school = TextEditingController(text: Global.school);
  TextEditingController role = TextEditingController(text: Global.role);
  TextEditingController start = TextEditingController(text: Global.start);
  TextEditingController end = TextEditingController(text: Global.exp);
  GlobalKey<FormState> keys = GlobalKey<FormState>();
  String? status;
  Color myColor1 = Colors.grey.shade500;
  Color myColor2 = Colors.black;
  bool enable = true;

  @override
  void initState() {
    status = Global.status;

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
              "Experiences",
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only( left: 30),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.68,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  color: Colors.grey.shade50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Company Name",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff0475ff),
                        ),
                      ),
                      // const SizedBox(height: 5),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: company,
                        onSaved: (val) {
                          setState(() {
                            Global.company = val;
                          });
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "please enter your company name...";
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
                          hintText: "tech bar",
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),

                      const Text(
                        "Roles (optional)",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff0475ff),
                        ),
                      ),
                      // const SizedBox(height: 5),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: role,
                        onSaved: (val) {
                          setState(() {
                            Global.role = val;
                          });
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "please enter your roles...";
                          } else {
                            return null;
                          }
                        },
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        maxLines: 3,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText:
                              " product analysis...",
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),

                      const Text(
                        "Employed Status",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff0475ff),
                        ),
                      ),
                      Row(
                        children: [
                          Radio(
                              value: "Previously ",
                              groupValue: status,
                              onChanged: (val) {
                                setState(() {
                                  status = val as String?;
                                  myColor1 = Colors.grey.shade500;
                                  myColor2 = Colors.black;
                                  enable = true;
                                });
                              }),
                          const Text(
                            "Previously ",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Radio(
                              value: "Currently ",
                              groupValue: status,
                              onChanged: (val) {
                                setState(() {
                                  status = val as String?;
                                  myColor1 = Colors.white;
                                  myColor2 = Colors.white;
                                  enable = false;
                                });
                              }),
                          const Text(
                            "Currently ",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black,
                      ),
                      // const SizedBox(height: 10),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Date Joined",
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
                                  controller: start,
                                  onTap: () async {
                                    DateTime? pick = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2101),
                                    );
                                    if (pick != null) {
                                      setState(() {
                                        start.text =
                                            DateFormat('dd/MM/yyyy').format(pick);
                                        Global.start = start.text;
                                      });
                                    }
                                  },
                                  onSaved: (val) {
                                    setState(() {
                                      val;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "please enter joined date...";
                                    } else {
                                      return null;
                                    }
                                  },
                                  maxLength: 10,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    counterText: "",
                                    border: const OutlineInputBorder(),
                                    hintText: "DD/MM/YYYY",
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
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
                                "Date Exit",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: myColor1,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: 120,
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  controller: end,
                                  onTap: () async {
                                    DateTime? pick = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2101),
                                    );
                                    if (pick != null) {
                                      setState(() {
                                      end.text =
                                      DateFormat('dd/MM/yyyy').format(pick);
                                      Global.exp = end.text;
                                      });
                                    }
                                  },
                                  onSaved: (val) {
                                    setState(() {
                                      val;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "please enter exit date...";
                                    } else {
                                      return null;
                                    }
                                  },
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: myColor2,
                                  ),
                                  maxLength: 10,
                                  cursorColor: myColor2,
                                  decoration: InputDecoration(
                                    enabled: enable,
                                    counterText: "",
                                    border: (enable)
                                        ? const OutlineInputBorder()
                                        : const UnderlineInputBorder(),
                                    hintText: "DD/MM/YYYY",
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: myColor2),
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: myColor1,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (keys.currentState!.validate()) {
                        keys.currentState!.save();
                      }
                      setState(() {
                        Global.status = status;
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
                      keys.currentState!.reset();
                      setState(() {
                        company.clear();
                        school.clear();
                        role.clear();
                        start.clear();
                        end.clear();
                        Global.company = null;
                        Global.school = null;
                        Global.role = null;
                        Global.start = null;
                        Global.exp = null;
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
              ),SizedBox(height: 80,)
            ],
          ),
        ),
      ),

    );
  }

}
