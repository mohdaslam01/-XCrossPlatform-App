import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:firebase_core/firebase_core.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance; // Firestore instance

  User? _user;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
        if (_user != null) {
          _addUserToFirestore(); // Call function to add Firestore data
        }
      });
    });
  }

  Future<void> _addUserToFirestore() async {
    final user = <String, dynamic>{
      "first": "Ada",
      "last": "Lovelace",
      "born": 1815,
    };

    try {
      final docRef = await db.collection("users").add(user);
      print('DocumentSnapshot added with ID: ${docRef.id}');
    } catch (e) {
      print('Error adding document: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: _user != null ? _userInfo() : _googleSignInButton(),
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

  Widget _userInfo() {
    return const Center(
      child: Text(
        'Welcome to Quick Team!',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
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
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }
}
