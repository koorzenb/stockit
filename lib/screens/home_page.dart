import 'package:flutter/material.dart';

import '../widgets/item_list.dart';
import 'capture_item_page.dart';
import 'checkout_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> pages = [];

  late Map<String, Map<String, dynamic>> items;

  @override
  void initState() {
    setState(() {
      pages = [
        const ItemList(),
        CaptureItemPage(
          setIndex: setPageIndex,
        ),
        const CheckoutPage(),
      ];
      super.initState();
    });
  }

  // TODO: idea: click share -> navigate to select customer bank (eg ABSA) -> once selected, navigate to sharing panel -> select "WhatsApp" -> on WhatsApp message populate with our ABSA details and price
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StockIt'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        // foregroundColor: Colors.white,
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"), // TODO: consider item list icon with 'Items' label
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: "Capture"),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Checkout'),
        ],
      ),
    );
  }

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  setPageIndex() {
    setState(() => _currentIndex = 0);
  }
}
