import 'package:firebase_database/firebase_database.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tawasal/controller/checktheconnect.dart';
import 'package:tawasal/controller/specialid.dart';

uploadNewData(String text) {
  try {
    String d = getSpecialid();
    internetConnection().then((value) async {
      if (value == true) {
        DatabaseReference ref = FirebaseDatabase.instance.ref("newdata/");
        SharedPreferences pref2 = await SharedPreferences.getInstance();
        List<String> dataCache = pref2.getStringList("realtime") ?? [];

        for (var element in dataCache) {
          String s = getSpecialid();

          await ref.update({s: element});
        }

        await ref.update({d: text});
        pref2.setStringList("realtime", []);
      } else {
        SharedPreferences pref = await SharedPreferences.getInstance();
        List<String> data = pref.getStringList("realtime") ?? [];
        data.add(text);
        pref.setStringList("realtime", data);
      }
    });
  } catch (_) {}
}
