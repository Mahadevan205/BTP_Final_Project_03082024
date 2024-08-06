// // // // // // Copyright 2013 The Flutter Authors. All rights reserved.
// // // // // // Use of this source code is governed by a BSD-style license that can be
// // // // // // found in the LICENSE file.
// // // // //
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:go_router/go_router.dart';
// // // // //
// // // // // /// This sample app shows an app with two screens.
// // // // // ///
// // // // // /// The first route '/' is mapped to [HomeScreen], and the second route
// // // // // /// '/details' is mapped to [DetailsScreen].
// // // // // ///
// // // // // /// The buttons use context.go() to navigate to each destination. On mobile
// // // // // /// devices, each destination is deep-linkable and on the web, can be navigated
// // // // // /// to using the address bar.
// // // // // void main() => runApp(const MyApp());
// // // // //
// // // // // /// The route configuration.
// // // // // final GoRouter _router = GoRouter(
// // // // //   routes: <RouteBase>[
// // // // //     GoRoute(
// // // // //       path: '/',
// // // // //       builder: (BuildContext context, GoRouterState state) {
// // // // //         return const HomeScreen();
// // // // //       },
// // // // //       routes: <RouteBase>[
// // // // //         GoRoute(
// // // // //           path: 'details',
// // // // //           builder: (BuildContext context, GoRouterState state) {
// // // // //             return const DetailsScreen();
// // // // //           },
// // // // //         ),
// // // // //       ],
// // // // //     ),
// // // // //   ],
// // // // // );
// // // // //
// // // // // /// The main app.
// // // // // class MyApp extends StatelessWidget {
// // // // //   /// Constructs a [MyApp]
// // // // //   const MyApp({super.key});
// // // // //
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return MaterialApp.router(
// // // // //       routerConfig: _router,
// // // // //     );
// // // // //   }
// // // // // }
// // // // //
// // // // // /// The home screen
// // // // // class HomeScreen extends StatelessWidget {
// // // // //   /// Constructs a [HomeScreen]
// // // // //   const HomeScreen({super.key});
// // // // //
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       appBar: AppBar(title: const Text('Home Screen')),
// // // // //       body: Center(
// // // // //         child: ElevatedButton(
// // // // //           onPressed: () => context.go('/details'),
// // // // //           child: const Text('Go to the Details screen'),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }
// // // // //
// // // // // /// The details screen
// // // // // class DetailsScreen extends StatelessWidget {
// // // // //   /// Constructs a [DetailsScreen]
// // // // //   const DetailsScreen({super.key});
// // // // //
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       appBar: AppBar(title: const Text('Details Screen')),
// // // // //       body: Center(
// // // // //         child: ElevatedButton(
// // // // //           onPressed: () => context.go('/'),
// // // // //           child: const Text('Go back to the Home screen'),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }
// // // //
// // // //
// // // //
// // // // import 'package:flutter/material.dart';
// // // // import 'package:go_router/go_router.dart';
// // // //
// // // // void main() {
// // // //   runApp(MyApp());
// // // // }
// // // // class NavigationState with ChangeNotifier {
// // // //   List<String> _navigationPath = [];
// // // //
// // // //   List<String> get navigationPath => _navigationPath;
// // // //
// // // //   void pushRoute(String route) {
// // // //     _navigationPath.add(route);
// // // //     notifyListeners();
// // // //   }
// // // //
// // // //   void popRoute() {
// // // //     if (_navigationPath.isNotEmpty) {
// // // //       _navigationPath.removeLast();
// // // //       notifyListeners();
// // // //     }
// // // //   }
// // // // }
// // // //
// // // // final navigationState = NavigationState();
// // // //
// // // // class MyApp extends StatelessWidget {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return MaterialApp(
// // // //       title: 'Navigation Demo',
// // // //       home: HomeScreen(),
// // // //     );
// // // //   }
// // // // }
// // // //
// // // // class HomeScreen extends StatelessWidget {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('Home Screen'),
// // // //         leading: IconButton(
// // // //           icon: Icon(Icons.arrow_back),
// // // //           onPressed: () {
// // // //             if (navigationState.navigationPath.isNotEmpty) {
// // // //               navigationState.popRoute();
// // // //             }
// // // //           },
// // // //         ),
// // // //       ),
// // // //       body: Center(
// // // //         child: Column(
// // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // //           children: [
// // // //             ElevatedButton(
// // // //               onPressed: () {
// // // //                 navigationState.pushRoute('Products');
// // // //                 Navigator.push(
// // // //                   context,
// // // //                   MaterialPageRoute(builder: (context) => ProductsScreen()),
// // // //                 );
// // // //               },
// // // //               child: Text('Go to Products'),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // //
// // // // class ProductsScreen extends StatelessWidget {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('Products Screen'),
// // // //         leading: IconButton(
// // // //           icon: Icon(Icons.arrow_back),
// // // //           onPressed: () {
// // // //             if (navigationState.navigationPath.isNotEmpty) {
// // // //               navigationState.popRoute();
// // // //             }
// // // //           },
// // // //         ),
// // // //       ),
// // // //       body: Center(
// // // //         child: Column(
// // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // //           children: [
// // // //             Text('Breadcrumb trail: ${navigationState.navigationPath.join(' > ')}'),
// // // //             ElevatedButton(
// // // //               onPressed: () {
// // // //                 navigationState.pushRoute('Orders');
// // // //                 Navigator.push(
// // // //                   context,
// // // //                   MaterialPageRoute(builder: (context) => OrdersScreen()),
// // // //                 );
// // // //               },
// // // //               child: Text('Go to Orders'),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // //
// // // // class OrdersScreen extends StatelessWidget {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('Orders Screen'),
// // // //         leading: IconButton(
// // // //           icon: Icon(Icons.arrow_back),
// // // //           onPressed: () {
// // // //             if (navigationState.navigationPath.isNotEmpty) {
// // // //               navigationState.popRoute();
// // // //             }
// // // //           },
// // // //         ),
// // // //       ),
// // // //       body: Center(
// // // //         child: Column(
// // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // //           children: [
// // // //             Text('Breadcrumb trail: ${navigationState.navigationPath.join(' > ')}'),
// // // //             ElevatedButton(
// // // //               onPressed: () {
// // // //                 navigationState.pushRoute('Returns');
// // // //                 Navigator.push(
// // // //                   context,
// // // //                   MaterialPageRoute(builder: (context) => ReturnsScreen()),
// // // //                 );
// // // //               },
// // // //               child: Text('Go to Returns'),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // //
// // // // class ReturnsScreen extends StatelessWidget {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('Returns Screen'),
// // // //         leading: IconButton(
// // // //           icon: Icon(Icons.arrow_back),
// // // //           onPressed: () {
// // // //             if (navigationState.navigationPath.isNotEmpty) {
// // // //               navigationState.popRoute();
// // // //             }
// // // //           },
// // // //         ),
// // // //       ),
// // // //       body: Center(
// // // //         child: Column(
// // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // //           children: [
// // // //             Text('Breadcrumb trail: ${navigationState.navigationPath.join(' > ')}'),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // //
// // // import 'package:flutter/material.dart';
// // //
// // // void main() {
// // //   runApp(MyApp());
// // // }
// // //
// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp.router(
// // //       routerDelegate: AppRouterDelegate(),
// // //       routeInformationParser: AppRouteInformationParser(),
// // //     );
// // //   }
// // // }
// // //
// // // class AppRouterDelegate extends RouterDelegate<RoutePath> with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
// // //   @override
// // //   final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// // //
// // //   // Track the current path and button pressed
// // //   RoutePath _currentPath = RoutePath.home;
// // //   String? _currentButton;
// // //
// // //   @override
// // //   RoutePath get currentConfiguration => _currentPath;
// // //
// // //   void _navigateToDetails(String buttonName) {
// // //     _currentPath = RoutePath.details;
// // //     _currentButton = buttonName;
// // //     notifyListeners();
// // //   }
// // //
// // //   void _goHome() {
// // //     _currentPath = RoutePath.home;
// // //     _currentButton = null;
// // //     notifyListeners();
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Navigator(
// // //       key: navigatorKey,
// // //       pages: [
// // //         MaterialPage(child: HomePage(onNavigateToDetails: _navigateToDetails)),
// // //         if (_currentPath == RoutePath.details)
// // //           MaterialPage(child: DetailsPage(onNavigateBack: _goHome, buttonName: _currentButton)),
// // //       ],
// // //       onPopPage: (route, result) {
// // //         if (!route.didPop(result)) {
// // //           return false;
// // //         }
// // //         _currentPath = RoutePath.home;
// // //         _currentButton = null;
// // //         notifyListeners();
// // //         return true;
// // //       },
// // //     );
// // //   }
// // //
// // //   @override
// // //   Future<void> setNewRoutePath(RoutePath configuration) {
// // //     // TODO: implement setNewRoutePath
// // //     throw UnimplementedError();
// // //   }
// // // }
// // //
// // // class AppRouteInformationParser extends RouteInformationParser<RoutePath> {
// // //   @override
// // //   Future<RoutePath> parseRouteInformation(RouteInformation routeInformation) async {
// // //     if (routeInformation.location == '/details') {
// // //       return RoutePath.details;
// // //     }
// // //     return RoutePath.home;
// // //   }
// // //
// // //   @override
// // //   RouteInformation? restoreRouteInformation(RoutePath configuration) {
// // //     if (configuration == RoutePath.details) {
// // //       return RouteInformation(location: '/details');
// // //     }
// // //     return RouteInformation(location: '/');
// // //   }
// // // }
// // //
// // // class RoutePath {
// // //   static final home = RoutePath();
// // //   static final details = RoutePath();
// // // }
// // //
// // // class HomePage extends StatelessWidget {
// // //   final void Function(String buttonName) onNavigateToDetails;
// // //
// // //   HomePage({required this.onNavigateToDetails});
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(title: Text('Home Page')),
// // //       body: Column(
// // //         mainAxisAlignment: MainAxisAlignment.center,
// // //         children: List.generate(
// // //           5,
// // //               (index) => ElevatedButton(
// // //             onPressed: () => onNavigateToDetails('Home Button ${index + 1}'),
// // //             child: Text('Home Button ${index + 1}'),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // // class DetailsPage extends StatelessWidget {
// // //   final VoidCallback onNavigateBack;
// // //   final String? buttonName;
// // //
// // //   DetailsPage({required this.onNavigateBack, this.buttonName});
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(title: Text('Details Page')),
// // //       body: Column(
// // //         mainAxisAlignment: MainAxisAlignment.center,
// // //         children: [
// // //           if (buttonName != null) Text('Button Pressed: $buttonName'),
// // //           ...List.generate(
// // //             5,
// // //                 (index) => ElevatedButton(
// // //               onPressed: onNavigateBack,
// // //               child: Text('Details Button ${index + 1}'),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // //
// // import 'package:flutter/material.dart';
// //
// // void main() {
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: TableExample(),
// //     );
// //   }
// // }
// //
// // class TableExample extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Table Example'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(8.0),
// //         child: Table(
// //           columnWidths: {
// //             0: FixedColumnWidth(50.0), // Set width for the first column (S.No)
// //             1: FlexColumnWidth(),     // Flex width for the rest
// //             2: FlexColumnWidth(),
// //             3: FlexColumnWidth(),
// //             4: FlexColumnWidth(),
// //             5: FlexColumnWidth(),
// //           },
// //           border: TableBorder.all(color: Colors.black, width: 1),
// //           children: [
// //             // Table headers
// //             TableRow(
// //               children: [
// //                 TableCell(
// //                   child: Container(
// //                     height: 40,
// //                     color: Colors.grey[300],
// //                     child: Center(child: Text('S.No', style: TextStyle(fontWeight: FontWeight.bold))),
// //                   ),
// //                 ),
// //                 TableCell(
// //                   child: Container(
// //                     height: 40,
// //                     color: Colors.grey[300],
// //                     child: Center(child: Text('Heading 1', style: TextStyle(fontWeight: FontWeight.bold))),
// //                   ),
// //                 ),
// //                 TableCell(
// //                   child: Container(
// //                     height: 40,
// //                     color: Colors.grey[300],
// //                     child: Center(child: Text('Heading 2', style: TextStyle(fontWeight: FontWeight.bold))),
// //                   ),
// //                 ),
// //                 TableCell(
// //                   child: Container(
// //                     height: 40,
// //                     color: Colors.grey[300],
// //                     child: Center(child: Text('Heading 3', style: TextStyle(fontWeight: FontWeight.bold))),
// //                   ),
// //                 ),
// //                 TableCell(
// //                   child: Container(
// //                     height: 40,
// //                     color: Colors.grey[300],
// //                     child: Center(child: Text('Heading 4', style: TextStyle(fontWeight: FontWeight.bold))),
// //                   ),
// //                 ),
// //                 TableCell(
// //                   child: Container(
// //                     height: 40,
// //                     color: Colors.grey[300],
// //                     child: Center(child: Text('Balance', style: TextStyle(fontWeight: FontWeight.bold))),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             // Dummy data rows
// //             for (var i = 1; i <= 5; i++)
// //               TableRow(
// //                 children: [
// //                   TableCell(
// //                     child: Container(
// //                       height: 80,
// //                       child: Center(child: Text('$i')),
// //                     ),
// //
// //                   ),
// //                   TableCell(
// //                     child: Row(
// //                       children: [
// //                         Container(
// //                           height: 20,
// //                           child: Center(child: Text('Data $i-1')),
// //
// //                         ),
// //
// //                       ],
// //                     ),
// //
// //
// //
// //                   ),
// //                   Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                     Text(
// //                         'hiii'
// //                       ),
// //                       Divider(thickness: 3,color: Colors.blue,),
// //                     ],
// //                   ),
// //
// //                   TableCell(
// //                     child: Container(
// //                       height: 20,
// //                       child: Center(child: Text('Data $i-2')),
// //                     ),
// //                   ),
// //                   TableCell(
// //                     child: Container(
// //                       height: 20,
// //                       child: Center(child: Text('Data $i-3')),
// //                     ),
// //                   ),
// //                   TableCell(
// //                     child: Container(
// //                       height: 20,
// //                       child: Center(child: Text('Data $i-4')),
// //                     ),
// //                   ),
// //                   TableCell(
// //                     child: Container(
// //                       height: 20,
// //                       child: Center(child: Text('Data $i-5')),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// //
// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:open_file/open_file.dart';
// // import 'package:excel/excel.dart';
// // import 'package:syncfusion_flutter_xlsio/xlsio.dart';
// //
// // void main() {
// //   runApp(const MaterialApp(home: MyApp()));
// // }
// //
// // class MyApp extends StatefulWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   State<MyApp> createState() => _MyAppState();
// // }
// //
// // class _MyAppState extends State<MyApp> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: ElevatedButton(
// //           onPressed: createExcel,
// //           child: const Text('Create Excel'),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // Future<void> createExcel() async {
// //   try {
// //     final Excel excel = Excel.createExcel();
// //     final Sheet sheet = excel[excel.getDefaultSheet()!];
// //
// //     sheet
// //         .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0))
// //         .value = "Hello, World!";
// //     sheet
// //         .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 1))
// //         .value = 'This is a sample Excel file.';
// //
// //     final String fileName = '/storage/emulated/0/Download/Output.xlsx';
// //     final File file = File(fileName);
// //     await file.writeAsBytes(excel.encode()!, flush: true);
// //     await OpenFile.open(fileName);
// //   } catch (e) {
// //     print('Error creating Excel file: $e');
// //   }
// // }
//
// //
// // import 'dart:io';
// // import 'dart:typed_data';
// // import 'dart:ui';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart' show rootBundle;
// // import 'package:pdf/widgets.dart' as pw;
// // import 'package:printing/printing.dart';
// // import 'package:path_provider/path_provider.dart';
// //
// // void main() {
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'PDF Template Example',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: MyHomePage(),
// //     );
// //   }
// // }
// //
// // class MyHomePage extends StatefulWidget {
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }
// //
// // class _MyHomePageState extends State<MyHomePage> {
// //   Future<void> _generateDocument() async {
// //     try {
// //       // Load the template PDF (use your actual template file path)
// //       final templateData = await rootBundle.load('assets/images/template.pdf');
// //       final Uint8List templateBytes = templateData.buffer.asUint8List();
// //
// //       // Create a new document
// //       final pdfDocument = pw.Document();
// //
// //       // Convert PDF pages to images using the printing package
// //       final pages = await Printing.raster(templateBytes, pages: [0, 1]).toList();
// //
// //       for (final page in pages) {
// //         final pageImage = await page.toImage(); // Convert to image
// //         final ByteData? pageImageData = await pageImage.toByteData(format: ImageByteFormat.png);
// //         final Uint8List pageImageBytes = pageImageData!.buffer.asUint8List();
// //
// //         pdfDocument.addPage(
// //           pw.Page(
// //             build: (pw.Context context) {
// //               return pw.Stack(
// //                 children: [
// //                   pw.Image(pw.MemoryImage(pageImageBytes)),
// //                   pw.Positioned(
// //                     top: 100,
// //                     left: 50,
// //                     child: pw.Text(
// //                       'Dynamic Text Example',
// //                       style: pw.TextStyle(fontSize: 18),
// //                     ),
// //                   ),
// //                   // Add more dynamic content as needed
// //                 ],
// //               );
// //             },
// //           ),
// //         );
// //       }
// //
// //       // Save the PDF to a file
// //       final output = await getTemporaryDirectory();
// //       final file = File('${output.path}/output.pdf');
// //       await file.writeAsBytes(await pdfDocument.save());
// //
// //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //         content: Text('PDF saved to ${file.path}'),
// //       ));
// //     } catch (e) {
// //       print("Error generating PDF: $e");
// //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //         content: Text('Failed to generate PDF'),
// //       ));
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('PDF Template Example'),
// //       ),
// //       body: Center(
// //         child: ElevatedButton(
// //           onPressed: _generateDocument,
// //           child: Text('Generate PDF'),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
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
//         body: Center(
//           child: InvoiceTable(),
//         ),
//       ),
//     );
//   }
// }
//
// class InvoiceTable extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Table(
//         border: TableBorder.all(color: Colors.black),
//         columnWidths: {
//           0: FixedColumnWidth(50.0),
//           1: FixedColumnWidth(150.0),
//           2: FixedColumnWidth(200.0),
//           3: FixedColumnWidth(100.0),
//           4: FixedColumnWidth(150.0),
//           5: FixedColumnWidth(150.0),
//         },
//         children: [
//           _buildTableRow([
//             'Line',
//             'Product',
//             'Description',
//             'Quantity',
//             'Gross Price',
//             'Gross Value'
//           ], isHeader: true),
//           _buildItemRow(
//             line: '10',
//             product: 'A00161',
//             description: 'Xerox 1924',
//             quantity: '1 Each',
//             grossPrice: '7,751.83 USD / 1 Each',
//             grossValue: '7,751.83 USD',
//             grossListPrice: '9,812.44 USD / 1 Each',
//             grossDiscount: '-21.00 %',
//             stateSalesTax: '5.50 %',
//           ),
//           _buildItemRow(
//             line: '20',
//             product: 'A00161',
//             description: 'Xerox 1924',
//             quantity: '1 Each',
//             grossPrice: '7,751.83 USD / 1 Each',
//             grossValue: '7,751.83 USD',
//             grossListPrice: '9,812.44 USD / 1 Each',
//             grossDiscount: '-21.00 %',
//             stateSalesTax: '5.50 %',
//             salesOrderNumber: '5911 / 10',
//           ),
//           _buildItemRow(
//             line: '30',
//             product: 'A00161',
//             description: 'Xerox 1924',
//             quantity: '1 Each',
//             grossPrice: '7,751.83 USD / 1 Each',
//             grossValue: '7,751.83 USD',
//             grossListPrice: '9,812.44 USD / 1 Each',
//             grossDiscount: '-21.00 %',
//             stateSalesTax: '5.50 %',
//             salesOrderNumber: '5912 / 10',
//           ),
//         ],
//       ),
//     );
//   }
//
//   TableRow _buildTableRow(List<String> cells, {bool isHeader = false}) {
//     return TableRow(
//       children: cells.map((cell) {
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             cell,
//             style: TextStyle(
//               fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
//
//   TableRow _buildItemRow({
//     required String line,
//     required String product,
//     required String description,
//     required String quantity,
//     required String grossPrice,
//     required String grossValue,
//     required String grossListPrice,
//     required String grossDiscount,
//     required String stateSalesTax,
//     String? salesOrderNumber,
//   }) {
//     return TableRow(
//       children: [
//         _buildCell(line),
//         _buildCell(product),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildCell(description),
//             _buildCell("Gross List Price: $grossListPrice"),
//             _buildCell("Gross Discount (%): $grossDiscount"),
//             _buildCell("State sales tax (%): $stateSalesTax"),
//             if (salesOrderNumber != null)
//               _buildCell("Sales Order Number: $salesOrderNumber"),
//             _buildCell("No cash discount allowed"),
//           ],
//         ),
//         _buildCell(quantity),
//         _buildCell(grossPrice),
//         _buildCell(grossValue),
//       ],
//     );
//   }
//
//   Widget _buildCell(String text) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Text(text),
//     );
//   }
// }
//

//
//
//
// import 'package:flutter/material.dart';
//
// void main() {
//
// runApp(MyApp());
//
// }
//
// class MyApp extends StatelessWidget {
//
// @override
//
// Widget build(BuildContext context) {
//
// return MaterialApp(
//
// home: Scaffold(
//
// appBar: AppBar(
//
// title: Text('Table Example'),
//
// ),
//
// body: Padding(
//
// padding: const EdgeInsets.all(8.0),
//
// child: Column(
//
// children: [
//
// buildTableRow(
//
// line: '10',
//
// product: 'A00161',
//
// description: 'Xerox 1924',
//
// quantity: '1 Each',
//
// grossPrice: '7,751.83 USD / 1 Each',
//
// grossValue: '7,751.83 USD',
//
// salesOrderNumber: '',
//
// ),
//
// buildTableRow(
//
// line: '20',
//
// product: 'A00161',
//
// description: 'Xerox 1924',
//
// quantity: '1 Each',
//
// grossPrice: '7,751.83 USD / 1 Each',
//
// grossValue: '7,751.83 USD',
//
// salesOrderNumber: '5911 / 10',
//
// ),
//
// buildTableRow(
//
// line: '30',
//
// product: 'A00161',
//
// description: 'Xerox 1924',
//
// quantity: '1 Each',
//
// grossPrice: '7,751.83 USD / 1 Each',
//
// grossValue: '7,751.83 USD',
//
// salesOrderNumber: '5912 / 10',
//
// ),
//
// ],
//
// ),
//
// ),
//
// ),
//
// );
//
// }
//
// Widget buildTableRow({
//
// required String line,
//
// required String product,
//
// required String description,
//
// required String quantity,
//
// required String grossPrice,
//
// required String grossValue,
//
// required String salesOrderNumber,
//
// }) {
//
// return Padding(
//
// padding: const EdgeInsets.symmetric(vertical: 8.0),
//
// child: Column(
//
// crossAxisAlignment: CrossAxisAlignment.start,
//
// children: [
//
// Table(
//
// border: TableBorder.all(),
//
// children: [
//
// TableRow(
//
// children: [
//
// buildCell('Line'),
//
// buildCell('Product'),
//
// buildCell('Description'),
//
// buildCell('Quantity'),
//
// buildCell('Gross Price'),
//
// buildCell('Gross Value'),
//
// ],
//
// ),
//
// TableRow(
//
// children: [
//
// buildCell(line),
//
// buildCell(product),
//
// buildCell(description),
//
// buildCell(quantity),
//
// buildCell(grossPrice),
//
// buildCell(grossValue),
//
// ],
//
// ),
//
// ],
//
// ),
//
// Padding(
//
// padding: const EdgeInsets.only(left: 16.0),
//
// child: Column(
//
// crossAxisAlignment: CrossAxisAlignment.start,
//
// children: [
//
// Text('Gross List Price: 9,812.44 USD / 1 Each'),
//
// Text('Gross Discount (%): -21.00 %'),
//
// Text('State sales tax (%): 5.50 %'),
//
// if (salesOrderNumber.isNotEmpty)
//
// Text('Sales Order Number: $salesOrderNumber'),
//
// Text('No cash discount allowed'),
//
// ],
//
// ),
//
// ),
//
// ],
//
// ),
//
// );
//
// }
//
// Widget buildCell(String text) {
//
// return Padding(
//
// padding: const EdgeInsets.all(8.0),
//
// child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
//
// );
//
// }
//
// }

