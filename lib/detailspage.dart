import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:tasbih/models//lesson.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Lesson lesson;
  DetailPage({Key key, this.lesson}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 60.0),
        Icon(
          LineAwesomeIcons.book,
          color: Colors.white,
          size: 20.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.yellow),
        ),
        Text(
          widget.lesson.title,
          style: TextStyle(color: Colors.white, fontSize: 30.0),
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 6,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      widget.lesson.subtitle,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ))),
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.37,
          padding: EdgeInsets.all(30.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = Column(
      children: <Widget>[
        Text(
          widget.lesson.arabic,
          style: TextStyle(fontSize: 25.0),
        ),
        Text(
          widget.lesson.content,
          style: TextStyle(fontSize: 18.0),
        ),
      ],
    );
    final spa = SizedBox(
      height: 11,
    );
    final counterBos = Expanded(
      flex: 0,
      child: InkWell(
        onTap: () {
          setState(() {
            _counter++;
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 210,
          color: Color.fromRGBO(58, 66, 86, .9),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Icon(
                Icons.add,
                size: 80,
                color: Colors.white30,
              ),
              Text(
                "Tap to Count",
                style: TextStyle(fontSize: 18, color: Colors.white30),
              )
            ],
          ),
        ),
      ),
    );
    final readButton = Row(
      children: <Widget>[
        SizedBox(
          width: 45,
        ),
        InkWell(
            onTap: () {
              setState(() {
                _counter=0;
              });
            },
            child: CircleAvatar(
              maxRadius: 30,
              backgroundColor: Colors.yellow,
              child: Icon(Icons.refresh,
                  color: Color.fromRGBO(
                    58,
                    66,
                    86,
                    .9,
                  )),
            )),
        SizedBox(
          width: 130,
          child: Center(
              child: Text(
            '$_counter',
            style: TextStyle(fontSize: 25),
          )),
        ),
        InkWell(
            onTap: () {
              setState(() {
                if (_counter <= 0) {
                  _counter = 0;
                } else {
                  _counter--;
                }
              });
            },
            child: CircleAvatar(
              maxRadius: 30,
              backgroundColor: Colors.yellow,
              child: Icon(Icons.remove,
                  color: Color.fromRGBO(
                    58,
                    66,
                    86,
                    .9,
                  )),
            )),
      ],
    );

    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, spa, counterBos,spa, readButton],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}
