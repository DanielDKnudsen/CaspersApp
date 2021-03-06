import 'package:flutter/material.dart';
import 'package:testpust/global_strings.dart';
import 'soundfile.dart';
import 'DitUdbytte.dart';
import 'Profil.dart';
import 'PlaySong.dart';
import 'FavoritPage.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';
import 'ListSoundFiles.dart';


class GodmorgenSoundPage extends StatefulWidget {
  static String tag = 'GodmorgenSoundPage';
  @override
  State<StatefulWidget> createState() {
    return GodmorgenSoundPageState();
  }



}

class GodmorgenSoundPageState extends State<GodmorgenSoundPage>{
  int index = 0;
  FavoritPage favoritPage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Godmorgen'),
            actions: <Widget>[
              IconButton(
                icon: new Image.asset(heartFilledAppBarImage),
                  onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => FavoritPage()
                    )
                    );
                  },
              ),
              IconButton(
                icon: Icon(Icons.home, size: 35, color: Color.fromRGBO(142, 210, 238, 1.0)),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => ListSoundFiles()
                  )
                  );
                },
              )
            ],
            //TODO add backgroundColor and opacity. What colour should the text be?
            backgroundColor: Color.fromRGBO(48, 121, 169, 1.0 )
        ),
        body: new Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(backgroundImage),
                  fit: BoxFit.fill,
                )
            ) ,

            child: new Center(
              child: new Container(
                padding: EdgeInsets.all(5.0),
                color: Color.fromRGBO(241, 242, 245, 0.4),
                height: 400,
                width: 350,
                child: new Center(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      cardGodmorgenSoundFile0(index),
                      cardGodmorgenSoundFile1(index),
                      cardGodmorgenSoundFile2(index),
                      cardGodmorgenSoundFile3(index),
                      cardGodmorgenSoundFile4(index),
                    ],
                ),
                ),
              ),

            )
        ),
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Color.fromRGBO(48, 121, 169, 1.0)
          ),
          child: new BottomNavigationBar(
            // Gets the index of the pressed item. Switch case is used for redirecting to
            // the different pages
            //currentIndex: _currentIndex,
            onTap: (int index) {
              switch(index){
                case 0:
                //Redirects to Facebook
                  launchURL(facebookURL);
                  break;
                case 1:
                //Redirects to Instagram
                  launchURL(instagramURL);
                  break;
                case 2:
                // Redirects to Dit Udbytte / Formål
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DitUdbytte()));
                  break;
                case 3:
                // Redirects to Erfaringsgrundlag
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Erfaringsgrundlag()));
                  break;
              }
            },
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem> [
              new BottomNavigationBarItem(
                //Icon for FB
                icon: new Image.asset(facebookImage,
                  height: 40,
                  width: 60,),
                title: Text(''),
              ),
              new BottomNavigationBarItem(
                //Icon for Instagram
                  icon: new Image.asset(instagramImage,
                    height: 40,
                    width: 60,),
                  title: new Text('')
              ),
              new BottomNavigationBarItem(
                //Icon for Formaal page
                icon: new Image.asset(formaalImage,
                  height: 40,
                  width: 60,),
                title: new Text(''),
              ),
              new BottomNavigationBarItem(
                //Icon for Erfaringsgrundlag page
                icon: new Image.asset(erfaringsgrundlagImage,
                  height: 40,
                  width: 60,),
                title: new Text(''),
              ),
            ],
          ),
        )
    );
  }

  Widget cardGodmorgenSoundFile0(int index) {
    return new Card(
        color: Color.fromRGBO(241, 242, 245, 0.8),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
           actionExtentRatio: 0.25,
            child: new Container(
              child: ListTile(
                title: Text(godmorgenSoundFiles[0].title, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(godmorgenSoundFiles[0].imagepath),

                ),
                subtitle: Text(godmorgenSoundFiles[0].description, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
                trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PlaySong(
                                  soundFile: godmorgenSoundFiles[0]),
                        )
                    );
                  },
          ),
        ),
          actions: <Widget>[
            new IconSlideAction(
              caption: "Tilføj til Favorit",
              color: Color.fromRGBO(241, 242, 245, 0.8),
                icon: Icons.ac_unit,
              onTap: () {
                setState(() {
                });
                }
            ),
          ],
        ),
    );
  }

  Widget cardGodmorgenSoundFile1(int index) {
    return new Card(
        color: Color.fromRGBO(241, 242, 245, 0.8),
        child: new Container(
          child: ListTile(

            title: Text(godmorgenSoundFiles[1].title, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            leading: CircleAvatar(
              backgroundImage: AssetImage(godmorgenSoundFiles[1].imagepath),

            ),
            subtitle: Text(godmorgenSoundFiles[1].description, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PlaySong(
                            soundFile: godmorgenSoundFiles[1]),
                  )
              );
            },
          ),
        )
    );
  }

  Widget cardGodmorgenSoundFile2(int index) {
    return new Card(
        color: Color.fromRGBO(241, 242, 245, 0.8),
        child: new Container(
          child: ListTile(

            title: Text(godmorgenSoundFiles[2].title, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            leading: CircleAvatar(
              backgroundImage: AssetImage(godmorgenSoundFiles[2].imagepath),

            ),
            subtitle: Text(godmorgenSoundFiles[2].description, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PlaySong(
                            soundFile: godmorgenSoundFiles[2]),
                  )
              );
            },
          ),
        )
    );
  }

  Widget cardGodmorgenSoundFile3(int index) {
    return new Card(
        color: Color.fromRGBO(241, 242, 245, 0.8),
        child: new Container(
          child: ListTile(

            title: Text(godmorgenSoundFiles[3].title, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            leading: CircleAvatar(
              backgroundImage: AssetImage(godmorgenSoundFiles[3].imagepath),

            ),
            subtitle: Text(godmorgenSoundFiles[3].description, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PlaySong(
                            soundFile: godmorgenSoundFiles[3]),
                  )
              );
            },
          ),
        )
    );
  }

  Widget cardGodmorgenSoundFile4(int index) {
    return new Card(
        color: Color.fromRGBO(241, 242, 245, 0.8),
        child: new Container(
          child: ListTile(

            title: Text(godmorgenSoundFiles[4].title, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            leading: CircleAvatar(
              backgroundImage: AssetImage(godmorgenSoundFiles[4].imagepath),

            ),
            subtitle: Text(godmorgenSoundFiles[4].description, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PlaySong(
                            soundFile: godmorgenSoundFiles[4]),
                  )
              );
            },
          ),
        )
    );
  }

  launchURL(String string) async {
    String url = string;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

List<SoundFile> godmorgenSoundFiles = [
  SoundFile('music/Godmorgen.mp3', 'assets/images/Godmorgen.png', "Godmorgen",
      "Stående afspænding \n" + "11:27 min"),
  SoundFile("music/Frokostpausen.mp3", "assets/images/FrokostPausen.png",
      "Frokostpausen", "Gående afspænding \n" + "10:52 min"),
  SoundFile("music/DagensPusterum.mp3", "assets/images/DagensPusterum.png",
      "Dagens pusterum", "Siddende afspænding \n" + "9:11 min"),
  SoundFile("music/StopopV1.1.mp3", "assets/images/StopOp.png", "Stop op",
      "Liggende afspænding \n" + "12:11 min"),
  SoundFile(
      "music/SovgodtV1.1.mp3", "assets/images/SovGodt.png", "Sov godt",
      "Liggende afspænding \n" + "12:16 min"),
];


