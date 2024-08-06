
//import 'package:btb/Return%20Module/Return%20pdf.dart';
import 'dart:convert';
import 'dart:html';

import 'package:btb/widgets/productclass.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:http/http.dart' as http;
import 'dart:io';

import 'firstpage.dart';


// import 'package:your_project/Return%20Module/Return%20pdf.dart'; // Update this import path

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late  final discount = 0;
  @override
  Widget build(BuildContext context) {
    String discount;
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

  Future<List<dynamic>> _fetchAllProductMaster() async {
    final String token = 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJkaGFuYXNla2FyIiwiUm9sZXMiOlt7ImF1dGhvcml0eSI6ImRldmVsb3BlciJ9XSwiZXhwIjoxNzIyOTUyOTI0LCJpYXQiOjE3MjI5NDU3MjR9.3-TXltmekKZO5FmGluZx1_39OmNH_Ktqp-RSXieOuFKVyGvvPC55x-QbIqc1FZyVs7qz9S01T7CTAHtWLNCYAg';
    try {
      final response = await http.get(
        Uri.parse('https://mjl9lz64l7.execute-api.ap-south-1.amazonaws.com/stage1/api/productmaster/get_all_productmaster'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Product Master Data:');
        print(data);
        // print('discount');
        // print(data['discount']);
        return data;
      } else {
        print('Failed to fetch product master data.');
        return [];
      }
    } catch (e) {
      print('Error fetching product master data: $e');
      return [];
    }
  }

  Future downloadPdf() async {
    final String orderId = 'ORD_02282';
    try {
      final  productMasterData = await _fetchAllProductMaster();
      final orderDetails = await _fetchOrderDetails(orderId);
      for (var product in productMasterData) {
        print('Product: ${product['productName']}, Discount: ${product['discount']}');
        for(var item in orderDetails!.items){
          if(product['productName'] == item['productName']){
            print('true');
            print(product['discount']);
            print(product['tax']);
            item['tax'] =product['tax'];
            item['discount'] =  product['discount'];
            print(item['tax']);

           print(item['discount']);
          }
        }
      }
      //List <Product>ProductList =productMasterData;
      // print('hellooo');
      // print(ProductList);
      // print('check');
      // print(ProductList['discount' as int]);



      if (orderDetails != null) {
        for (var item in orderDetails.items) {
         // final discountElement = productMasterData.firstWhere((element) =>
          // element.productName == item.productName &&
          //     element['category'] == item.category &&
          //     element['subCategory'] == item.subCategory &&
          //     element['price'] == item.price,
          //     orElse: () => null);
         // print('discount');
         // print(discountElement);
          final Uint8List pdfBytes = await Returnpdf(orderDetails);
          final blob = html.Blob([pdfBytes]);
          final url = html.Url.createObjectUrlFromBlob(blob);
          final anchor = html.AnchorElement(href: url)
            ..setAttribute('download', 'invoice.pdf')
            ..click();
          html.Url.revokeObjectUrl(url);
          // if (discountElement != null) {
          //   print('Discount Element:');
          // //  print(discountElement);
          // //  final discount = discountElement['discount'];
          //
          // } else {
          //   print('No matching product found in product master data.');
          // }
        }
      } else {
        print('Failed to fetch order details.');
      }
    } catch (e) {
      print('Error generating PDF: $e');
    }
  }
}

Future<Uint8List> loadImage() async {
  final ByteData data = await rootBundle.load('images/Final-Ikyam-Logo.png');
  return data.buffer.asUint8List();
}


Future<OrderDetail?> _fetchOrderDetails(String orderId) async {
  String token = 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJkaGFuYXNla2FyIiwiUm9sZXMiOlt7ImF1dGhvcml0eSI6ImRldmVsb3BlciJ9XSwiZXhwIjoxNzIyOTUyOTI0LCJpYXQiOjE3MjI5NDU3MjR9.3-TXltmekKZO5FmGluZx1_39OmNH_Ktqp-RSXieOuFKVyGvvPC55x-QbIqc1FZyVs7qz9S01T7CTAHtWLNCYAg';
  try {
    final url = 'https://mjl9lz64l7.execute-api.ap-south-1.amazonaws.com/stage1/api/order_master/search_by_orderid/$orderId';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final responseBody = response.body;
      print('onTap');
      print(responseBody);
      if (responseBody != null) {
        final jsonData = jsonDecode(responseBody);
        if (jsonData is List<dynamic>) {
          final jsonObject = jsonData.first;
          return OrderDetail.fromJson(jsonObject);
        } else {
          print('Failed to load order details');
        }
      } else {
        print('Failed to load order details');
      }
    } else {
      print('Failed to load order details');
    }
  } catch (e) {
    print('Error: $e');
  }
  return null;
}


