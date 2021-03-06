
import 'package:flutter/material.dart';
import 'package:testpust/GodmorgenSoundPage.dart';
import 'package:testpust/global_strings.dart';
import 'package:testpust/soundfile.dart';
import 'DitUdbytte.dart';
import 'Profil.dart';
import 'PlaySong.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'DatabaseHelper.dart';
import 'package:testpust/ListSoundFiles.dart';


class FavoritPage extends StatefulWidget {
  FavoritPage({Key key, this.soundFile}) : super(key: key);

  final SoundFile soundFile;



  static String tag = 'FavoritPage';
  @override
  _FavoritPageState createState() => _FavoritPageState(soundFile: this.soundFile);

}

class _FavoritPageState extends State<FavoritPage>{
  _FavoritPageState({this.soundFile});
  SoundFile soundFile;
  GodmorgenSoundPage godmorgenSoundPage;
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<SoundFile> soundfileList;
  int count = 0;



  @override
  Widget build(BuildContext context) {
    if (soundfileList == null) {
      soundfileList = List<SoundFile>();
      updateListView();
    }
      return Scaffold(
          appBar: AppBar(
              title: Text('Favoritter'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.home, size: 35, color: Color.fromRGBO(142, 210, 238, 1.0)),
                  //icon: new Image.asset(heartFilledAppBarImage,),
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
                      child: new ListView.builder(
                        itemCount: count,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            child: Card(
                                color: Color.fromRGBO(241, 242, 245, 0.8),
                                child: new ListTile(
                                  title: Text(this.soundfileList[index].title, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
                                  leading: CircleAvatar(
                                    backgroundImage: AssetImage(this.soundfileList[index].imagepath),

                                  ),
                                  subtitle: Text(this.soundfileList[index].description, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PlaySong(
                                                  soundFile: this.soundfileList[index]),
                                        )
                                    );
                                  },
                          /*        onLongPress: () {
                                    _deleteSoundfileFromDB(index);
                                  },*/
                                )
                            ),
                            background: Container(
                              color: Colors.red,
                              child: Icon(Icons.cancel),
                            ),
                            onDismissed: (endToStart) {
                              setState(() {
                                _deleteSoundfileFromDB(index);
                              });
                              Scaffold.of(context)
                              .showSnackBar(SnackBar(content: Text("Afspændingssekvens fjernet fra favoritter"),));
                            },
                            key: UniqueKey()
                          );
/*                        return Card(
                          color: Color.fromRGBO(241, 242, 245, 0.8),
                            child: new ListTile(
                              title: Text(this.soundfileList[index].title, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(this.soundfileList[index].imagepath),

                              ),
                              subtitle: Text(this.soundfileList[index].description, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PlaySong(
                                              soundFile: this.soundfileList[index]),
                                    )
                                );
                              },
                              onLongPress: () {
                                _deleteSoundfileFromDB(index);
                              },
                        )
                        );*/
                        },
                      ),
                    ),
                  ),
                ),
          ),
          bottomNavigationBar: new Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Color.fromRGBO(48, 121, 169, 1.0)
            ),
            child: new BottomNavigationBar(
              // Gets the index of the pressed item. Switch case is used for redirecting to
              // the different pages
              onTap: (int index) {
                switch(index){
                  case 0:
                  //TODO Redirect to Facebook
                    break;
                  case 1:
                  //TODO Redirect to Instagram
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

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<SoundFile>> soundfileListFuture = databaseHelper.getSoundfileList();
      soundfileListFuture.then((soundfileList) {
        setState(() {
          this.soundfileList = soundfileList;
          this.count = soundfileList.length;
        });
      });
    });
  }

  void _deleteSoundfileFromDB(int index) async {
    await databaseHelper.deleteSoundfile(this.soundfileList[index].id);
    updateListView();
  }



    /*Widget _cardGodmorgenSoundFile1( ) {
      return new Card(
          color: Color.fromRGBO(241, 242, 245, 0.8),
          child: new Container(
            child: ListTile(
                title: Text("Godmorgen2"),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/CupWhite.png'),
                ),
                subtitle: Text("Stående afspænding \n" + "11:27 min"),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PlaySong(
                                soundFile: SoundFile('music/Godmorgen.mp3', 'assets/images/CupWhite.png', "Godmorgen",
                                    "Stående afspænding \n" + "11:27 min") ),
                      )
                  );
                }

            ),
          )
      );
    }*/
  }