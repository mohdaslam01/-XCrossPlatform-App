import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  List<Map<String, dynamic>> allItems = [];
  List<Map<String, dynamic>> filteredItems = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchAllItems();
  }

  Future<void> _fetchAllItems() async {
    try {
      final querySnapshot = await db.collection("users").get();
      List<Map<String, dynamic>> fetchedItems = [];
      for (var doc in querySnapshot.docs) {
        if (doc.data()['items'] != null) {
          List<dynamic> userItems = doc.data()['items'];
          fetchedItems.addAll(userItems.cast<Map<String, dynamic>>());
        }
      }
      setState(() {
        allItems = fetchedItems;
        filteredItems = fetchedItems;
      });
    } catch (e) {
      print('Error fetching items: $e');
    }
  }

  void _filterItems(String query) {
    setState(() {
      filteredItems = allItems
          .where((item) =>
              item['item'].toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: _filterItems,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search items',
              ),
            ),
          ),
          Expanded(
            child: filteredItems.isEmpty
                ? const Center(child: Text('No items found'))
                : ListView.builder(
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return ListTile(
                        title: Text('${item['item']}'),
                        subtitle: Text(
                            'Phone: ${item['phone']}\nCommunication: ${item['communicationType']}'),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
