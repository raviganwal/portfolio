import 'dart:convert';

import 'package:aboutme/NetworkRepository.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Lang.dart';
import 'ProjectModel.dart';

class Portfolio extends StatefulWidget {
  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  static String projects = " https://raviganwal.github.io/project.json";
  List<ProjectModel> mList;

  @override
  void initState() {
    super.initState();
    getProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Lang.appBarTitle),
        centerTitle: true,),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
                  .title
                  .copyWith(fontWeight: FontWeight.bold, color: Theme
                  .of(context)
                  .colorScheme
                  .secondary),
                textAlign: TextAlign.center,),
              Padding(padding: EdgeInsets.only(top: 8)),
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
              Padding(padding: EdgeInsets.symmetric(horizontal: 16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
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
                  Padding(padding: EdgeInsets.symmetric(horizontal: 16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.google),
                      Padding(padding: EdgeInsets.only(left: 8)),
                      SelectableText('raviganwal1992@gmail.com', style: Theme
                          .of(context)
                          .textTheme
                          .title,)
                    ],
                  ),
                ],
              ),
              Text('Project Completed so far'),
              if(mList != null) Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: mList.length,
                        itemBuilder: (context, int) {
                          ProjectModel model = mList[int];
                          return ListTile(
                            title: Text('${model.title}'),
                          );
                        },
                      )
                  )
                ],)
            ],
          ),
        ),
      ),
    );
  }

//  _launchURL(String url) async {
//    if (await canLaunch(url)) {
//      await launch(url);
//    } else {
//      throw 'Could not launch $url';
//    }
//  }

  void getProjects() async {
    print('dataConvertedToJSON');
    NetworkRepository().getRequest(projects).then((onValue) {
      var dataConvertedToJSON = json.decode(onValue);
      print(dataConvertedToJSON);
      ProjectModel model = ProjectModel.fromJson(dataConvertedToJSON);
      setState(() {
        mList.add(model);
      });
    });
  }
}
