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
          Padding(
            padding: const EdgeInsets.all(18),
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
                    ContactPageVal.technicalSkill.length, (index) => null),
                Align(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    label: Text("Add"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
