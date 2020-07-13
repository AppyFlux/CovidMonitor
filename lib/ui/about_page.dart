import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class AboutPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var card = new Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      elevation: 7,
      child: new Column(
        children: <Widget>[
          Container(
            height: 170,
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Image.asset("images/logo.png", height: 120, width: 120,),
                Text("This app is developed by ArgonLabs", style: new TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                Text("With ❤ from india.", style: new TextStyle(fontWeight: FontWeight.w600, fontSize: 16),)
              ],
            ),
          ),
          new Divider(color: Colors.blue,indent: 16.0,),
          new ListTile(
            onTap: () async {
              final Email email = Email(
                body: '',
                subject: '',
                recipients: ['hello@argonlabs.in'],
                isHTML: false,
              );

              await FlutterEmailSender.send(email);
            },
            leading: new Icon(FontAwesomeIcons.envelope, color: Colors.deepPurple, size: 26.0,),
            title: new Text("Give Feedback Here"
              ,style: new TextStyle(fontWeight: FontWeight.w600),),
          ),
          new ListTile(
            onTap: () async {
              const url = 'https://www.facebook.com/ArgonLabs/';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            leading: new Icon(FontAwesomeIcons.facebook, color: Colors.deepPurple, size: 26.0,),
            title: new Text("Facebook Page"
              ,style: new TextStyle(fontWeight: FontWeight.w600),),
          ),
          new ListTile(
            onTap: () async {
              const url = 'https://instagram.com/argonlabs';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            leading: new Icon(FontAwesomeIcons.instagram, color: Colors.deepPurple, size: 26.0,),
            title: new Text("Follow us on Instagram"
              ,style: new TextStyle(fontWeight: FontWeight.w600),),
          ),
          new ListTile(
            onTap: () async {
              const url = 'https://www.linkedin.com/company/argonlabs/';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            leading: new Icon(FontAwesomeIcons.linkedin, color: Colors.deepPurple, size: 26.0,),
            title: new Text("LinkedIn Page"
              ,style: new TextStyle(fontWeight: FontWeight.w600),),
          ),
          new ListTile(
            onTap: () async {
              const url = 'https://twitter.com/Argonlabs';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            leading: new Icon(FontAwesomeIcons.twitter, color: Colors.deepPurple, size: 26.0,),
            title: new Text("Follow us on Twitter"
              ,style: new TextStyle(fontWeight: FontWeight.w600),),
          ),
          new ListTile(
            onTap: () async {
              const url = 'https://argonlabs.in/';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            leading: new Icon(FontAwesomeIcons.paperPlane, color: Colors.deepPurple, size: 26.0,),
            title: new Text("Check out our HomePage"
              ,style: new TextStyle(fontWeight: FontWeight.w600),),
          ),
        ],
      ),
    );
    final sizedBox = new Container(
      margin: new EdgeInsets.only(left: 10.0, right: 10.0),
      child: new SizedBox(
        height: 540,
        child: card,
      ),
    );
    final center = new Center(
      child: sizedBox,
    );
    return new MaterialApp(
theme: ThemeData(
  fontFamily: 'Louis'
),
debugShowCheckedModeBanner: false,
//      home: new Text("Add Google fonts to Flutter App")
        home: new Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: <Widget>[
              Image.asset("images/About1.png", height: 150, width: 150,),
              center
            ],
          )
        )
    );
  }
}
