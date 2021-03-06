import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testpust/Subscription.dart';
//import 'package:testpust/ListSoundFiles.dart';
import 'DitUdbytte.dart';
import 'Profil.dart';
import 'ListSoundFiles.dart';
import 'Forside.dart';

void main() async {
  // fix screen orientation
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new ListSoundFiles(),
    routes: <String, WidgetBuilder>{
      DitUdbytte.tag: (BuildContext context) => new DitUdbytte(),
      ListSoundFiles.tag: (BuildContext context) => new ListSoundFiles(),
      Erfaringsgrundlag.tag: (BuildContext context) => new Erfaringsgrundlag(),
      Subscription.tag: (BuildContext context) => new Subscription(),
      Forside.tag: (BuildContext context) => new Forside()
    },
  ));
}
