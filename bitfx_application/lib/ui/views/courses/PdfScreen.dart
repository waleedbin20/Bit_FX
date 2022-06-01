// import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import '../../colors/button_color.dart';

// class PdfScreen extends StatefulWidget {
//   const PdfScreen({ Key? key }) : super(key: key);

//   @override
//   State<PdfScreen> createState() => _PdfScreenState();
// }

// class _PdfScreenState extends State<PdfScreen> {

//  bool _isLoading = true;
//  late PDFDocument document;

//   @override
//   void initState() {
//     super.initState();
//     loadDocument();
//   }

//   loadDocument() async {
//     document = await PDFDocument.fromAsset('assets/pdf/Bitfx.pdf');

//     setState(() => _isLoading = false);
//   }

//   changePDF(value) async {
//     setState(() => _isLoading = true);
//     if (value == 1) {
//       document = await PDFDocument.fromAsset('assets/pdf/Bitfx.pdf');
//     } 
//      else {
//       document = await PDFDocument.fromAsset('assets/pdf/Bitfx.pdf');
//     }
//     setState(() => _isLoading = false);
//     Navigator.pop(context);
//   }



//   @override
//   Widget build(BuildContext context) {
//    return Scaffold(
//    appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: mainCyan,
//         title: Text(
//           "BITFX Course 2.0",
//           style: TextStyle(
//               color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: _isLoading
//             ? Center(child: CircularProgressIndicator())
//             : PDFViewer(
//                 document: document,
//                 zoomSteps: 1)));
//   }
// }

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';



class PdfScreen extends StatefulWidget {
  @override
  _PdfScreenState createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
 final sampleUrl = 'http://www.africau.edu/images/default/sample.pdf';

  String? pdfFlePath;

  Future<String> downloadAndSavePdf() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/sample.pdf');
    if (await file.exists()) {
      return file.path;
    }
    final response = await http.get(Uri.parse(sampleUrl));
    await file.writeAsBytes(response.bodyBytes);
    return file.path;
  }

  void loadPdf() async {
    pdfFlePath = await downloadAndSavePdf();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text('Plugin example app'),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                ElevatedButton(
                  child: Text("Load pdf"),
                  onPressed: loadPdf,
                ),
                if (pdfFlePath != null)
                  Expanded(
                    child: Container(
                      child: PdfView(path: pdfFlePath!),
                    ),
                  )
                else
                  Text("Pdf is not Loaded"),
              ],
            ),
          ),
        );
      }),
    );
  }
}