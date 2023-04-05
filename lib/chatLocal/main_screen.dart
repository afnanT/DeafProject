import 'package:flutter/material.dart';
import 'package:tawasal/addNewData.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<List> boxContent = [];
  List<List> predictionWord = [
    ["يومًا", "assets/gifs/day.gif"],
    ["أولًا", "assets/gifs/First.gif"],
    ["أكثر", "assets/gifs/more.gif"],
    ["أقل", "assets/gifs/less.gif"],
    ["أيام", "assets/gifs/days.gif"],
    ["إلغاء", "assets/gifs/Cansal.gif"],
    ["اسمي", "assets/gifs/MyName.gif"],
    ["استطيع", "assets/gifs/Ican.gif"],
    ["اسم", "assets/gifs/name.gif"],
    ["اشهر", "assets/gifs/months.gif"],
    ["الحالة", "assets/gifs/status.gif"],
    ["الحالي", "assets/gifs/current.gif"],
    ["الوالدين", "assets/gifs/parents.gif"],
    ["شكرًا", "assets/gifs/thank_you.gif"],
  ];
  @override
  void initState() {
    setState(() {
      boxContent.add(
        ["يومًا", "assets/gifs/day.gif"],
      );
      boxContent.add(
        ["اسم", "assets/gifs/name.gif"],
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 85,
              decoration: BoxDecoration(color: Color(0xff787878)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/Back icon.png",
                      height: 23,
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
            Expanded(
                child: ListView(
                  children: [],
                )),
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 199, 198, 198),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: Image.asset(
                                "assets/Send Button.png",
                                height: 50,
                              ),
                            ),
                            Expanded(
                                child: Container(
                                  height: 90,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      for (int i = 0; i < boxContent.length; i++)
                                        Container(
                                          height: 80,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10)),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            boxContent[i][1]))),
                                              ),
                                              Expanded(
                                                  child: Text(
                                                    boxContent[i][0],
                                                    style: TextStyle(fontSize: 20),
                                                  ))
                                            ],
                                          ),
                                        )
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  getPred(predictionWord[0][0], predictionWord[0][1]),
                                  getPred(predictionWord[0][0], predictionWord[0][1]),
                                  getPred(predictionWord[0][0], predictionWord[0][1]),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  getPred(predictionWord[0][0], predictionWord[0][1]),
                                  getPred(predictionWord[0][0], predictionWord[0][1]),
                                  getPred(predictionWord[0][0], predictionWord[0][1]),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  getPred(predictionWord[0][0], predictionWord[0][1]),
                                  getPred(predictionWord[0][0], predictionWord[0][1]),
                                  getPred(predictionWord[0][0], predictionWord[0][1]),
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                )),
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 199, 198, 198),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/Library Button.png",
                      height: 30,
                    ),
                    Image.asset(
                      "assets/SL Button.png",
                      height: 38,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

getPred(text, img) {
  return Container(
    height: 65,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    child: Column(
      children: [
        Container(
          height: 40,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: AssetImage(img))),
        ),
        Expanded(
            child: FittedBox(
              child: Text(
                text,
                style: TextStyle(fontSize: 20),
              ),
            ))
      ],
    ),
  );
}
