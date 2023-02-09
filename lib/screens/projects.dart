import 'package:flutter/material.dart';
import 'global_page.dart';

class projects extends StatefulWidget {
  const projects({Key? key}) : super(key: key);

  @override
  State<projects> createState() => _projectsState();
}

class _projectsState extends State<projects> {

  TextEditingController project = TextEditingController(text: Global.project);
  TextEditingController roles = TextEditingController(text: Global.roles);
  TextEditingController tech = TextEditingController(text: Global.tech);
  TextEditingController description =
  TextEditingController(text: Global.description);
  GlobalKey<FormState> key = GlobalKey<FormState>();
  List technology = [];

  @override
  void initState() {
    super.initState();
    technology = Global.technologies;
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
              "Project",
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.78,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                  color: Colors.grey.shade50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Project Title",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff0475ff),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: project,
                        onSaved: (val) {
                          setState(() {
                            Global.project = val;
                          });
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "please enter your Ten title...";
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
                          hintText: "Resume Builder App",
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Technologies",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff0475ff)),
                      ),
                      SizedBox(
                        height: 37,
                        child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(
                            "C Programming",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          value: Global.clanguage,
                          onChanged: (val) {
                            setState(() {
                              Global.clanguage = val!;
                              (Global.clanguage)
                                  ? (technology).add("C Programming")
                                  : (technology).remove("C Programming");
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 37,
                        child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(
                            "C++",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          value: Global.c,
                          onChanged: (val) {
                            setState(() {
                              Global.c = val!;
                              (Global.c)
                                  ? (technology).add("C++")
                                  : (technology).remove("C++");
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 37,
                        child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(
                            "Flutter",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          value: Global.flutter,
                          onChanged: (val) {
                            setState(() {
                              Global.flutter = val!;
                              (Global.flutter)
                                  ? (technology).add("Flutter")
                                  : (technology).remove("Flutter");
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Roles",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff0475ff)),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: roles,
                        onSaved: (val) {
                          setState(() {
                            Global.roles = val;
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
                        maxLines: 2,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Organize team members, Code analysis",
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Technologies",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff0475ff)),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: tech,
                        onSaved: (val) {
                          setState(() {
                            Global.tech = val;
                          });
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "please enter your technologies knowledge...";
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
                          hintText: "5 - Programmers",
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Project Description",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff0475ff)),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: description,
                        onSaved: (val) {
                          setState(() {
                            Global.description = val;
                          });
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "please enter your projects description...";
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
                          hintText: "Enter Your project Description",
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
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (key.currentState!.validate()) {
                        key.currentState!.save();
                      }
                      setState(() {
                        Global.technologies = technology;
                      });
                    },
                    child: Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.07,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 3,
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
                        project.clear();
                        roles.clear();
                        tech.clear();
                        description.clear();
                        Global.project = null;
                        Global.roles = null;
                        Global.tech = null;
                        Global.description = null;
                        Global.clanguage = false;
                        Global.c = false;
                        Global.flutter = false;
                        technology.clear();
                        Global.technologies.clear();
                      });
                    },
                    child: Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.07,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 3,
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
      ),
    );
  }
}
