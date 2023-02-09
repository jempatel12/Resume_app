import 'package:flutter/material.dart';

import 'global_page.dart';

class personal extends StatefulWidget {
  const personal({Key? key}) : super(key: key);

  @override
  State<personal> createState() => _personalState();
}

class _personalState extends State<personal> {
  final GlobalKey<FormState> personalDetailsKey = GlobalKey<FormState>();
  late TextEditingController date_of_birth_controller = TextEditingController();
  late TextEditingController nationality_controller = TextEditingController();

  dynamic _radioButton = "Marital Status";
  bool? radioColor;
  bool englishCheckedButton = false;
  bool hindiCheckedButton = false;
  bool gujaratiCheckedButton = false;



  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;



    return Scaffold(
        appBar: AppBar(
        leading: InkWell(
        onTap: () {
          setState(() {
            Navigator.pushNamedAndRemoveUntil(
                context, 'personal', (route) => false);
          });    },
    child: const Icon(Icons.arrow_back_ios),
    ),

    title: const Text(
    "Personal Details",
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
    //color: appColor.appCLR,
    alignment: const Alignment(0, 0.5),
    child: Text(
    "Personal Profile",

    ),
    ),
    ),
    Expanded(
    flex: 9,
    child: Container(
    padding: const EdgeInsets.all(25),
    child: SingleChildScrollView(
    child: Column(
    children: [
    Form(
    key: personalDetailsKey,
    child: Container(
    height: _height * 0.70,
    width: _width,
    padding: const EdgeInsets.all(25),

    child: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    "Date Of Birth",
    style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    //color: appColor.appCLR,
    ),
    ),
    const SizedBox(height: 10),
    TextFormField(
    controller: date_of_birth_controller,
    validator: (val) {
    if (val!.isEmpty) {
    return 'Enter your Birthdate';
    }
    return null;
    },
    onSaved: (val) {
    Global.date_of_birth = val! as int?;
    },
    decoration: InputDecoration(
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    ),
    hintText: 'DD/MM/YYYY',
   // hintStyle: appTextField.appTxtFld,
    ),
    ),
    const SizedBox(height: 10),
    Text(
    "Marital Status",
    style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    //color: appColor.appCLR,
    ),
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    Radio(
    value: 'Single',
    groupValue: _radioButton,
    onChanged: (val) {
    setState(() {
    _radioButton = val;
    radioColor = true;
    });
    if (radioColor == true) {
    Global.marital_status = "Single";
    }
    },
    ),
    Text(
    "Single",
    style: TextStyle(
    fontWeight: FontWeight.w500,
    color:
      // (radioColor == true)
    // ? //appColor.appCLR
    //     :
      Colors.grey,
    fontSize: 20,
    ),
    ),
    const SizedBox(width: 20),
    Radio(
    value: 'Married',
    groupValue: _radioButton,
    onChanged: (val) {
    setState(() {
    _radioButton = val;
    radioColor = false;
    });
    if (radioColor == false) {
    Global.marital_status = "Married";
    }
    },
    ),
    Text(
    "Married",
    style: TextStyle(
    fontWeight: FontWeight.w500,
    color:
    // (radioColor == false)
    // ? appColor.appCLR :
         Colors.grey,
    fontSize: 20,
    ),
    )
    ],
    ),
    const SizedBox(height: 10),
    Text(
    "Languages Known",
    style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    //color: appColor.appCLR,
    ),
    ),
    Row(
    children: [
    Checkbox(
    value: englishCheckedButton,
    onChanged: (val) {
    setState(() {
    englishCheckedButton = val!;

    });
    },
    ),
    Text(
    "English",
    style: TextStyle(
    fontWeight: FontWeight.w500,
    color:

    Colors.grey,
    fontSize: 20,
    ),
    )
    ],
    ),
    Row(
    children: [
    Checkbox(
    value: hindiCheckedButton,
    onChanged: (val) {
    setState(() {
    hindiCheckedButton = val!;

    });
    },
    ),
    Text(
    "Hindi",
    style: TextStyle(
    fontWeight: FontWeight.w500,
    color:

    Colors.grey,
    fontSize: 20,
    ),
    )
    ],
    ),
    Row(
    children: [
    Checkbox(
    value: gujaratiCheckedButton,
    onChanged: (val) {
    setState(() {
    gujaratiCheckedButton = val!;

    });
    },
    ),
    Text(
    "Gujarati",
    style: TextStyle(
    fontWeight: FontWeight.w500,
    color:
    // (gujaratiCheckedButton == true)
    // ? appColor.appCLR
    //     :
    Colors.grey,
    fontSize: 20,
    ),
    )
    ],
    ),
    const SizedBox(height: 10),
    Text(
    "Nationality",
    style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    //color: appColor.appCLR,
    ),
    ),
    const SizedBox(height: 10),
    TextFormField(
    controller: nationality_controller,
    validator: (val) {
    if (val!.isEmpty) {
    return "Enter your Nationality";
    }
    return null;
    },
    onSaved: (val) {
    Global.nationality = val!;
    },
    decoration: InputDecoration(
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    ),
    hintText: 'Indian',

    ),
    ),
    ],
    ),
    ),
    ),
    ),
    const SizedBox(height: 35),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    Container(
    width: _width * 0.3,
    height: _height * 0.06,
    child: ElevatedButton(
    onPressed: () {
    if (personalDetailsKey.currentState!.validate()) {
    personalDetailsKey.currentState!.save();

    }
    print(Global.date_of_birth);
    print(Global.marital_status);
    print(Global.languages);
    print(Global.nationality);
    },
    style: ElevatedButton.styleFrom(

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
    personalDetailsKey.currentState!.reset();

    date_of_birth_controller.clear();
    nationality_controller.clear();

    setState(() {

    Global.nationality = "";
    englishCheckedButton = false;
    hindiCheckedButton = false;
    gujaratiCheckedButton = false;
    });
    },
      style: OutlinedButton.styleFrom(
      //  primary: appColor.appCLR,
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
    ],
    ),
    ),
    ),
    ),
    ],
    ),
    );
  }
}
