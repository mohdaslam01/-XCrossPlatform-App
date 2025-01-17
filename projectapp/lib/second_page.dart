import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';

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
  List<Map<String, dynamic>> allItems = []; // Holds all users' items for search functionality

  final TextEditingController itemController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController communicationController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
        if (_user != null) {
          _fetchUserItems();
          _fetchAllItems(); // Fetch all items for viewing/search
        }
      });
    });
  }

  Future<void> _addOrUpdateUserInFirestore() async {
    if (_user == null) return;
    try {
      await db.collection("users").doc(_user!.uid).set({
        "email": _user!.email,
      }, SetOptions(merge: true));
      // ignore: avoid_print
      print('User data added/updated successfully!');
    } catch (e) {
      // ignore: avoid_print
      print('Error adding/updating user: $e');
    }
  }

  Future<void> _fetchUserItems() async {
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
      print('Error fetching user items: $e');
    }
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
      });
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching all items: $e');
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
      _fetchAllItems(); // Refresh all items
    } catch (e) {
      // ignore: avoid_print
      print('Error adding item: $e');
    }
  }

  void _filterAllItems(String query) {
    setState(() {
      allItems = allItems.where((item) {
        return item['item']
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('I am expert in'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearchDialog();
            },
          ),
        ],
      ),
      body: _user != null ? _crudUI() : _googleSignInButton(),
    );
  }

  Widget _crudUI() {
    return Column(
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
              _addItem(itemController.text, phoneController.text,
                  communicationController.text);
              itemController.clear();
              phoneController.clear();
              communicationController.clear();
            }
          },
          child: const Text('Add Item'),
        ),
      ],
    );
  }

  Widget _googleSignInButton() {
    return Center(
      child: SizedBox(
        height: 40,
        child: SignInButton(
          Buttons.google,
          text: "Google Sign up",
          onPressed: _handleGoogleSignIn,
        ),
      ),
    );
  }

  void _handleGoogleSignIn() async {
    try {
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      await _auth.signInWithProvider(googleAuthProvider);
      await _auth.currentUser?.reload();
      setState(() {
        _user = _auth.currentUser;
      });
      if (_user != null) {
        _addOrUpdateUserInFirestore();
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error signing in: $e');
    }
  }

  void showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Search Items'),
          content: TextField(
            controller: searchController,
            onChanged: _filterAllItems,
            decoration: const InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
