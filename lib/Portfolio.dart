import 'dart:convert';

import 'package:aboutme/NetworkRepository.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'AndroidProjectModel.dart';
import 'Lang.dart';

class Portfolio extends StatefulWidget {
  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  static String projects = "https://raviganwal.github.io/project.json";
  List<Data> mList = List();

  @override
  void initState() {
    super.initState();
    getProjects();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(title: Text(Lang.appBarTitle),
        centerTitle: true,),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
//            Image.asset('assets/images/back.jpg', fit: BoxFit.cover,),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//              decoration: BoxDecoration(
//                  image: DecorationImage(
//                    image: AssetImage(
//                        'assets/images/background.jpg'),
//                    fit: BoxFit.fill,
//                  )),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  CircleAvatar(
                    radius: 70.0,
                    backgroundImage: NetworkImage(
                        'https://avatars0.githubusercontent.com/u/22388017?s=460&v=4'),
                  ),
                  Padding(padding: EdgeInsets.only(top: 16)),
                  Text(Lang.fName + ' ' + Lang.lName, style: Theme
                      .of(context)
                      .textTheme
                      .title,),
                  Padding(padding: EdgeInsets.only(top: 8)),
                  Text(Lang.designation, style: Theme
                      .of(context)
                      .textTheme
                      .subtitle,),
                  Padding(padding: EdgeInsets.only(top: 16)),
                  Text(Lang.contactMe1, style: Theme
                      .of(context)
                      .textTheme
                      .subtitle
                    , textAlign: TextAlign.center,),
                  Padding(padding: EdgeInsets.only(top: 8)),
                  Text(Lang.contactMe2, style: Theme
                      .of(context)
                      .textTheme
                      .title,
                    textAlign: TextAlign.center,),
                  Padding(padding: EdgeInsets.only(top: 16)),
//              Text(Lang.contactMe3, style: Theme
//                  .of(context)
//                  .textTheme
//                  .title,
//                textAlign: TextAlign.center,),
//              RichText(
//                text: TextSpan(
//                  text: Lang.contactMe1,
//                  style: Theme
//                      .of(context)
//                      .textTheme
//                      .title
//                      .copyWith(
//                      fontStyle: FontStyle.italic, letterSpacing: 1.0),
//                  children: <TextSpan>[
//                    TextSpan(text: Lang.contactMe2,
//                        style: TextStyle(fontWeight: FontWeight.bold)),
//                    TextSpan(text: Lang.contactMe3),
//                  ],
//                ),
//              )
//                  Padding(padding: EdgeInsets.symmetric(vertical: 16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.whatsapp),
                      Padding(padding: EdgeInsets.only(left: 8)),
                      SelectableText('+91-8962328415', style: Theme
                          .of(context)
                          .textTheme
                          .title,)
                    ],
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.google),
                      Padding(padding: EdgeInsets.only(left: 8)),
                      SelectableText(
                        'raviganwal1992@gmail.com', style: Theme
                          .of(context)
                          .textTheme
                          .title,)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(icon: Icon(FontAwesomeIcons.stackOverflow),
                          onPressed: () {
                            _launchURL(
                                'https://stackoverflow.com/users/5734205/ravinder-kumar?tab=profile');
                          }),
                      Container(height: 16,
                        width: 1,
                        color: Colors.grey,
                        padding: EdgeInsets.symmetric(horizontal: 16),),
                      IconButton(icon: Icon(FontAwesomeIcons.github),
                          onPressed: () {}),
                    ],),
                  if(mList != null)
                    GridView.count(
                        shrinkWrap: true,
                        // Create a grid with 2 columns. If you change the scrollDirection to
                        // horizontal, this produces 2 rows.
                        crossAxisCount
                            : calcSize(width),
                        // Generate 100 widgets that display their index in the List.
                        children: <Widget>[
                          android(),
                        ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int calcSize(double width) {
    if (width < 700)
      return 1;
    else if (width > 700 && width < 1100)
      return 2;
    else
      return 3;
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<String> getProjects() async {
    NetworkRepository().getRequest(projects).then((onValue) {
      var dataConvertedToJSON = json.decode(onValue);
      setState(() {
        AndroidProjectModel model = AndroidProjectModel.fromJson(
            dataConvertedToJSON);
//        print(model);
        mList.addAll(model.data);
        for (var model in mList) {
          print(model.title);
        }
      });
    });
    return 'success';
  }

  Widget android() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.android),
              Text(Lang.androidProject, style: Theme
                  .of(context)
                  .textTheme
                  .title,),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 8)),
          ListView.builder(
            shrinkWrap: true,
            itemCount: mList.length,
            itemBuilder: (context, int) {
              Data model = mList[int];
              return Card(
                child: ListTile(
                  onTap: () {
                    _launchURL(model.url);
                  },
                  leading: FadeInImage.assetNetwork(
                    height: 100,
                    width: 100,
                    placeholder: 'assets/images/loading.gif',
                    image: '${model.logo}',
                  ),
                  title: Text('${model.title}'),
                  subtitle: Text('${model.url}'),
                  trailing: Icon(FontAwesomeIcons.googlePlay),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}


