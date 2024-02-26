import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resume_builder_app/utils/contact_page/contact_page_values.dart';

class PersonalDetailPage extends StatefulWidget {
  const PersonalDetailPage({super.key});

  @override
  State<PersonalDetailPage> createState() => _PersonalDetailPageState();
}

class _PersonalDetailPageState extends State<PersonalDetailPage> {
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
                  "Personal Detail",
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
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "DOB",
                  style: TextStyle(
                    fontSize: textScaler.scale(22),
                    color: const Color(0xff6054C1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "DD/MM/YYYY",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 1,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purpleAccent,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.025,
                ),
                Text(
                  "Gender",
                  style: TextStyle(
                    fontSize: textScaler.scale(22),
                    color: const Color(0xff6054C1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      activeColor: Colors.brown,
                      fillColor: MaterialStateProperty.all(Colors.brown),
                      // focusColor: Colors.green,
                      overlayColor:
                          MaterialStateProperty.all(Colors.green.shade300),
                      value: "Male",
                      groupValue: ContactPageVal.gender,
                      onChanged: (val) {
                        // log(val ?? "");
                        setState(() {
                          ContactPageVal.gender = val;
                        });
                      },
                    ),
                    const Text("Male"),
                    Radio(
                      value: "Female",
                      groupValue: ContactPageVal.gender,
                      onChanged: (val) {
                        // log(val ?? "");
                        setState(() {
                          ContactPageVal.gender = val;
                        });
                      },
                    ),
                    const Text("Female"),
                  ],
                ),
                Text("Gender: ${ContactPageVal.gender ?? ""}"),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text("Male"),
                        subtitle: const Text("gender"),
                        tileColor: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        overlayColor: MaterialStateProperty.all(
                          Colors.red,
                        ),
                        contentPadding: const EdgeInsets.all(5),
                        secondary: const Text("👨‍🦰"),
                        value: "Male",
                        groupValue: ContactPageVal.gender,
                        onChanged: (val) {
                          setState(() {
                            ContactPageVal.gender = val;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: w * 0.015,
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: const Text("Female"),
                        subtitle: const Text("gender"),
                        tileColor: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        overlayColor: MaterialStateProperty.all(
                          Colors.red,
                        ),
                        contentPadding: const EdgeInsets.all(5),
                        secondary: const Text("👩‍🦰"),
                        value: "Female",
                        groupValue: ContactPageVal.gender,
                        onChanged: (val) {
                          setState(() {
                            ContactPageVal.gender = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.025,
                ),
                Text(
                  "Language",
                  style: TextStyle(
                    fontSize: textScaler.scale(22),
                    color: const Color(0xff6054C1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      overlayColor: MaterialStateProperty.all(
                        Colors.green,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      side: const BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                      activeColor: Colors.green,
                      checkColor: Colors.black,
                      value: ContactPageVal.hindi,
                      onChanged: (val) {
                        setState(() {
                          ContactPageVal.hindi = val ?? false;
                        });
                      },
                    ),
                    const Text("Hindi"),
                  ],
                ),
                CheckboxListTile(
                  title: const Text("English"),
                  subtitle: const Text("language"),
                  secondary: const Text("🚩"),
                  side: const BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                  tileColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: ContactPageVal.english,
                  onChanged: (val) {
                    setState(() {
                      ContactPageVal.english = val!;
                    });
                  },
                ),
                Text(ContactPageVal.hindi ? "Hindi" : ""),
                Text(ContactPageVal.english ? "English" : ""),
              ],
            ),
          )
        ],
      ),
    );
  }
}
