import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:tasbih/about/about.dart';
import 'package:tasbih/models//lesson.dart';
import 'package:flutter/material.dart';
import 'package:tasbih/detailspage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tasbih',
      theme: new ThemeData(
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0), fontFamily: 'Raleway'),
      home: new ListPage(title: 'Tasbih | تَسْبِيح'),
      // home: DetailPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List lessons;

  @override
  void initState() {
    lessons = getLessons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Lesson lesson) => ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(Icons.book, color: Colors.white),
      ),
      title: Text(
        lesson.title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                // tag: 'hero',
                child: Text(lesson.arabic, style: TextStyle(color: Colors.yellow),),
              )),
          Expanded(
            child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(lesson.subtitle,
                    style: TextStyle(color: Colors.white))),
          )
        ],
      ),
      trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(lesson: lesson)));
      },
    );

    Card makeCard(Lesson lesson) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: makeListTile(lesson),
      ),
    );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: lessons.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(lessons[index]);
        },
      ),
    );
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text(widget.title),
      actions: <Widget>[
        IconButton(
          icon: Icon(LineAwesomeIcons.info_circle),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => About()));
          },
        )
      ],
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      body: makeBody,
    );
  }
}

List getLessons() {
  return [
    Lesson(
        title: "SubhanAllah",
        subtitle: "Glory be to Allah",
        content:"A tree will be planted for you in Paradise",
        arabic: "سبحان الله"
    ),
    Lesson(
        title: "Alhamdulillah",
        arabic: "الحمد لله",
        subtitle: "All praise is for Allah",
        content:"Your scales will be tipped on the Day of judgment, full of rewards!"),
    Lesson(
        title: "Astaghfirullah",
        arabic: "أستغفر",
        subtitle: "I seek Allah's forgiveness",
        content:"You will get protection from Allah's punishment"),
    Lesson(
        title: "Allahu Akbar",
        arabic: "الله أكبر",
        subtitle: "God is greatest",
        content:"Allahu akbar a 100 times carries the reward for making a 100 sacrifices"),
    Lesson(
        title: "La ilaha illa Allah",
        arabic: "لا إله إلا الله",
        subtitle: "There is no god but Allah",
        content:"When you say La ilaha illa Allah, sin fall off of you like leaves off of trees"),
    Lesson(
        title: "La hawla wa la quwwata illa billah",
        arabic: "لا حول ولا قوة إلا بالله",
        subtitle: "There is no power or strength except with Allah.",
        content:"You will enter through a special door in Paradise."),
    Lesson(
        title: "Subhanallahi wa bihamdihi",
        arabic: "سُبْحَانَ ٱللَّٰهِ وَبِحَمْدِهِ",
        subtitle: "Glory and praise be to Allah.",
        content:"Glorified is Allah and by His praise.")
  ];
}