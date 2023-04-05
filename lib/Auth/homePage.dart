import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tawasal/Auth/Auth.dart';

class HomePage extends StatelessWidget{
  HomePage({Key? key}) : super (key: key);
  final User? user= Auth().currentUser;

  Future<void> signOut() async{
    await Auth().signOut();
  }

  Widget _userUid(){
    return Text(user?.email ?? 'user email');
  }

  Widget _signOutButton(){
    return ElevatedButton(
      onPressed: signOut,
      child: Text('sign out'),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("ماادري وش هاذي"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            _userUid(),
            _signOutButton()

          ],
        ),
      ),
    );
  }
}