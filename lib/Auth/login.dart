// ignore_for_file: use_build_context_synchronously, non_constant_identifier_na
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tawasal/Auth/Auth.dart';
import 'package:tawasal/controller/validate.dart';


class LoginAndSignUp extends StatefulWidget {
  LoginAndSignUp({Key? key}) : super(key: key);
  final User? user= Auth().currentUser;

  Future<void> signOut() async{
    await Auth().signOut();
  }
  @override
  State<LoginAndSignUp> createState() => _LoginAndSignUpState();
}

class _LoginAndSignUpState extends State<LoginAndSignUp> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool _passwordVisible = true;
  bool isLogin=true;
  bool isLogUp=true;
  //موقتا
  String? errorMassages="";
  String?temCode="";

  Future<void> signInWithEmailAndPassword()async{
    try {
      await Auth().signInWithEmailAndPassword(
          email: _emailcontroller.text,
          password: _passwordcontroller.text);
    } on FirebaseAuthException catch(e){
      setState(() {
        isLogin = false;
      });
      String message = e.code;
      switch (e.code) {
        case 'user-not-found':
          message =
          "البريد الإلكتروني المدخل غير مسجل سابقًا";
          break;
        case 'invalid-email':
        case 'wrong-password':
          message = 'فضلًا تأكد من صحة كلمة المرور';
          break;
        case 'Error 17011':
        case 'Error 17009':
          message =
          'فضلًا تأكد من صحة البريد الإلكتروني وكلمة المرور';
          break;
        default:
          message =
          'فضلا تأكد من صحة بياناتك واتصالك بالإنترنت';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message,
              textAlign: TextAlign.right),
          duration: const Duration(seconds: 2),
        ),
      );

    }
  }
  Future<void> createUserWithEmailAndPassword() async{
    try{
      await Auth().createUserWithEmailAndPassword(
          email: _emailcontroller.text,
          password: _passwordcontroller.text
      );
    } on FirebaseAuthException catch(e){
      setState(() {
        isLogin = false;

      });
      //errorMassages=e.message;
      temCode=e.code;
      /*switch (e.code) {
        case 'user-not-found':
          errorMassages =
          "البريد الإلكتروني المدخل غير مسجل سابقًا";
          break;
        case 'invalid-email':
        case 'wrong-password':
          errorMassages = 'فضلًا تأكد من صحة كلمة المرور';
          break;
        case 'Error 17011':
        case 'Error 17009':
          errorMassages =
          'فضلًا تأكد من صحة البريد الإلكتروني وكلمة المرور';
          break;
        default:
          errorMassages =
          'فضلا تأكد من صحة بياناتك واتصالك بالإنترنت';
      }*/
    }

  }
  Widget _errorMessage(){
    switch (temCode) {
      case 'user-not-found':
        errorMassages =
        "البريد الإلكتروني المدخل غير مسجل سابقًا";
        break;
      case 'invalid-email':
      case 'wrong-password':
        errorMassages = 'فضلًا تأكد من صحة كلمة المرور';
        break;
      case 'Error 17011':
      case 'Error 17009':
        errorMassages =
        'فضلًا تأكد من صحة البريد الإلكتروني وكلمة المرور';
        break;
      default:
        errorMassages =
        ' ';
    }
    return SnackBar(
      content: Text(errorMassages==''?'':'$errorMassages',
          textAlign: TextAlign.right),
      duration: Duration(seconds: 2),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(isLogUp?"تسجيل الدخول":"مستخدم جدجد"),
        ),
        body: SafeArea(
          child: Column(
            children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                  controller: _emailcontroller,
                  validator: (value) {
                    return validate(value, 'البريد الإلكتروني');
                  },
                autovalidateMode:
                AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: 33 ,
                    horizontal: 15),
                errorStyle: const TextStyle(
                    fontSize: 18, color: Colors.red),
                filled: true,
                fillColor: Colors.white,
                labelText: "الايــمـيــل",
                labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),

              ),

              ),
            ),
            Padding(
              padding:  const EdgeInsets.only(
                left: 10, right: 10, top: 10),
            child: TextFormField(
              controller: _passwordcontroller,
              validator: (value) {
                if (value!.isEmpty) {
                  return ' أدخل كلمة المرور';
                }
                return null;
              },
              obscureText: _passwordVisible,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: 33 ,
                    horizontal: 15),
                errorStyle: const TextStyle(
                    fontSize: 18, color: Colors.red),
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                filled: true,
                fillColor: Colors.white,
                labelText: "كلمة المرور",
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),),
              Padding(
                  padding: EdgeInsets.only(top: 15,right: 10,left: 10),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        isLogUp=!isLogUp;
                      });
                    },
                      child: Text(isLogUp?"ليس لديك حساب سجل هنا":"هل لديك حساب؟ اضغط هنا")),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25,right: 10,left: 10),
                child: ElevatedButton(
                    onPressed:isLogUp?signInWithEmailAndPassword:createUserWithEmailAndPassword,
                    /*(){
                      if(isLogUp==true){
                        signInWithEmailAndPassword();

                      }else{
                        createUserWithEmailAndPassword();
                      }
                      switch (temCode) {
                        case 'user-not-found':
                          errorMassages =
                          "البريد الإلكتروني المدخل غير مسجل سابقًا";
                          break;
                        case 'invalid-email':
                        case 'wrong-password':
                          errorMassages = 'فضلًا تأكد من صحة كلمة المرور';
                          break;
                        case 'Error 17011':
                        case 'Error 17009':
                          errorMassages =
                          'فضلًا تأكد من صحة البريد الإلكتروني وكلمة المرور';
                          break;
                        default:
                          errorMassages =
                          ' حدث خطا ';
                      }
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                           SnackBar(
                            content: Text(errorMassages==''?'':'$errorMassages',
                                textAlign: TextAlign.right),
                            duration: Duration(seconds: 2),
                          ),
                      );

                      }*/

                    child: Text(isLogUp ? 'Log in':'Sign up')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
