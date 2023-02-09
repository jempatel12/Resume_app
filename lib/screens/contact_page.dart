import 'package:flutter/material.dart';
import 'dart:io';

import 'global_page.dart';

class three extends StatefulWidget {
  const three({Key? key}) : super(key: key);

  @override
  State<three> createState() => _threeState();
}

class _threeState extends State<three> {
  TextEditingController name = TextEditingController(text: Global.name);
  TextEditingController email = TextEditingController(text: Global.email);
  TextEditingController number = TextEditingController(
      text: (Global.number != null) ? Global.number.toString() : null);
  TextEditingController address = TextEditingController(text: Global.address);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // ImagePicker image = ImagePicker();
  // XFile? file;

  camera() async {
    // file = await image.pickImage(source: ImageSource.camera);
  }

  gallery() async {
    // file = await image.pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              toolbarHeight: 165,
              leading: GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamedAndRemoveUntil(
                        context, 'second', (route) => false);
                  });
                },
                child: const Icon(Icons.arrow_back_ios, size: 30),
              ),
              title: const Text(
                "Resume Workspace",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
              ),
              bottom: const TabBar(
                // indicatorColor: Colors.white,
                tabs: [
                  Tab(
                    text: "Contect",
                  ),
                  Tab(
                    text: "Photo",
                  ),
                ],
              ),
              centerTitle: true,
              backgroundColor: const Color(0xff0475ff),
              elevation: 5,
            ),
            backgroundColor: Colors.white,
            body: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [
                Column(
                  children: [
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.grey.shade50,
                        padding: const EdgeInsets.all(10),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  const Expanded(
                                    child: Icon(Icons.person,
                                        color: Color(0xff858585), size: 45),
                                  ),
                                  const Spacer(flex: 1),
                                  Expanded(
                                    flex: 8,
                                    child: TextFormField(
                                      controller: name,
                                      onSaved: (val) {
                                        setState(() {
                                          Global.name = val;
                                        });
                                      },
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "Please enter name...";
                                        } else {
                                          return null;
                                        }
                                      },
                                      keyboardType: TextInputType.name,
                                      textInputAction: TextInputAction.next,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        border: const UnderlineInputBorder(),
                                        hintText: "Name",
                                        focusedBorder: const UnderlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Colors.black)),
                                        hintStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                    child: Icon(
                                      Icons.email_sharp,
                                      color: Color(0xff858585),
                                      size: 45,
                                    ),
                                  ),
                                  const Spacer(flex: 1),
                                  Expanded(
                                    flex: 8,
                                    child: TextFormField(
                                      controller: email,
                                      onSaved: (val) {
                                        setState(() {
                                          Global.email = val;
                                        });
                                      },
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "Please enter email...";
                                        } else {
                                          return null;
                                        }
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        border: const UnderlineInputBorder(),
                                        hintText: "Email",
                                        focusedBorder: const UnderlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Colors.black)),
                                        hintStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                    child: Icon(
                                      Icons.phone_iphone_sharp,
                                      color: Color(0xff858585),
                                      size: 45,
                                    ),
                                  ),
                                  const Spacer(flex: 1),
                                  Expanded(
                                    flex: 8,
                                    child: TextFormField(
                                      controller: number,
                                      onSaved: (val) {
                                        setState(() {
                                          Global.number = int.parse(val!);
                                        });
                                      },
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "Please enter three number...";
                                        } else if (val.length != 10) {
                                          return "Please enter 10 digits three number...";
                                        } else {
                                          return null;
                                        }
                                      },
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      cursorColor: Colors.black,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                        border: const UnderlineInputBorder(),
                                        hintText: "Number",
                                        focusedBorder: const UnderlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Colors.black)),
                                        hintStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Expanded(
                                    child: Icon(
                                      Icons.location_on_sharp,
                                      color: Color(0xff858585),
                                      size: 45,
                                    ),
                                  ),
                                  const Spacer(flex: 1),
                                  Expanded(
                                    flex: 8,
                                    child: TextFormField(
                                      controller: address,
                                      onSaved: (val) {
                                        setState(() {
                                          Global.address = val;
                                        });
                                      },
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "Please enter address...";
                                        } else {
                                          return null;
                                        }
                                      },
                                      maxLines: 3,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        border: const UnderlineInputBorder(),
                                        hintText: "Address",
                                        focusedBorder: const UnderlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Colors.black)),
                                        hintStyle: TextStyle(
                                          fontSize: 20,
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
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
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
                            color: Colors.grey.shade50,
                            alignment: Alignment.center,
                            child: const Text(
                              "Submit",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            formKey.currentState!.reset();
                            setState(() {
                              name.clear();
                              email.clear();
                              number.clear();
                              address.clear();
                              Global.name = null;
                              Global.email = null;
                              Global.number = null;
                              Global.address = null;
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width / 3,
                            color: Colors.grey.shade50,
                            alignment: Alignment.center,
                            child: const Text(
                              "Reset",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.grey.shade50,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Stack(
                            children: [
                              Positioned(
                                child: Center(
                                  child: CircleAvatar(
                                    radius: 70,
                                    // backgroundImage: (file != null)
                                    //     ? FileImage(File(file!.path))
                                    //     : null,
                                    backgroundColor: const Color(0xffc4c4c4),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 130,
                                left: 205,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          elevation: 10,
                                          backgroundColor: Colors.white,
                                          title: const Text(
                                              "Choose any source for take image"),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  camera();
                                                  Navigator.pop(context);
                                                });
                                              },
                                              child: const Text("Camera"),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  gallery();
                                                  Navigator.pop(context);
                                                });
                                              },
                                              child: const Text("Gallery"),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff0475ff),
                                    ),
                                    child:
                                    const Icon(Icons.add, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
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