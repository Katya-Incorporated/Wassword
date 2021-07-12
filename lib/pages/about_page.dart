import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wassword/styles/my_colors.dart' as mColors;

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  void initState() {
    super.initState();
  }

  //Custom Widget for the ListTile
  ListTile customListTile({required String text, IconData? icon, String? url}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
        size: 23,
      ),
      title: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
      onTap: () {
        _launchURL(url!);
      },
    );
  }

  //Open the browser with the url provided
  void _launchURL(String urlToLaunch) async {
    if (await canLaunch(urlToLaunch)) {
      await launch(urlToLaunch);
    } else {
      throw 'Could not launch $urlToLaunch';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            color: Colors.white,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: new Text("About",
            style: GoogleFonts.roboto(
              color: Colors.white,
            )),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 0),
                child: Text(
                  "Wassword",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Text(
                "v.${_packageInfo.version}+${_packageInfo.buildNumber}",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              SizedBox(
                height: 48,
              ),
              ListTile(
                title: Text(
                  "DEVELOPER",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 12, color: mColors.colorEnabled),
                ),
              ),
              customListTile(
                  icon: FluentIcons.access_time_24_regular,
                  text: "AlbertoBonacina.com",
                  url: "https://www.albertobonacina.com/"),
              customListTile(
                  icon: FluentIcons.access_time_24_regular,
                  text: "Contact",
                  url: "mailto:bonacina.alberto@gmail.com"),
              customListTile(
                  icon: FluentIcons.access_time_24_regular,
                  text: "Github",
                  url: "https://github.com/polilluminato"),
              customListTile(
                  icon: FluentIcons.access_time_24_regular,
                  text: "Twitter",
                  url: "https://twitter.com/polilluminato"),
              customListTile(
                  icon: FluentIcons.accessibility_16_filled,
                  text: "Linkedin",
                  url: "https://it.linkedin.com/in/bonacinaalberto"),
            ],
          ),
          //An open list of apps built with Flutter
        ],
      ),
    );
  }
}