Future<Uint8List> Returnpdf(OrderDetail orderDetails) async {
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
                pw.SizedBox(width: 10,),
                pw.Image(image, height: 20,),
              ],
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.end,
              children: [

              ],
            ),
            pw.SizedBox(height: 10),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: [
                pw.Container(
                  height: 5,
                  width: 250,
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(color:  PdfColors.grey),
                    // borderRadius: pw.BorderRadius.circular(3.5), // Set border radius here
                  ),
                ),
               // pw.SizedBox(width: 300,),
                pw.Container(
                  height: 5,
                  width: 250,
                  decoration: pw.BoxDecoration(
                    color: PdfColors.grey200,
                    border: pw.Border.all(color:  PdfColors.grey),
                    //  borderRadius: pw.BorderRadius.circular(3.5), // Set border radius here
                  ),
                ),
              ]
            ),
            pw.SizedBox(height: 10),
            // Invoice Header
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Low Plumbing Heating',
                      style: pw.TextStyle(),
                    ),
                    pw.Text('1120 Hamilton Street'),
                    pw.Text('Toledo OH 43607'),
                  ],
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.only(top: 50),
      child:  pw.Column(
        // mainAxisAlignment: pw.MainAxisAlignment.end,
        // crossAxisAlignment: pw.CrossAxisAlignment.end,
        children: [

        pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
        pw.Padding(
        padding: pw.EdgeInsets.only(right: 100),
        child:  pw.Text(
        'Date:',
        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        ),
        ),
        pw.SizedBox(width: 48),
        pw.Text('          ${orderDetails.orderDate}')

        ],
        ),
        //pw.SizedBox(height: 4),
        // pw.Row(
        // crossAxisAlignment: pw.CrossAxisAlignment.start,
        // children: [
        // pw.Padding(
        // padding: pw.EdgeInsets.only(right: 77),
        // child: pw.Text(
        // 'Invoice Number:',
        // style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        // ),
        // ),
        //
        //
        // pw.SizedBox(width: 15),
        // pw.Text('INV_02276'),
        // ],
        // ),
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
        pw.Text('   ${orderDetails.orderId}'),

        ],
        ),
        pw.SizedBox(height: 4),
        pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
        pw.Padding(
        padding: pw.EdgeInsets.only(right: 71),
        child: pw.Text(
        'Delivery Number:',
        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        ),
        ),
        pw.SizedBox(width: 45),
        pw.Text('   00001'),
        ],
        ),
        pw.SizedBox(height: 4),
        pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
        pw.Padding(
        padding: pw.EdgeInsets.only(right: 62),
        child:  pw.Text(
        'Fulfillment Date:',
        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        ),
        ),

        pw.SizedBox(width: 45),
        pw.Text('   ${orderDetails.orderDate}'),
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
        pw.Text('${orderDetails.contactNumber}'),
        ],
        ),
        ],
        ),
                )
              ],
            ),
            pw.SizedBox(height: 20),

            // Ship-to Address
            pw.Text(
              'Ship-to Address:',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            ),
            pw.Text('${orderDetails.deliveryAddress}'),
            //pw.Text('Chennai 600002'),
            pw.SizedBox(height: 20),
        ...orderDetails.items.map((item) {
          print('print');
          print(item);

        return  pw.Container(
          decoration: pw.BoxDecoration(
              border: pw.Border.all()
          ),

          child: pw.Column(
            crossAxisAlignment:pw.CrossAxisAlignment.start,
            children: [

              pw.Table(
                border: pw.TableBorder.all(color: PdfColors.grey),
                columnWidths: const {
                  0: pw.FlexColumnWidth(0.6),
                  1: pw.FlexColumnWidth(1.2),
                  2: pw.FlexColumnWidth(1),
                  3: pw.FlexColumnWidth(0.6),
                  4: pw.FlexColumnWidth(1),
                  5: pw.FlexColumnWidth(1),
                },
                children: [
                  // ...orderDetails.items.map((item) {
                  pw.TableRow(
                    decoration: pw.BoxDecoration(color: PdfColors.grey200),
                    children: [
                      buildCell1('Line'),
                      buildCell1('Product'),
                      buildCell1('Description'),
                      buildCell1('QTY'),
                      buildCell1('Gross Price'),
                      buildCell1('Gross Value'),
                    ],
                  ),
                ],
              ),
              pw.Table(
                  border: pw.TableBorder.all(color: PdfColors.grey),
                  columnWidths: const {
                    0: pw.FlexColumnWidth(0.6),
                    1: pw.FlexColumnWidth(1.2),
                    2: pw.FlexColumnWidth(1),
                    3: pw.FlexColumnWidth(0.6),
                    4: pw.FlexColumnWidth(1),
                    5: pw.FlexColumnWidth(1),
                  },
                  children: [

              pw.TableRow(
              children: [
              buildCell('+10'),
              buildCell(item['productName']),
              buildCell(item['category']),
              buildCell(item['qty'].toString()),
              buildCell(item['price'].toString()),
              buildCell(item['totalAmount'].toString()),
            ],
          ),
          ],
        ),



          // pw.Table(
          //   border: pw.TableBorder.all(color: PdfColors.grey),
          //   columnWidths: const {
          //     0: pw.FlexColumnWidth(0.6),
          //     1: pw.FlexColumnWidth(1.2),
          //     2: pw.FlexColumnWidth(1),
          //     3: pw.FlexColumnWidth(0.6),
          //     4: pw.FlexColumnWidth(1),
          //     5: pw.FlexColumnWidth(1),
          //   },
          //   children: [
          //     pw.TableRow(
          //       decoration: pw.BoxDecoration(color: PdfColors.grey200),
          //       children: [
          //         buildCell1('Line'),
          //         buildCell1('Product'),
          //         buildCell1('Description'),
          //         buildCell1('QTY'),
          //         buildCell1('Gross Price'),
          //         buildCell1('Gross Value'),
          //       ],
          //     ),
          //     pw.TableRow(
          //       children: [
          //         buildCell('20'),
          //         buildCell(' A00162'),
          //         buildCell('Laptop'),
          //         buildCell('1 Each'),
          //         buildCell('14,691.83 INR / 1 Each'),
          //         buildCell('14,691.83 INR'),
          //       ],
          //     ),
          //   ],
          // ),

          pw.Padding(
          padding: pw.EdgeInsets.only(left:55,right: 20,top: 5),
          child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
          pw.Text('Gross Actual Price:',style: pw.TextStyle(fontSize: 10)),
          //izedBox(width: 50,),
          pw.Text('${item['totalAmount']} INR / 1 Each',style: pw.TextStyle(fontSize: 10)),
          pw.Text('${item['totalAmount']} INR',style: pw.TextStyle(fontSize:10)),

          // Text('Gross Discount (%): -21.00 %'),
          // Text('State sales tax (%): 5.50 %'),
          // if (salesOrderNumber.isNotEmpty)
          //   Text('Sales Order Number: $salesOrderNumber'),
          // Text('No cash discount allowed'),
          ],
          ),
          ),
          pw.Padding(
          padding: pw.EdgeInsets.only(left:55,right: 20 ),
          child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
          pw.Text('Gross Discount (%):',style: pw.TextStyle(fontSize: 10)),
          //izedBox(width: 50,),
          pw.Text('${item['discount']}',style: pw.TextStyle(fontSize: 10)),
       //  pw.Text('-${item['totalAmount'] - item['discount'] * 100}',style: pw.TextStyle(fontSize: 10)),

          // Text('Gross Discount (%): -21.00 %'),
          // Text('State sales tax (%): 5.50 %'),
          // if (salesOrderNumber.isNotEmpty)
          //   Text('Sales Order Number: $salesOrderNumber'),
          // Text('No cash discount allowed'),
          ],
          ),
          ),
          pw.Padding(
          padding: pw.EdgeInsets.only(left:55,right: 20 ),
          child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
          pw. Text('State sales tax (%)',style: pw.TextStyle(fontSize: 10)),
          //izedBox(width: 50,),
          pw.Text('${item['tax']}',style: pw.TextStyle(fontSize: 10)),
         // pw.Text('${(item['totalAmount'] * item['tax'] )/ 100}',style: pw.TextStyle(fontSize: 10)),

          // Text('Gross Discount (%): -21.00 %'),
          // Text('State sales tax (%): 5.50 %'),
          // if (salesOrderNumber.isNotEmpty)
          //   Text('Sales Order Number: $salesOrderNumber'),
          // Text('No cash discount allowed'),
          ],
          ),
          ),
          pw.Padding(
          padding: pw.EdgeInsets.only(left:55,bottom: 5),
          child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
          pw.Text('No cash discount allowed',style: pw.TextStyle(fontSize: 10)),
          // pw.Text('                                                                                                                 '),
          ],
          ),
          ),
          ]
          ),
          );
        },),

            pw.SizedBox(height: 20),

            // Totals
            pw.Padding(padding: pw.EdgeInsets.only(left: 250,right: 50),
              child:pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(mainAxisAlignment: pw.MainAxisAlignment.end,
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        children: [
                          pw.Text('Total Item Gross Value:'),
                          pw.Text('     ${orderDetails.total} INR'),
                        ],
                      ),
                      pw.SizedBox(height: 5), // add a gap of 10 units
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        children: [
                          pw.Text('GST:'),
                          pw.Text('       1634.97 INR'),
                        ],
                      ),
                      pw.SizedBox(height: 5), // add a gap of 10 units
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        children: [

                          pw.Text('Gross Total:'),
                          pw.Text('       ${orderDetails.total} INR'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            pw.SizedBox(height: 25),
            //pw.SizedBox(height: 180),

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
                            'Ikyam Solution pvt. Ltd..,'
                        ),
                        // pw.Text(
                        //   'Registered Office:',style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        //
                        // ),
                      //  pw.SizedBox(width: 5),

                      ]
                    ),
            //  pw.SizedBox(height: 10),
                    pw.Row(
                        children: [
                          // pw.Text(
                          //   'Address:',style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          //
                          // ),
                         // pw.SizedBox(width: 5),
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
                          pw.Text(
                              'Koramangala, Bengaluru,\n'
                            // 'Karnataka 560034.',
                          ),


                        ]
                    ),
                    pw.Row(
                        children: [
                          pw.SizedBox(height: 5),
                          pw.Text(

                            'Karnataka 560034.',
                          ),

                        ]
                    ),
                    pw.SizedBox(height: 5),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    ),
  );

  return pdf.save();
}












pw.Widget buildCell1(String text) {
  return pw.Padding(
    padding: pw.EdgeInsets.all(8.0),
    child: pw.Text(text, style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold)),
  );
}

pw.Widget buildCell(String text) {
  return pw.Padding(
    padding: pw.EdgeInsets.all(8.0),
    child: pw.Text(text, style: pw.TextStyle(fontSize: 10)),
  );
}





