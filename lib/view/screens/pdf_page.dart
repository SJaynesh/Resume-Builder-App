import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PDFPage extends StatefulWidget {
  const PDFPage({super.key});

  @override
  State<PDFPage> createState() => _PDFPageState();
}

class _PDFPageState extends State<PDFPage> {
  Future<Uint8List> pdfView() async {
    pw.Document pdf = pw.Document();

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
                left: 20,
                child: pw.Container(
                  height: 728,
                  width: 200,
                  color: const PdfColor.fromInt(0xffb39e9f),
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
