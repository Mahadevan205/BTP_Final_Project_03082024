import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        backgroundColor: const Color(0xFFFFFFFF),
        title: Image.asset("images/Final-Ikyam-Logo.png"),
        // Set background color to white
        elevation: 2.0,
        shadowColor: const Color(0xFFFFFFFF),
        // Set shadow color to black
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  // Handle notification icon press
                },
              ),
            ),
          ),
          const SizedBox(width: 10,),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(right: 35),
                child: PopupMenuButton<String>(
                  icon: const Icon(Icons.account_circle),
                  onSelected: (value) {
                    if (value == 'logout') {
                      context.go('/');
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                          const LoginScr(
                          ),
                          transitionDuration:
                          const Duration(milliseconds: 200),
                          transitionsBuilder: (context, animation,
                              secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      );
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem<String>(
                        value: 'logout',
                        child: Text('Logout'),
                      ),
                    ];
                  },
                  offset: const Offset(0, 40), // Adjust the offset to display the menu below the icon
                ),
              ),
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          Sidebar(),
          Expanded(
            child: Column(
              children: [
                TopBar(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DashboardCards(),
                        SizedBox(height: 16),
                        SearchAndFilter(),
                        SizedBox(height: 16),
                        OrdersTable(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.grey[200],
      child: Column(
        children: [
          Container(
            color: _selectedIndex == 0 ? Colors.red[300] : Colors.transparent,
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
          ),
          Container(
            color: _selectedIndex == 1 ? Colors.grey[300] : Colors.transparent,
            child: ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Orders'),
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
          ),
          Container(
            color: _selectedIndex == 2 ? Colors.grey[300] : Colors.transparent,
            child: ListTile(
              leading: Icon(Icons.delivery_dining),
              title: Text('Delivery'),
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
            ),
          ),
          Container(
            color: _selectedIndex == 3 ? Colors.grey[300] : Colors.transparent,
            child: ListTile(
              leading: Icon(Icons.receipt),
              title: Text('Invoice'),
              onTap: () {
                setState(() {
                  _selectedIndex = 3;
                });
              },
            ),
          ),
          Container(
            color: _selectedIndex == 4 ? Colors.grey[300] : Colors.transparent,
            child: ListTile(
              leading: Icon(Icons.payment),
              title: Text('Payment'),
              onTap: () {
                setState(() {
                  _selectedIndex = 4;
                });
              },
            ),
          ),
          Container(
            color: _selectedIndex == 5 ? Colors.grey[300] : Colors.transparent,
            child: ListTile(
              leading: Icon(Icons.refresh),
              title: Text('Return'),
              onTap: () {
                setState(() {
                  _selectedIndex = 5;
                });
              },
            ),
          ),
          Container(
            color: _selectedIndex == 6 ? Colors.grey[300] : Colors.transparent,
            child: ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text('Reports'),
              onTap: () {
                setState(() {
                  _selectedIndex = 6;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 80,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Image.asset('assets/logo.png', height: 40), // Replace with your logo
                SizedBox(width: 8),
                Text(
                  'Dashboard',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(Icons.calendar_today),
                SizedBox(width: 8),
                Text('24-04-2024'),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          CircleAvatar(
            child: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}

class DashboardCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCard('5', 'Open Orders', Icons.inventory, Colors.orange),
        _buildCard('26', 'Open Invoices', Icons.receipt, Colors.purple),
        _buildCard('\$526', 'Available Credit Limit', Icons.credit_card, Colors.blue),
        _buildCard('200', 'Order Completed', Icons.check_circle, Colors.green),
      ],
    );
  }

  Widget _buildCard(String value, String label, IconData icon, Color color) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: color),
              SizedBox(height: 8),
              Text(
                value,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchAndFilter extends StatefulWidget {
  @override
  _SearchAndFilterState createState() => _SearchAndFilterState();
}

class _SearchAndFilterState extends State<SearchAndFilter> {
  String? _filter1Value;
  String? _filter2Value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        SizedBox(width: 8),
        DropdownButton(
          value: _filter1Value,
          items: [
            DropdownMenuItem(child: Text('Filters I'), value: 'Filters I'),
            DropdownMenuItem(child: Text('Filters II'), value: 'Filters II'),
          ],
          onChanged: (value) {
            setState(() {
              _filter1Value = value as String?;
            });
          },
          hint: Text('Filters I'),
        ),
        SizedBox(width: 8),
        DropdownButton(
          value: _filter2Value,
          items: [
            DropdownMenuItem(child: Text('Filters II'), value: 'Filters II'),
            DropdownMenuItem(child: Text('Filters III'), value: 'Filters III'),
          ],
          onChanged: (value) {
            setState(() {
              _filter2Value = value as String?;
            });
          },
          hint: Text('Filters II'),
        ),
      ],
    );
  }
}

class OrdersTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[200]),
          children: [
            _buildTableHeader('Status'),
            _buildTableHeader('Order ID'),
            _buildTableHeader('Created Date'),
            _buildTableHeader('Reference Number'),
            _buildTableHeader('Total Amount'),
            _buildTableHeader('Delivery Status'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('In Preparation'),
            _buildTableCell('5925'),
            _buildTableCell('2024-04-18'),
            _buildTableCell('REF123'),
            _buildTableCell('87,231'),
            _buildTableCell('Not Started'),
          ],
        ),
        // Add more rows here
      ],
    );
  }

  Widget _buildTableHeader(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTableCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text),
    );
  }
}

class MyOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchAndFilter(),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: OrdersTable(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}