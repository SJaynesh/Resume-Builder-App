import 'dart:developer';

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_builder_app/utils/contact_page/contact_page_values.dart';

class ContactInfoPage extends StatefulWidget {
  const ContactInfoPage({super.key});

  @override
  State<ContactInfoPage> createState() => _ContactInfoPageState();
}

class _ContactInfoPageState extends State<ContactInfoPage> {
  @override
  void dispose() {
    super.dispose();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  // Image Pick Camera
  Future<void> imagePickWithCamera() async {
    ImagePicker picker = ImagePicker();
    XFile? xFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (xFile != null) {
        ContactPageVal.image = File(xFile.path);
      }
    });
  }

  // Image Pick Gallery
  Future<void> imagePickWithGallery() async {
    ImagePicker picker = ImagePicker();
    XFile? xFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (xFile != null) {
        ContactPageVal.image = File(xFile.path);
      }
    });
  }

  bool _hide = false;
  int _selected = 0;

  TextEditingController nameController = TextEditingController(text: "Jaynesh");
  TextEditingController phoneNumnerController =
      TextEditingController(text: "9825476060");
  TextEditingController passwordController =
      TextEditingController(text: "Abc@6060");

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Color iconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text("Contact Info"),
          ),
          backgroundColor: Colors.grey.shade200,
          body: Column(
            children: [
              //TabBar
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selected = 0;
                        });
                        log("Contact clicked...");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.amber,
                              width: _selected == 0 ? 4 : 0,
                            ),
                          ),
                        ),
                        child: const Text(
                          "Contact",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selected = 1;
                        });
                        log("Image clicked...");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.amber,
                              width: _selected == 1 ? 4 : 0,
                            ),
                          ),
                        ),
                        child: const Text(
                          "Image",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //MainBody
              Expanded(
                child: IndexedStack(
                  index: _selected,
                  children: [
                    //ContactPage
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(20),
                        child: Form(
                          key: formKey,
                          autovalidateMode: AutovalidateMode.always,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  // textAlign: TextAlign.center,
                                  // controller: nameController,
                                  initialValue: ContactPageVal.name,
                                  textInputAction: TextInputAction.done,
                                  // onChanged: (val) {
                                  //   ContactPageVal.name = val;
                                  // },
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Enter your name...";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (val) {
                                    ContactPageVal.name = val ?? "";
                                  },
                                  onFieldSubmitted: (val) {
                                    log("==============");
                                    log(val);
                                    iconColor = Colors.blueAccent;
                                    setState(() {});
                                    log("==============");
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.person),
                                    suffixIcon: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Icon(
                                        Icons.contact_mail,
                                        color: iconColor,
                                      ),
                                    ),
                                    labelText: "Name",
                                    hintText: "Enter name",
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade400,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                        color: Colors.green,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  // controller: phoneNumnerController,
                                  // textAlign: TextAlign.center,
                                  // maxLines: 5,
                                  keyboardType: TextInputType.phone,
                                  initialValue: ContactPageVal.phoneNumber,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  // onChanged: (val) {
                                  //   ContactPageVal.phoneNumber = val;
                                  // },
                                  validator: (val) {
                                    return (val!.isEmpty)
                                        ? "Enter your phone number..."
                                        : (val.length == 10)
                                            ? null
                                            : "number is not required";
                                  },
                                  onSaved: (val) {
                                    ContactPageVal.phoneNumber = val ?? "";
                                  },
                                  textInputAction: TextInputAction.next,
                                  maxLength: 10,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.dialpad),
                                    labelText: "Number",
                                    hintText: "Enter number",
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade400,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                        color: Colors.green,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  // controller: passwordController,
                                  initialValue: ContactPageVal.password,
                                  textInputAction: TextInputAction.next,
                                  obscureText: _hide,
                                  // obscuringCharacter: '_',
                                  // onChanged: (val) {
                                  //   ContactPageVal.password = val;
                                  // },
                                  onSaved: (val) {
                                    ContactPageVal.password = val ?? "";
                                  },
                                  validator: (val) => (val!.isEmpty)
                                      ? "Enter strong password"
                                      : null,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _hide = !_hide;
                                        });
                                      },
                                      icon: Icon(_hide
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                    ),
                                    prefixIcon: const Icon(Icons.password),
                                    labelText: "Password",
                                    hintText: "Enter password",
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade400,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                        color: Colors.green,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // log(ContactPageVal.name ?? "Name");
                                        // log(ContactPageVal.phoneNumber);
                                        // log(ContactPageVal.password);
                                        if (formKey.currentState!.validate()) {
                                          formKey.currentState!.save();
                                          // ContactPageVal.name = nameController.text;
                                          // String number =
                                          //     phoneNumnerController.text;
                                          // String password = passwordController.text;
                                          //
                                          // nameController.clear();
                                          // phoneNumnerController.clear();
                                          // passwordController.clear();
                                          //
                                          // log(ContactPageVal.name ?? "");
                                          // log(number);
                                          // log(password);
                                          log(ContactPageVal.name ?? "");
                                          log(ContactPageVal.phoneNumber);
                                          log(ContactPageVal.password);

                                          SnackBar snackBar = SnackBar(
                                            backgroundColor: Colors.green,
                                            // shape: OutlineInputBorder(
                                            //   borderRadius: BorderRadius.all(
                                            //     Radius.circular(20),
                                            //   ),
                                            // ),
                                            // shape: UnderlineInputBorder(
                                            //   borderRadius: BorderRadius.all(
                                            //     Radius.circular(20),
                                            //   ),
                                            // ),
                                            margin: const EdgeInsets.all(15),
                                            // width: 200,
                                            behavior: SnackBarBehavior.floating,
                                            duration:
                                                const Duration(seconds: 5),
                                            // padding: const EdgeInsets.all(30),
                                            elevation: 20,
                                            actionOverflowThreshold: 1,
                                            showCloseIcon: true,
                                            closeIconColor: Colors.white,
                                            action: SnackBarAction(
                                              label: "Back",
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                            dismissDirection:
                                                DismissDirection.horizontal,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            content: const Text(
                                                "Contact Data insert Successfully 👍"),
                                          );

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);

                                          setState(() {});
                                        }
                                      },
                                      child: const Text("SUBMIT"),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          formKey.currentState!.reset();
                                          nameController.clear();
                                          // ContactPageVal.name = "";
                                          // ContactPageVal.phoneNumber = "";
                                          // ContactPageVal.password = "";
                                        });
                                      },
                                      child: const Text("RESET"),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //ImagePage
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        height: 250,
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 70,
                              foregroundImage: (ContactPageVal.image != null)
                                  ? FileImage(ContactPageVal.image!)
                                  : null,
                              child: const Text(
                                "ADD",
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                        title: Text(
                                          "Image",
                                        ),
                                        content: Row(
                                          children: [
                                            ElevatedButton.icon(
                                              onPressed: () async {
                                                await imagePickWithCamera();
                                                Navigator.of(context).pop();
                                              },
                                              icon:
                                                  const Icon(Icons.camera_alt),
                                              label: const Text("Camera"),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            ElevatedButton.icon(
                                              onPressed: () async {
                                                await imagePickWithGallery();
                                                Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.photo),
                                              label: const Text("Gallery"),
                                            ),
                                          ],
                                        ));
                                  },
                                );
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.blueAccent,
                                child: Icon(
                                  Icons.camera,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
