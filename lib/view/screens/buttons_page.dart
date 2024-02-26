import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Buttons",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Elevated Button",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            Theme(
              data: ThemeData(
                useMaterial3: false,
              ),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Elevate"),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey),
                side: MaterialStateProperty.all(
                  const BorderSide(
                    color: Colors.blue,
                    width: 3,
                  ),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                // padding: MaterialStateProperty.all(
                //   EdgeInsets.all(20),
                // )
                // foregroundColor: MaterialStateProperty.all(Colors.red),
              ),
              onPressed: () {},
              child: const Text(
                "Elevate Button",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt),
              label: const Text("Search"),
            ),
            Text(
              "Outlined Button",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                // backgroundColor: MaterialStateProperty.all(Colors.indigo)
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              child: const Text("Outline"),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("Add"),
            ),
            Text(
              "Text Button",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text("Home"),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.home_filled),
              label: Text("Home"),
            ),
            Text(
              "Icon Button",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            IconButton.filled(
              onPressed: () {},
              // color: Colors.black,
              // style: ButtonStyle(
              //   backgroundColor: MaterialStateProperty.all(Colors.red),
              // ),
              icon: Icon(Icons.arrow_back_ios),
            ),
            IconButton.filledTonal(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
            ),
            IconButton.outlined(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
            ),
            Text(
              "Floating Action Button",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
