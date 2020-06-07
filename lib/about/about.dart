import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/SmXxb6D.png'),
              ),
              Text(
                'Rashed Sahajee',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  color: Colors.yellow.shade100,
                  fontSize: 10.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              InkWell(
                onTap: ()=> launch('https://github.com/rashedsahaji'),
                child: Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        LineAwesomeIcons.github,
                        color: Color.fromRGBO(58, 66, 86, 1.0),
                        size: 30,
                      ),
                      title: Text(
                        'Github.Com/RashedSahaji',
                        style: TextStyle(
                          color: Color.fromRGBO(58, 66, 86, 1.0),
                          fontSize: 16.0,
                        ),
                      ),
                    )),
              ),
              InkWell(
                onTap: ()=> launch('https://rashed.works'),
                child: Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Color.fromRGBO(58, 66, 86, 1.0),
                      ),
                      title: Text(
                        'rashedsahaji@gmail.com',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Color.fromRGBO(58, 66, 86, 1.0),
                            ),
                      ),
                    )),
              )
            ],
          )),
    );
  }
}
