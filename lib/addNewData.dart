import 'package:flutter/material.dart';
import 'package:tawasal/chatLocal/main_screen.dart';

import 'controller/realtimeNewData.dart';
class AddNewSentence extends StatefulWidget {
  const AddNewSentence({ super.key });

  @override
  State<AddNewSentence> createState() => _AddNewSentenceState();
}

class _AddNewSentenceState extends State<AddNewSentence> {
  TextEditingController controller = TextEditingController();
  bool errorsen = false;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(

          body: Column(
            children:[
              Container(
                height: 85,
                decoration: BoxDecoration(color: Color(0xff787878)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                              MainScreen()),);
                        },
                        child: Image.asset(
                          "assets/Back icon.png",
                          height: 23,
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AddNewSentence())),
                        child: Image.asset(
                          "assets/Vector.png",
                          height: 23,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50,right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Text(
                          "طلب إضافة كلمة/ جملة",
                          style: TextStyle(
                              fontSize:  30 ,
                              color: Colors.black),
                        ),


                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50,right: 20),
                    child: Text(
                      "اكتب كلمة/ جملة لا تتجاوز ٦ كلمات",
                      style: TextStyle(
                          fontSize:  20 ,
                          color: Colors.black),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextField(
                              onChanged: (value) {
                                if (controller.text.isNotEmpty) {
                                  setState(() {
                                    errorsen = false;
                                  });
                                }
                              },
                              controller: controller,
                              minLines: 3,
                              maxLines: 3,

                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                labelText: "اكتب ",
                                labelStyle: TextStyle(
                                    fontSize:  24 ,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color:Colors.white)),
                                focusedBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    borderSide:
                                    BorderSide(width: 2, color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                        ////////////////////////////
                        errorsen
                            ? Padding(
                          padding:
                          const EdgeInsets.only(top: 3, right: 33, bottom: 10),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.error,
                                color: Colors.red,
                              ),
                              Text(
                                " يجب ادخال جملة  ",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20 ,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30,left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () async {
                            Navigator.pushReplacement(context,
                              MaterialPageRoute(
                                  builder: (context) => const MainScreen()),);
                          },
                          child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: FittedBox(
                                child: Text(
                                  "إلغاء",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        InkWell(
                          onTap: (){
                            if (controller.text.trim().isEmpty) {
                              setState(() {
                                errorsen = true;
                              });
                            } else {
                              uploadNewData(controller.text.trim());
                              Navigator.pushReplacement(context,
                                MaterialPageRoute(
                                    builder: (context) => const MainScreen()),);
                              AlertDialog(
                                title: Column(
                                  children: [
                                    SizedBox(
                                        height: 90,
                                        child: Icon(
                                            Icons.done
                                        )),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "تم الحفظ بنجاح",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.greenAccent,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              );
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: FittedBox
                                (
                                child: Text(
                                  "حفظ",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),



                      ],),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(top:50,right: 15),
                    child: Text("* تتم إضافة الكلمات الجديدة للتطبيق بشكل دوري كل 6 أشهر",
                      style: TextStyle(
                          fontSize:  15 ,
                          color: Colors.black

                      ),),
                  )
                ],
              ),),



            ],

          ),
        ),
      ),
    );
  }
}
