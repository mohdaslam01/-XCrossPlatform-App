import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';


class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // ignore: unused_field
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // ignore: unused_field
  User? _user;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event){
      setState(() {
      _user = event;
      }); // setState close
    }); // auth.authStateChanges().listen((event) close
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(appBar: AppBar(
         title: const Text('Second Page'),
         backgroundColor: Theme.of(context).colorScheme.primary,
       ),
       body : _user != null ? _userInfo() : _googleSignInButton(),
      );
  }
  Widget _googleSignInButton() {
    return Center(
      child: SizedBox(
        child: SizedBox(
          height: 40,
          child: SignInButton(
            Buttons.google,
          text: "Google Sign up", 
          onPressed: _handleGoogleSignIn,
          ),
        ),
      ),
    );
  }
  Widget _userInfo(){
    // return const SizedBox();
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
  // ignore: unused_element
  void _handleGoogleSignIn() async{
    try{
      // ignore: unused_local_variable
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      _auth.signInWithProvider(googleAuthProvider);
      await _auth.currentUser?.reload();
      setState(() {
      _user = _auth.currentUser; // Set the reloaded user data
    });

    }catch(error){
      // ignore: avoid_print
      print(error);
      }
  }
}
//Database for the user-app interaction
// import 'package:flutter/material.dart';

// class SecondPage extends StatefulWidget {
//   const SecondPage({super.key}); // or use ({Key? key}) : super(key: key);
  
//   @override
//   State<SecondPage> createState() => _SecondPageState();
  
// }

// class _SecondPageState {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Second Page'),
//         backgroundColor: Theme.of(context).colorScheme.primary,
//       ),
//       body: const Center(
//         child: Column(
//           children: [Text(
//             'This is the second page!\n Powered by Google',
//             style:  TextStyle(
//               fontSize: 24,
//             ),
//           ),]
//         )
//       ),
//     );
//   }
// }
