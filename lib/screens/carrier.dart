import 'package:flutter/material.dart';
import 'global_page.dart';

class Carrier extends StatefulWidget {
  const Carrier({Key? key}) : super(key: key);

  @override
  State<Carrier> createState() => _CarrierState();
}

class _CarrierState extends State<Carrier> {
  final GlobalKey<FormState> _carrierKey = GlobalKey<FormState>();

  final TextEditingController _carrier_controller =
  TextEditingController();
  final TextEditingController _current_controller =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery
        .of(context)
        .size
        .height;
    double _width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            setState(() {
              Navigator.pushNamedAndRemoveUntil(
                  context, 'carrier', (route) => false);
              child:
              const Icon(Icons.arrow_back_ios);
            });
          }   ) ,

        title: const Text(
          "Carrier Objective",
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
             // color: appColor.appCLR,
              alignment: const Alignment(0, 0.5),
              child: Text(
                "About Carrier",

              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: SingleChildScrollView(
              child: Container(
                height: _height * 0.8,
                width: _width,
                padding: const EdgeInsets.all(25),
                alignment: Alignment.topCenter,
                child: Form(
                  key: _carrierKey,
                  child: Column(
                    children: [
                      Container(
                        width: _width,
                        height: _height * 0.32,
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                         // color: appColor.fromCLR,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Carrier Objective',
                                style: TextStyle(
                                  fontSize: 22,
                                 // color: appColor.appCLR,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 12),
                              TextFormField(
                                controller: _carrier_controller,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter Carrier Description...";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    Global.carrier_objective = val!;
                                  });
                                },
                                maxLines: 6,
                                decoration: InputDecoration(
                                  hintTextDirection: TextDirection.ltr,
                                  hintText: "Description",

                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        width: _width,
                        height: _height * 0.22,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                         // color: appColor.fromCLR,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Current Designation (Experienced Candidate)',
                                style: TextStyle(
                                  fontSize: 22,
                                //  color: appColor.appCLR,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 12),
                              TextFormField(
                                controller: _current_controller,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter details of current designation...";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    Global.current_designation = val!;
                                  });
                                },
                                decoration: InputDecoration(
                                  hintTextDirection: TextDirection.ltr,
                                  hintText: "Software Engineer",

                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: _width * 0.3,
                            height: _height * 0.06,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_carrierKey.currentState!
                                    .validate()) {
                                  _carrierKey.currentState!.save();
                                }
                                print(Global.carrier);
                                print(Global.current_designation);
                              },
                              style: ElevatedButton.styleFrom(
                               // primary: appColor.appCLR,
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
                                _carrierKey.currentState!.reset();

                                _carrier_controller.clear();
                                _current_controller.clear();

                                setState(() {
                                  Global.carrier_objective = "";
                                  Global.current_designation = "";
                                });
                              },
                              style: OutlinedButton.styleFrom(
                               // primary: appColor.appCLR,
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
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}