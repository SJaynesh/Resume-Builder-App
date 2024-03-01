import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder_app/utils/contact_page/contact_page_values.dart';

class TechnicalSkillPage extends StatefulWidget {
  const TechnicalSkillPage({super.key});

  @override
  State<TechnicalSkillPage> createState() => _TechnicalSkillPageState();
}

class _TechnicalSkillPageState extends State<TechnicalSkillPage> {
  @override
  Widget build(BuildContext context) {
    TextScaler textScaler = MediaQuery.textScalerOf(context);
    Size size = MediaQuery.sizeOf(context);
    double h = size.height;
    double w = size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: h * 0.23,
            width: w,
            padding: const EdgeInsets.all(16),
            color: const Color(0xff6054C1),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: h * 0.03,
                  ),
                ),
                const Spacer(),
                Text(
                  "Technical Skills",
                  style: TextStyle(
                    fontSize: textScaler.scale(23),
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Enter your skills",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: textScaler.scale(25),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.05,
                    ),
                    ...List.generate(
                      ContactPageVal.technicalSkill.length,
                      (index) => Field(index: index),
                    ),
                    SizedBox(
                      height: h * 0.035,
                    ),
                    Align(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            ContactPageVal.technicalSkill.add("");
                            ContactPageVal.technicalController
                                .add(TextEditingController());
                          });
                        },
                        icon: const Icon(Icons.add),
                        label: const Text("Add"),
                      ),
                    ),
                    ...ContactPageVal.technicalSkill
                        .map((e) => Text(
                              e,
                              style: TextStyle(
                                fontSize: textScaler.scale(20),
                              ),
                            ))
                        .toList(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget Field({required int index}) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: ContactPageVal.technicalController[index],
            onChanged: (val) {
              ContactPageVal.technicalSkill[index] = val;
              setState(() {});
            },
            decoration: const InputDecoration(
              hintText: "C Programming",
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  // width: 3,
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            log("INDEX : $index");
            ContactPageVal.technicalSkill.removeAt(index);
            ContactPageVal.technicalController.removeAt(index);
            setState(() {});
          },
          icon: const Icon(CupertinoIcons.delete),
        ),
      ],
    );
  }
}
