import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder_app/utils/contact_page/contact_page_values.dart';

class DeclarationPage extends StatefulWidget {
  const DeclarationPage({super.key});

  @override
  State<DeclarationPage> createState() => _DeclarationPageState();
}

class _DeclarationPageState extends State<DeclarationPage> {
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
                  "Declaration",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Theme(
                      data: ThemeData(
                        useMaterial3: true,
                      ),
                      child: Switch(
                        value: ContactPageVal.declaration,
                        activeColor: Colors.green,
                        overlayColor: MaterialStateProperty.all(
                          Colors.brown,
                        ),
                        inactiveThumbColor: Colors.red,
                        thumbColor:
                            MaterialStateProperty.all(Colors.deepPurple),
                        // trackColor: MaterialStateProperty.all(Colors.black),
                        activeThumbImage: const NetworkImage(
                            "https://emojiisland.com/cdn/shop/products/Emoji_Icon_-_Sunglasses_cool_emoji_large.png?v=1571606093"),
                        inactiveThumbImage: const NetworkImage(
                            "https://emojiisland.com/cdn/shop/products/Smiling_Face_Emoji_grande.png?v=1571606036"),
                        onChanged: (val) {
                          ContactPageVal.declaration = val;
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: ContactPageVal.declaration,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        "https://assets-global.website-files.com/646218c67da47160c64a84d5/64faef04f0101dc9ac9e3fbc_94.png",
                        height: h * 0.1,
                      ),
                      SizedBox(
                        height: h * 0.025,
                      ),
                      SizedBox(
                        height: h * 0.06,
                        width: w,
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: "Description",
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.purple,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.05,
                      ),
                      const Divider(),
                      SizedBox(
                        height: h * 0.025,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Save"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // (ContactPageVal.declaration)
                //     ? Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Image.network(
                //             "https://assets-global.website-files.com/646218c67da47160c64a84d5/64faef04f0101dc9ac9e3fbc_94.png",
                //             height: h * 0.1,
                //           ),
                //           SizedBox(
                //             height: h * 0.025,
                //           ),
                //           SizedBox(
                //             height: h * 0.06,
                //             width: w,
                //             child: const TextField(
                //               decoration: InputDecoration(
                //                 hintText: "Description",
                //                 enabledBorder: OutlineInputBorder(),
                //                 focusedBorder: OutlineInputBorder(
                //                   borderSide: BorderSide(
                //                     color: Colors.purple,
                //                     width: 2,
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ),
                //           SizedBox(
                //             height: h * 0.05,
                //           ),
                //           const Divider(),
                //           SizedBox(
                //             height: h * 0.025,
                //           ),
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               ElevatedButton(
                //                 onPressed: () {},
                //                 child: const Text("Save"),
                //               ),
                //             ],
                //           ),
                //         ],
                //       )
                //     : Container(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
