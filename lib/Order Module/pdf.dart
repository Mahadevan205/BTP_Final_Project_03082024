
//import 'package:btb/Return%20Module/Return%20pdf.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';

// import 'package:your_project/Return%20Module/Return%20pdf.dart'; // Update this import path

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('PDF Downloader'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              downloadPdf();
            },
            child: Text('Download PDF'),
          ),
        ),
      ),
    );
  }

  Future downloadPdf() async {
    try {
      final Uint8List pdfBytes = await Returnpdf();

      final blob = html.Blob([pdfBytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute('download', 'invoice.pdf')
        ..click();

      html.Url.revokeObjectUrl(url);
    } catch (e) {
      print('Error generating PDF: $e');
    }
  }
}

Future<Uint8List> loadImage() async {
  final ByteData data = await rootBundle.load('images/Final-Ikyam-Logo.png');
  return data.buffer.asUint8List();
}




Future<Uint8List> Returnpdf() async {
  final pdf = pw.Document();

  final logoData = await loadImage();

  //final pdf = pw.Document();
  final image = pw.MemoryImage(logoData);

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
             //   pw.Image(logo, height: 50), // Company logo
                pw.Text(
                  'Invoice: INV_02276',
                  style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
                ),
                pw.Image(image, height: 20,),
              ],
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.end,
              children: [

                // pw.Text(
                //   'Order Id. 000001',
                //   style: pw.TextStyle(
                //     fontSize: 12,
                //     color: PdfColors.grey,
                //   ),
                // ),
              ],
            ),
            pw.SizedBox(height: 10),
            pw.Divider(thickness: 1),
            pw.SizedBox(height: 10),
            // Invoice Header
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    // pw.Text(
                    //   'Low Plumbing Heating',
                    //   style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
                    // ),
                    // pw.Text('1120 Hamilton Street'),
                    // pw.Text('Toledo OH 43607'),
                  ],
                ),
        //         pw.Column(
        //           crossAxisAlignment: pw.CrossAxisAlignment.end,
        //           children: [
        //             pw.Row(
        //               crossAxisAlignment: pw.CrossAxisAlignment.start,
        //               children: [
        //                 pw.Padding(
        //                   padding: pw.EdgeInsets.only(right: 115),
        //                   child:  pw.Text(
        //                     'Date:',
        //                     style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        //                   ),
        //                 ),
        //
        //                 // pw.SizedBox(width: 15),
        //                 // pw.Text('05-08-2024'),
        //
        //
        //               ],
        //             ),
        //             pw.SizedBox(height: 4),
        //             pw.Row(
        //               crossAxisAlignment: pw.CrossAxisAlignment.start,
        //               children: [
        //                 pw.Padding(
        //                   padding: pw.EdgeInsets.only(right: 24),
        //                   child: pw.Text(
        //                     'Invoice Number:',
        //                     style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        //                   ),
        //                 ),
        //                 //
        //                 // pw.SizedBox(width: 5),
        //                 //  pw.Text('1INV-32-2024'),
        //               ],
        //             ),
        //             pw.SizedBox(height: 4),
        //             pw.Row(
        //               crossAxisAlignment: pw.CrossAxisAlignment.start,
        //               children: [
        //                 pw.Padding(
        //                   padding: pw.EdgeInsets.only(right: 46),
        //                   child:  pw.Text(
        //                     'Sales Order Number:',
        //                     style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        //                   ),
        //                 ),
        //                 //
        //                 // pw.SizedBox(width: 15),
        //                 // pw.Text('5897'),
        //
        //               ],
        //             ),
        //             pw.SizedBox(height: 4),
        //             pw.Row(
        //               crossAxisAlignment: pw.CrossAxisAlignment.start,
        //               children: [
        // pw.Padding(
        // padding: pw.EdgeInsets.only(right: 44),
        //                child: pw.Text(
        //                   'Delivery Number:',
        //                   style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        //                 ),
        // ),
        //                 // pw.SizedBox(width: 45),
        //                 // pw.Text('685'),
        //
        //               ],
        //             ),
        //             pw.SizedBox(height: 4),
        //             pw.Row(
        //               crossAxisAlignment: pw.CrossAxisAlignment.start,
        //               children: [
        //                 pw.Text(
        //                   'Fulfillment Date:',
        //                   style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        //                 ),
        //                 // pw.SizedBox(width: 45),
        //                 // pw.Text('Apr 24, 2024'),
        //               ],
        //             ),
        //             pw.SizedBox(height: 4),
        //             pw.Row(
        //               crossAxisAlignment: pw.CrossAxisAlignment.start,
        //               children: [
        //                 pw.Padding(
        //                   padding: pw.EdgeInsets.only(right: 27),
        //                   child: pw.Text(
        //                     'Customer Number:',
        //                     style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        //                   ),
        //                 ),
        //                 //
        //                 // pw.SizedBox(width: 15),
        //                 // pw.Text('CP100130'),
        //               ],
        //             ),
        //           ],
        //         ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Padding(
                          padding: pw.EdgeInsets.only(right: 105),
                          child:  pw.Text(
                            'Date:',
                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          ),
                        ),
                        pw.SizedBox(width: 50),
                        pw.Text('Apr 4, 2024')

                      ],
                    ),
                    pw.SizedBox(height: 4),
                    pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
        pw.Padding(
                     padding: pw.EdgeInsets.only(right: 77),
                     child: pw.Text(
                       'Invoice Number:',
                       style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                     ),
                   ),


                        pw.SizedBox(width: 15),
                        pw.Text('INV_02276'),
                      ],
                    ),
                    pw.SizedBox(height: 4),
                    pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                      pw.Padding(
                                     padding: pw.EdgeInsets.only(right: 46),
                                     child:  pw.Text(
                                       'Sales Order Number:',
                                       style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                                     ),
                                   ),

                        pw.SizedBox(width: 15),
                        pw.Text('ORD_02276'),

                      ],
                    ),
                    pw.SizedBox(height: 4),
                    pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                         pw.Padding(
                         padding: pw.EdgeInsets.only(right: 69),
                                        child: pw.Text(
                                           'Delivery Number:',
                                           style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                                         ),
                         ),
                        pw.SizedBox(width: 45),
                        pw.Text('00001'),
                      ],
                    ),
                    pw.SizedBox(height: 4),
                    pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Padding(
                          padding: pw.EdgeInsets.only(right: 39),
                          child:  pw.Text(
                            'Fulfillment Date:',
                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          ),
                        ),

                        pw.SizedBox(width: 45),
                        pw.Text('Apr 24, 2024'),
                      ],
                    ),
                    pw.SizedBox(height: 4),
                    pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
        pw.Padding(
                        padding: pw.EdgeInsets.only(right: 67),
                        child: pw.Text(
                          'Customer Number:',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                        pw.SizedBox(width: 15),
                        pw.Text('CP100130'),
                      ],
                    ),
                  ],
                ),

              ],
            ),
            pw.SizedBox(height: 20),

            // Ship-to Address
            pw.Text(
              'Ship-to Address:',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            ),
            pw.Text('Ganeshram,'),
            pw.Text('Chennai 600002'),
            pw.SizedBox(height: 20),

            // Line Items
            pw.Table(
              border: pw.TableBorder.all(width: 1, color: PdfColors.grey),
              children: [
                pw.TableRow(
                  decoration: pw.BoxDecoration(color: PdfColors.grey300),
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text('S.NO', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text('Product Name', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text('Category', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    ),
                    pw.Padding(
                      padding: pw.EdgeInsets.only(top: 5,),
                      child: pw.Center(
                        child:  pw.Text('Qty', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      ),
                    ),
                    pw.Padding(
                      padding: pw.EdgeInsets.only(top: 5,),
                      child: pw.Center(
                        child:  pw.Text('Price', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text('Total Amount', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    ),
                  ],
                ),
                pw.TableRow(
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text('1'),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text('Xerox 220'),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text('A07958'),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text('1 Each'),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text('6,964.43 INR / 1 Each'),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text('6,964.43 INR'),
                    ),
                  ],
                ),
                pw.TableRow(
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text('2'),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text('Laptop'),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text('A08055'),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text('1 Each'),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text('6,961.04 INR / 1 Each'),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text('6,961.04 INR'),
                    ),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 20),

            // Totals
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.end,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('Total Item Gross Value: 13,199.5 INR'),
                    pw.Text('GST: 725.97 INR'),
                    pw.Text('Gross Total: 13,925.47 INR'),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 20),

            // Footer
            // pw.Row(
            //   mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            //   children: [
            //     pw.Text('Incoterms: Ex works, Cleveland'),
            //     pw.Text('Payment Terms: 20 days net'),
            //   ],
            // ),
            pw.SizedBox(height: 180),

            // Company Information
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.SizedBox(height: 10),
                    pw.Row(
                      children: [
                        pw.Text(
                          'Registered Office:',style: pw.TextStyle(fontWeight: pw.FontWeight.bold),

                        ),
                        pw.SizedBox(width: 5),
                        pw.Text(
                            ' Ikyam Solution pvt. Ltd..,'
                        ),
                      ]
                    ),
              pw.SizedBox(height: 10),
                    pw.Row(
                        children: [
                          pw.Text(
                            'Address:',style: pw.TextStyle(fontWeight: pw.FontWeight.bold),

                          ),
                          pw.SizedBox(width: 5),
                          pw.Text(
                            '4th Block, New Friends Colony,\n'
                                // 'Koramangala, Bengaluru,\n'
                                // 'Karnataka 560034.',
                          ),


                        ]
                    ),
                    pw.Row(
                        children: [
                          pw.SizedBox(height: 5),
                          pw.Padding(
                            padding: pw.EdgeInsets.only(left: 60,),
                            child: pw.Text(
                                'Koramangala, Bengaluru,\n'
                              // 'Karnataka 560034.',
                            ),
                          ),


                        ]
                    ),
                    pw.Row(
                        children: [
                          pw.SizedBox(height: 5),
                          pw.Padding(
                            padding: pw.EdgeInsets.only(left: 60,),
                            child:  pw.Text(

                              'Karnataka 560034.',
                            ),
                          ),

                        ]
                    ),
        //             pw.Row(
        //               children: [
        // pw.Text(
        //   'Address:',style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        // ),
        //                 pw.SizedBox(width: 5,),
        //                 pw.Text(
        //                   '4th Block, New Friends Colony,\n'
        //                       'Koramangala, Bengaluru,\n'
        //                       'Karnataka 560034.',
        //                 ),
        //               ]
        //             ),


                    pw.SizedBox(height: 5),
                    pw.Row(
                        children: [
                          pw.Text(
                            'Contact:',style: pw.TextStyle(fontWeight: pw.FontWeight.bold),

                          ),
                          pw.SizedBox(width: 5),
                          pw.Text(
                              'Ikyam.com'
                          ),
                        ]
                    ),
                    //
                    // pw.SizedBox(height: 5),
                    // pw.Text(
                    //   'Address:',style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    // ),
                    // pw.SizedBox(width: 5),
                    // pw.Text(
                    //         ' 4th Block, New Friends Colony,\n'
                    // ),
                    // pw.Text('Karnataka 560034.'),
                    // pw.Text('Koramangala, Bengaluru,'),
                    // pw.SizedBox(height: 5),
                    // pw.Text('Contact:',style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    // ),
                    // pw.SizedBox(width: 5),
                    // pw.Text(
                    //     ' Ikyam@.com.'),
                  ],
                ),
              ],
            ),
            // pw.Row(
            //   mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            //   children: [
            //     pw.Text('Almika Inc.'),
            //   //  pw.Text('Registered Office: Columbus, Ohio, USA'),
            //   ],
            // ),
            // pw.Text('41 Edgewater Drive,'),
            // pw.Text('Cleveland OH 44124,'),
            // pw.Text('United States'),
           // pw.Text('CEO: Catherine Kennedy-Woods'),
          ],
        );
      },
    ),
  );

  return pdf.save();

  // final pdf = pw.Document();
  //
  // // final ByteData bytes = await rootBundle.load('assets/images/Final-Ikyam-Logo.png');
  // // final Uint8List logoBytes = bytes.buffer.asUint8List();
  // // final logo = pw.MemoryImage(logoBytes);
  //
  // // Define the company logo
  // // final logo = pw.MemoryImage(
  // //   File('images/Final-Ikyam-Logo.png').readAsBytesSync(),
  // // );
  //
  // // Define the invoice content
  // pdf.addPage(
  //   pw.Page(
  //     pageFormat: PdfPageFormat.a4,
  //     build: (pw.Context context) {
  //       return pw.Column(
  //         children: [
  //           pw.Row(
  //             mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
  //             children: [
  //               //  pw.Image(logo, height: 50),
  //               pw.Text(
  //                 'NO. 000001',
  //                 style: pw.TextStyle(
  //                   fontSize: 12,
  //                   color: PdfColors.grey,
  //                 ),
  //               ),
  //             ],
  //           ),
  //           pw.SizedBox(height: 20),
  //           pw.Text(
  //             'INVOICE',
  //             style: pw.TextStyle(
  //               fontSize: 32,
  //               fontWeight: pw.FontWeight.bold,
  //             ),
  //           ),
  //           pw.SizedBox(height: 20),
  //           pw.Text(
  //             'Date: 02 June, 2024',
  //             style: pw.TextStyle(
  //               fontSize: 12,
  //               color: PdfColors.grey,
  //             ),
  //           ),
  //           pw.SizedBox(height: 20),
  //           pw.Row(
  //             mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
  //             children: [
  //               pw.Column(
  //                 crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                 children: [
  //                   pw.Text(
  //                     'Billed to:',
  //                     style: pw.TextStyle(
  //                       fontWeight: pw.FontWeight.bold,
  //                     ),
  //                   ),
  //                   pw.Text('Studio Shodwe'),
  //                   pw.Text('123 Anywhere St., Any City'),
  //                   pw.Text('hello@reallygreatsite.com'),
  //                 ],
  //               ),
  //               pw.Column(
  //                 crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                 children: [
  //                   pw.Text(
  //                     'From:',
  //                     style: pw.TextStyle(
  //                       fontWeight: pw.FontWeight.bold,
  //                     ),
  //                   ),
  //                   pw.Text('Olivia Wilson'),
  //                   pw.Text('123 Anywhere St., Any City'),
  //                   pw.Text('hello@reallygreatsite.com'),
  //                 ],
  //               ),
  //             ],
  //           ),
  //           pw.SizedBox(height: 20),
  //           pw.Container(
  //             width: 900,
  //             decoration:  pw.BoxDecoration(
  //               border: pw.Border.all(color: PdfColors.grey),
  //             ),
  //             child: pw.Padding(
  //               padding:  pw.EdgeInsets.only(top: 5, bottom: 5),
  //             )
  //
  //           ),
  //           pw.Table(
  //             border: pw.TableBorder.all(
  //               width: 1,
  //               color: PdfColors.grey,
  //             ),
  //             children: [
  //               pw.TableRow(
  //                 children: [
  //                   pw.Text(
  //                     'Item',
  //                     style: pw.TextStyle(
  //                       fontWeight: pw.FontWeight.bold,
  //                     ),
  //                   ),
  //                   pw.Text(
  //                     'Quantity',
  //                     style: pw.TextStyle(
  //                       fontWeight: pw.FontWeight.bold,
  //                     ),
  //                   ),
  //                   pw.Text(
  //                     'Price',
  //                     style: pw.TextStyle(
  //                       fontWeight: pw.FontWeight.bold,
  //                     ),
  //                   ),
  //                   pw.Text(
  //                     'Amount',
  //                     style: pw.TextStyle(
  //                       fontWeight: pw.FontWeight.bold,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               pw.TableRow(
  //                 children: [
  //                   pw.Text('Logo'),
  //                   pw.Text('1'),
  //                   pw.Text('\₹500'),
  //                   pw.Text('\$500'),
  //                 ],
  //               ),
  //               pw.TableRow(
  //                 children: [
  //                   pw.Text('Banner (2x6m)'),
  //                   pw.Text('2'),
  //                   pw.Text('\$45'),
  //                   pw.Text('\$90'),
  //                 ],
  //               ),
  //               pw.TableRow(
  //                 children: [
  //                   pw.Text('Poster (1x2m)'),
  //                   pw.Text('3'),
  //                   pw.Text('\$55'),
  //                   pw.Text('\$165'),
  //                 ],
  //               ),
  //             ],
  //           ),
  //           pw.SizedBox(height: 20),
  //           pw.Row(
  //             mainAxisAlignment: pw.MainAxisAlignment.end,
  //             children: [
  //               pw.Text(
  //                 'Total',
  //                 style: pw.TextStyle(
  //                   fontWeight: pw.FontWeight.bold,
  //                 ),
  //               ),
  //               pw.SizedBox(width: 20),
  //               pw.Text(
  //                 '\$755',
  //                 style: pw.TextStyle(
  //                   fontWeight: pw.FontWeight.bold,
  //                 ),
  //               ),
  //             ],
  //           ),
  //           pw.SizedBox(height: 20),
  //           // pw.Text(
  //           //   'Payment method: Cash',
  //           //   style: pw.TextStyle(
  //           //     fontSize: 12,
  //           //     color: PdfColors.grey,
  //           //   ),
  //           // ),
  //           // pw.SizedBox(height: 20),
  //           // pw.Text(
  //           //   'Note: Thank you for choosing us!',
  //           //   style: pw.TextStyle(
  //           //     fontSize: 12,
  //           //     color: PdfColors.grey,
  //           //   ),
  //           // ),
  //           pw.SizedBox(height: 32),
  //           // pw.Container(
  //           //   height: 100,
  //           //   decoration: pw.BoxDecoration(
  //           //     color: PdfColors.grey300,
  //           //     borderRadius: pw.BorderRadius.only(
  //           //       topLeft: pw.Radius.circular(100),
  //           //       topRight: pw.Radius.circular(100),
  //           //     ),
  //           //   ),
  //           // ),
  //           // pw.Container(
  //           //   height: 200,
  //           //   decoration: pw.BoxDecoration(
  //           //     color: PdfColors.grey700,
  //           //     borderRadius: pw.BorderRadius.only(
  //           //       bottomLeft: pw.Radius.circular(100),
  //           //       bottomRight: pw.Radius.circular(100),
  //           //     ),
  //           //   ),
  //           // ),
  //         ],
  //       );
  //     },
  //   ),
  // );
  //
  // return pdf.save();

}









