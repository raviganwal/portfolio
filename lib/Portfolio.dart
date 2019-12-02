import 'dart:convert';
import 'dart:js' as js;

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
  static String projects = "https://raviganwal.github.io/project.json";
  List<Project> mListAndroid = List();
  List<Project> mListIos = List();
  List<Project> mListPhp = List();

  @override
  void initState() {
    super.initState();
    getProjects();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Portfolio app - Made with flutter"),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'assets/images/back.jpg',
                fit: BoxFit.cover,
              )),
          SingleChildScrollView(
            child: Container(
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
                  Text(
                    Lang.fName + ' ' + Lang.lName,
                    style: Theme.of(context).textTheme.title,
                  ),
                  Padding(padding: EdgeInsets.only(top: 8)),
                  Text(
                    Lang.designation,
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                  Padding(padding: EdgeInsets.only(top: 16)),
                  Text(
                    Lang.contactMe1,
                    style: Theme.of(context).textTheme.subtitle,
                    textAlign: TextAlign.center,
                  ),
                  Padding(padding: EdgeInsets.only(top: 8)),
                  Text(
                    Lang.contactMe2,
                    style: Theme.of(context).textTheme.title,
                    textAlign: TextAlign.center,
                  ),
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
                      SelectableText(
                        '+91-8962328415',
                        style: Theme.of(context).textTheme.title,
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.google),
                      Padding(padding: EdgeInsets.only(left: 8)),
                      SelectableText(
                        'raviganwal1992@gmail.com',
                        style: Theme.of(context).textTheme.title,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(FontAwesomeIcons.stackOverflow),
                          onPressed: () {
                            js.context.callMethod("open", [
                              'https://stackoverflow.com/users/5734205/ravinder-kumar?tab=profile'
                            ]);
                          }),
                      Container(
                        height: 16,
                        width: 1,
                        color: Colors.grey,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      IconButton(
                          icon: Icon(FontAwesomeIcons.github),
                          onPressed: () {
                            js.context.callMethod(
                                "open", ['https://raviganwal.github.io/']);
                          }),
                    ],
                  ),
                  if (mListAndroid != null)
                    Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(16)),
                        android(),
                        Divider(
                          color: Colors.white54,
                          thickness: 2,
                          endIndent: 16,
                          indent: 16,
                          height: 100,
                        ),
                        ios(),
                        Divider(
                            color: Colors.white54,
                            thickness: 2,
                            endIndent: 16,
                            indent: 16,
                            height: 100),
                        php()
                      ],
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  int calcSize(double width) {
//    if (width < 700)
//      return 1;
//    else if (width > 700 && width < 1100)
//      return 2;
//    else
    return 1;
  }

  Future<String> getProjects() async {
    NetworkRepository().getRequest(projects).then((onValue) {
      var dataConvertedToJSON = json.decode(onValue);
      setState(() {
        ProjectModel model = ProjectModel.fromJson(dataConvertedToJSON);
//        print(model);
        mListAndroid.addAll(model.androidProject);
        mListIos.addAll(model.iosProject);
        mListPhp.addAll(model.phpProject);
        for (var model in mListAndroid) {
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
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Icon(
                Icons.android,
                size: 35,
              ),
              Padding(padding: EdgeInsets.only(left: 8)),
              Text(
                Lang.androidProject,
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 8)),
          ListView.builder(
            shrinkWrap: true,
            itemCount: mListAndroid.length,
            itemBuilder: (context, int) {
              Project model = mListAndroid[int];
              return Card(
                  child: InkWell(
                onTap: () {
                  js.context.callMethod("open", [model.url]);
                },
                child: Row(
                  children: <Widget>[
                    FadeInImage.assetNetwork(
                      height: 100,
                      width: 100,
                      placeholder: 'assets/images/loading.gif',
                      image: '${model.logo}',
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 16)),
                    Expanded(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${model.title}',
                          style: Theme.of(context).textTheme.title,
                        ),
                        Text('${model.url}',
                            style: Theme.of(context).textTheme.subtitle),
                      ],
                    )),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 16)),
                    Icon(FontAwesomeIcons.googlePlay),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 16)),

//                    ListTile(
//                      onTap: () {
//                        _launchURL(model.url);
//                      },
//                      leading: ,
//                      title: ,
//                      subtitle: Text('${model.url}'),
//                      trailing: ,
//                    ),
                  ],
                ),
              ));
            },
          )
        ],
      ),
    );
  }

  Widget ios() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.phone_iphone,
                size: 35,
              ),
              Padding(padding: EdgeInsets.only(left: 8)),
              Text(
                Lang.iosProject,
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 8)),
          ListView.builder(
            shrinkWrap: true,
            itemCount: mListIos.length,
            itemBuilder: (context, int) {
              Project model = mListIos[int];
              return Card(
                child: InkWell(
                  onTap: () {
                    js.context.callMethod("open", [model.url]);
                  },
                  child: Row(
                    children: <Widget>[
                      FadeInImage.assetNetwork(
                        height: 100,
                        width: 100,
                        placeholder: 'assets/images/loading.gif',
                        image: '${model.logo}',
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 16)),
                      Expanded(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${model.title}',
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text('${model.url}',
                              style: Theme.of(context).textTheme.subtitle),
                        ],
                      )),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 16)),
                      Icon(FontAwesomeIcons.googlePlay),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 16)),

//                    ListTile(
//                      onTap: () {
//                        _launchURL(model.url);
//                      },
//                      leading: ,
//                      title: ,
//                      subtitle: Text('${model.url}'),
//                      trailing: ,
//                    ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget php() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.web,
                size: 35,
              ),
              Padding(padding: EdgeInsets.only(left: 8)),
              Text(
                Lang.web,
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 8)),
          ListView.builder(
            shrinkWrap: true,
            itemCount: mListPhp.length,
            itemBuilder: (context, int) {
              Project model = mListPhp[int];
              return Card(
                  child: InkWell(
                onTap: () {
                  js.context.callMethod("open", [model.url]);
                },
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: FadeInImage.assetNetwork(
                        height: 100,
                        width: 100,
                        placeholder: 'assets/images/loading.gif',
                        image: '${model.logo}',
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 16)),
                    Expanded(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${model.title}',
                          style: Theme.of(context).textTheme.title,
                        ),
                        Text('${model.url}',
                            style: Theme.of(context).textTheme.subtitle),
                      ],
                    )),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 16)),
                    Icon(FontAwesomeIcons.googlePlay),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 16)),

//                    ListTile(
//                      onTap: () {
//                        _launchURL(model.url);
//                      },
//                      leading: ,
//                      title: ,
//                      subtitle: Text('${model.url}'),
//                      trailing: ,
//                    ),
                  ],
                ),
              ));
            },
          )
        ],
      ),
    );
  }
}
