import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Youtube translate'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, String> eng_to_tw = {
    "Protoss": "神族",
    "Zerg": "蟲族",
    "Terran": "人族",
    "Random": "隨機"
  };

  Map<String, String> eng_to_ja = {
    "Protoss": "プロトス",
    "Zerg": "ザーグ",
    "Terran": "テラン",
    "Random": "ランダム"
  };

  Map<String, String> eng_to_kr = {
    "Protoss": "프로토스",
    "Zerg": "저그",
    "Terran": "테란",
    "Random": "랜덤"
  };

  Map<String, String> eng_to_ch = {
    "Protoss": "神族",
    "Zerg": "虫族",
    "Terran": "人类",
    "Random": "随机"
  };

  String miss =
      "StarCraft II,Protoss,Zerg,Nzx,Mzx,Mzs,906906,906,九妹,藍兔,Hui,mrbeast,館長,IEM,ESL,SC2,StarCraft,Onion Man";

  TextEditingController controller = TextEditingController();
  String tw = "";
  String en = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: TextField(
                controller: controller,
                onChanged: (text) {
                  setState(() {

                    var temp = translate(text);
                    en = temp;
                    eng_to_tw.entries.forEach((element) {
                      temp = temp.replaceAll(element.key, element.value);
                    });
                    tw = temp;
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                await Clipboard.setData(ClipboardData(text: tw));
              },
              child: Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Text(
                    tw,
                    style: TextStyle(fontSize: 24),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                await Clipboard.setData(ClipboardData(text: en));
              },
              child: Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Text(
                    en,
                    style: TextStyle(fontSize: 24),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                await Clipboard.setData(
                    ClipboardData(text: "#startcraft2 #星海爭霸2 #gaming"));
              },
              child: Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Text(
                    "#startcraft2 #星海爭霸2 #gaming",
                    style: TextStyle(fontSize: 24),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                await Clipboard.setData(ClipboardData(text: miss));
              },
              child: Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Text(
                    "Miss",
                    style: TextStyle(fontSize: 24),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  String translate(String input) {
    RegExp regex = RegExp(r'\b\d{4}\b');

    int count = 0;
    for (Match match in regex.allMatches(input)) {
      if (count >= 2) {
        break;
      }
      input = input.replaceAll(match.group(0)!, "${match.group(0)})");
      count++;
    }

    var list = ["Protoss", "Terran", "Zerg"];
    for (var element in list) {
      input = input.replaceAll(element, "($element");
    }

    String modifiedText = input.replaceAllMapped(
      RegExp(r'(\d{4}) (\d+) (\d+) .*'),
      (match) {
        return '${match.group(1)}-${match.group(2)}-${match.group(3)}';
      },
    );
    return modifiedText;
  }
}
