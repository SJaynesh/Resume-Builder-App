import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:printing/printing.dart';
import 'package:resume_builder_app/utils/resume_atributes.dart';
import 'package:resume_builder_app/utils/routes.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> pdfView() async {
    pw.Document pdf = pw.Document(); // ClassName objName = ClassName();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text(
              "Hello World",
              style: pw.TextStyle(
                fontSize: 80,
                color: PdfColors.blue,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
    Uint8List data = await pdf.save();
    Printing.layoutPdf(
      onLayout: (format) => data,
    );
  }

  @override
  Widget build(BuildContext context) {
    TextScaler textScaler = MediaQuery.of(context).textScaler;
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff6054C1),
        body: Column(
          children: [
            Expanded(
              child: Container(
                  width: w,
                  color: const Color(0xff6054C1),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            "Resume Builder",
                            style: TextStyle(
                              fontSize: textScaler.scale(25),
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // pdfView();
                          log("PDF Clicked");
                          Navigator.of(context).pushNamed(Routes.pdfPage);
                        },
                        icon: const Icon(
                          Icons.picture_as_pdf,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )),
            ),
            Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(w * 0.1),
                    topRight: Radius.circular(w * 0.1),
                  ),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(
                        "${imagePath}box.png",
                      ),
                      height: h * 0.08,
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    Text(
                      "No Resume + Please create a new Resume",
                      style: TextStyle(
                        fontSize: textScaler.scale(18),
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.build_page);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
