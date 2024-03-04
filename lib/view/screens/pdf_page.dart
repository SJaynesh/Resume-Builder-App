import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:resume_builder_app/utils/contact_page/contact_page_values.dart';
import 'package:resume_builder_app/view/screens/contact_info.dart';

class PDFPage extends StatefulWidget {
  const PDFPage({super.key});

  @override
  State<PDFPage> createState() => _PDFPageState();
}

class _PDFPageState extends State<PDFPage> {
  Future<Uint8List> pdfView() async {
    pw.Document pdf = pw.Document();

    var netWorkImage = await networkImage(
        "https://e7.pngegg.com/pngimages/906/448/png-clipart-silhouette-person-person-with-helmut-animals-logo-thumbnail.png");

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          // return pw.Center(
          //   child: pw.Text(
          //     "Hello Resume App",
          //     style: pw.TextStyle(
          //       fontSize: 35,
          //       fontWeight: pw.FontWeight.bold,
          //       font: pw.Font.timesBold(),
          //     ),
          //   ),
          // );
          return pw.Stack(
            children: [
              pw.Container(
                height: double.infinity,
                width: double.infinity,
                color: const PdfColor.fromInt(0xffFFFFFF),
              ),
              pw.Container(
                height: 200,
                width: double.infinity,
                color: const PdfColor.fromInt(0xffddd0d1),
              ),
              pw.Positioned(
                left: 15,
                child: pw.Container(
                  height: 728,
                  width: 200,
                  color: const PdfColor.fromInt(0xffb39e9f),
                  child: pw.Column(
                    children: [
                      pw.Container(
                        height: 160,
                        width: 160,
                        margin: const pw.EdgeInsets.only(
                          top: 20,
                        ),
                        decoration: const pw.BoxDecoration(
                          color: PdfColors.white,
                          shape: pw.BoxShape.circle,
                        ),
                        alignment: pw.Alignment.center,
                        child: pw.Container(
                          height: 150,
                          width: 150,
                          decoration: pw.BoxDecoration(
                            color: PdfColors.grey,
                            shape: pw.BoxShape.circle,
                            image: pw.DecorationImage(
                              image: (ContactPageVal.image != null)
                                  ? pw.MemoryImage(
                                      ContactPageVal.image!.readAsBytesSync(),
                                    )
                                  : netWorkImage,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
    return await pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "RESUME",
        ),
      ),
      body: PdfPreview(
        pdfFileName: "Jenish Resume.pdf",
        build: (format) => pdfView(),
      ),
    );
  }
}
