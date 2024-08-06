// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Table Example'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               buildTableRow(
//                 line: '10',
//                 product: 'A00161',
//                 description: 'Xerox 1924',
//                 quantity: '1 Each',
//                 grossPrice: '7,751.83 USD / 1 Each',
//                 grossValue: '7,751.83 USD',
//                 salesOrderNumber: '',
//               ),
//               buildTableRow(
//                 line: '20',
//                 product: 'A00161',
//                 description: 'Xerox 1924',
//                 quantity: '1 Each',
//                 grossPrice: '7,751.83 USD / 1 Each',
//                 grossValue: '7,751.83 USD',
//                 salesOrderNumber: '5911 / 10',
//               ),
//               buildTableRow(
//                 line: '30',
//                 product: 'A00161',
//                 description: 'Xerox 1924',
//                 quantity: '1 Each',
//                 grossPrice: '7,751.83 USD / 1 Each',
//                 grossValue: '7,751.83 USD',
//                 salesOrderNumber: '5912 / 10',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildTableRow({
//     required String line,
//     required String product,
//     required String description,
//     required String quantity,
//     required String grossPrice,
//     required String grossValue,
//     required String salesOrderNumber,
//   }) {
//     return
//       Padding(
//       padding: const EdgeInsets.only(left: 100,right: 100),
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all()
//         ),
//
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Table(
//               border: TableBorder.all(color: Colors.grey[400]!),
//               columnWidths: const {
//                 0: FlexColumnWidth(0.4),
//                 1: FlexColumnWidth(1),
//                 2: FlexColumnWidth(1),
//                 3: FlexColumnWidth(1),
//                 4: FlexColumnWidth(1),
//                 5: FlexColumnWidth(1),
//               },
//               children: [
//                 TableRow(
//                   decoration: BoxDecoration(color: Colors.grey[300]!),
//                   children: [
//                     buildCell('Line'),
//                     buildCell('Product'),
//                     buildCell('Description'),
//                     buildCell('Quantity'),
//                     buildCell('Gross Price'),
//                     buildCell('Gross Value'),
//                   ],
//                 ),
//                 TableRow(
//
//                   children: [
//                     buildCell(line),
//                     buildCell(product),
//                     buildCell(description),
//                     buildCell(quantity),
//                     buildCell(grossPrice),
//                     buildCell(grossValue),
//                   ],
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Text('Gross List Price:'),
//                //izedBox(width: 50,),
//                 Text('9,812.44 USD / 1 Each'),
//                 Text('9,812.44 USD'),
//
//                  // Text('Gross Discount (%): -21.00 %'),
//                 // Text('State sales tax (%): 5.50 %'),
//                 // if (salesOrderNumber.isNotEmpty)
//                 //   Text('Sales Order Number: $salesOrderNumber'),
//                 // Text('No cash discount allowed'),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Text('Gross Discount (%):'),
//                 //izedBox(width: 50,),
//                 Text('                   -21.00 %'),
//                 Text('-2,060.61 USD'),
//
//                 // Text('Gross Discount (%): -21.00 %'),
//                 // Text('State sales tax (%): 5.50 %'),
//                 // if (salesOrderNumber.isNotEmpty)
//                 //   Text('Sales Order Number: $salesOrderNumber'),
//                 // Text('No cash discount allowed'),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Text('State sales tax (%)'),
//                 //izedBox(width: 50,),
//                 Text('                       5.50%'),
//                 Text('   404.12 USD'),
//
//                 // Text('Gross Discount (%): -21.00 %'),
//                 // Text('State sales tax (%): 5.50 %'),
//                 // if (salesOrderNumber.isNotEmpty)
//                 //   Text('Sales Order Number: $salesOrderNumber'),
//                 // Text('No cash discount allowed'),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Text('No cash discount allowed'),
//                 Text('                                                                                                                 '),
//               ],
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildCell(String text) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
//     );
//   }
// }
