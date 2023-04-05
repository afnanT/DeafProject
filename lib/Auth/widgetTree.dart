
import 'package:flutter/cupertino.dart';
import 'package:tawasal/Auth/Auth.dart';
import 'package:tawasal/Auth/homePage.dart';
import 'package:tawasal/Auth/login.dart';
import 'package:tawasal/chatLocal/main_screen.dart';

class WidgetTree extends StatefulWidget{
  const WidgetTree({Key? key}): super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();

}

class _WidgetTreeState extends State<WidgetTree>{
  @override
  Widget build(BuildContext context){
    return StreamBuilder(
      stream: Auth().authStatechanges,
      builder: (context, snapshot){
        if(snapshot.hasData){
          return HomePage();

        }else{
          return LoginAndSignUp();

        }
      },
    );
  }
}
