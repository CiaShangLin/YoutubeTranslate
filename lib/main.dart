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

  String miss="StarCraft II,Protoss,Zerg,Nzx,Mzx,Mzs,906906,906,九妹,藍兔,Hui,mrbeast,館長,IEM,ESL,SC2,StarCraft,Onion Man";

  TextEditingController controller = TextEditingController();
  String tw = "";
  String ch = "";
  String ja = "";
  String kr = "";

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
                    var temp = text;
                    eng_to_tw.entries.forEach((element) {
                      temp = temp.replaceAll(element.key, element.value);
                    });
                    tw = temp;

                    temp = text;
                    eng_to_ch.entries.forEach((element) {
                      temp = temp.replaceAll(element.key, element.value);
                    });
                    ch = temp;

                    temp = text;
                    eng_to_ja.entries.forEach((element) {
                      temp = temp.replaceAll(element.key, element.value);
                    });
                    ja = temp;

                    temp = text;
                    eng_to_kr.entries.forEach((element) {
                      temp = temp.replaceAll(element.key, element.value);
                    });
                    kr = temp;
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
                await Clipboard.setData(ClipboardData(text: ch));
              },
              child: Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Text(ch,
                    style: TextStyle(fontSize: 24),)),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                await Clipboard.setData(ClipboardData(text: ja));
              },
              child: Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Text(ja,
                    style: TextStyle(fontSize: 24),)),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                await Clipboard.setData(ClipboardData(text: kr));
              },
              child: Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Text(kr,
                    style: TextStyle(fontSize: 24),)),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                await Clipboard.setData(
                    ClipboardData(text: "#startcraft2 #星海爭霸 #gaming"));
              },
              child: Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Text("#startcraft2 #星海爭霸 #gaming",
                    style: TextStyle(fontSize: 24),)),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                await Clipboard.setData(
                    ClipboardData(text: miss));
              },
              child: Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Text("Miss",
                    style: TextStyle(fontSize: 24),)),
            ),
          ],
        ),
      ),
    );
  }
}
