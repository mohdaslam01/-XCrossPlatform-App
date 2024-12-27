import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'home.dart'; // Import the new page

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  User? _user;
  List<Map<String, dynamic>> items = [];

  final TextEditingController itemController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController communicationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
        if (_user != null) {
          _fetchItems();
        }
      });
    });
  }

  Future<void> _fetchItems() async {
    if (_user == null) return;
    try {
      final doc = await db.collection("users").doc(_user!.uid).get();
      if (doc.exists && doc.data() != null) {
        setState(() {
          items = List<Map<String, dynamic>>.from(doc.data()?['items'] ?? []);
        });
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching items: $e');
    }
  }

  Future<void> _addItem(String item, String phone, String communicationType) async {
    if (_user == null) return;
    try {
      final newItem = {
        "item": item,
        "phone": phone,
        "communicationType": communicationType,
      };
      setState(() {
        items.add(newItem);
      });
      await db.collection("users").doc(_user!.uid).set(
        {'items': items},
        SetOptions(merge: true),
      );
    } catch (e) {
      // ignore: avoid_print
      print('Error adding item: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD Operations'),
        actions: [
          IconButton(
            icon: const Icon(Icons.visibility),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: itemController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter an item',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter phone number',
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: communicationController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter communication type',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (itemController.text.isNotEmpty &&
                  phoneController.text.isNotEmpty &&
                  communicationController.text.isNotEmpty) {
                _addItem(itemController.text, phoneController.text, communicationController.text);
                itemController.clear();
                phoneController.clear();
                communicationController.clear();
              }
            },
            child: const Text('Add Item'),
          ),
        ],
      ),
    );
  }
}
