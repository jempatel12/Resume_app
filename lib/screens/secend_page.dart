import 'package:flutter/material.dart';

class Secend_Page extends StatefulWidget {
  const Secend_Page({Key? key}) : super(key: key);

  @override
  State<Secend_Page> createState() => _Secend_PageState();
}

class _Secend_PageState extends State<Secend_Page> {
  final List<Map<String, dynamic>> _allPage = [
    {
      'id': 1,
      'icon': 'assets/icons/contact-books.png',
      'title': 'Contact info',
      'route': 'three',
    },
    {
      'id': 2,
      'icon': 'assets/icons/briefcase.png',
      'title': 'Carrier ',
      'route': 'Carrier',
    },
    {
      'id': 3,
      'icon': 'assets/icons/user.png',
      'title': 'Personal Details',
      'route': 'personal',
    },
    {
      'id': 4,
      'icon': 'assets/icons/mortarboard.png',
      'title': 'Education',
       'route': 'education',
    },
    {
      'id': 5,
      'icon': 'assets/icons/experience.png',
      'title': 'Experience',
       'route': 'experience',
    },
    {
      'id': 6,
      'icon': 'assets/icons/thinking.png',
      'title': 'Technical Skills',
      'route': 'technical',
    },
    {
      'id': 7,
      'icon': 'assets/icons/open-book.png',
      'title': 'Interest/Hobbies',
       'route': 'interest',
    },
    {
      'id': 8,
      'icon': 'assets/icons/project.png',
      'title': 'Projects',
      'route': 'projects',
    },
    {
      'id': 9,
      'icon': 'assets/icons/experience.png',
      'title': 'Achievements',
      'route': 'achievements',
    },
    {
      'id': 10,
      'icon': 'assets/icons/handshake.png',
      'title': 'References',
      'route': 'references',
    },
    {
      'id': 11,
      'icon': 'assets/icons/declaration.png',
      'title': 'Declaration',
      'route': 'declaration',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 165,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios),
        ),

        title: const Text(
          "Resume Workspace",
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
            //  color: appColor.appCLR,
              alignment: const Alignment(0, 0.5),
              child: Text(
                "Build Options",style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black
              ),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: SingleChildScrollView(
              child: Column(
                children: _allPage
                    .map(
                      (allPage) => Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(allPage['route']);
                        },
                        child: Row(
                          children: [
                            const SizedBox(width: 25),
                            Image.asset(allPage['icon'], width: 45),
                            const SizedBox(width: 25),
                            Text(
                              allPage['title'],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            const Icon(Icons.arrow_forward_ios),
                            const SizedBox(width: 25),
                          ],
                        ),
                      ),
                      const Divider(thickness: 2),
                    ],
                  ),
                )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
