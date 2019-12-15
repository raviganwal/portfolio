import 'dart:convert';
import 'dart:js' as js;

import 'package:aboutme/NetworkRepository.dart';
import 'package:aboutme/NetworkUrl.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Lang.dart';
import 'ProjectModel.dart';

class Portfolio extends StatefulWidget {
  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  List<ProjectModel> mListAndroid = List();
  List<ProjectModel> mListIos = List();
  List<ProjectModel> mListPhp = List();

  @override
  void initState() {
    super.initState();
    getAndroidProjects();
    getIosProjects();
    getWebProjects();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Portfolio - a Flutter App"),
        centerTitle: true,
      ),
      body: Container(
        width: width,
        child: Stack(
          children: <Widget>[
            Container(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/back.jpg',
                  fit: BoxFit.cover,
                )),
            SingleChildScrollView(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black12, Colors.black26],
                      tileMode: TileMode.clamp,
                    ),
                  ),
                  width: 1170,
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//              decoration: BoxDecoration(
//                  image: DecorationImage(
//                    image: AssetImage(
//                        'assets/images/background.jpg'),
//                    fit: BoxFit.fill,
//                  )),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      header(),
                      Column(
                        children: <Widget>[
                          const Padding(padding: EdgeInsets.all(16)),
                          android(),
                          const Divider(
                            color: Colors.white54,
                            thickness: 2,
                            endIndent: 16,
                            indent: 16,
                            height: 100,
                          ),
                          ios(),
                          const Divider(
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
            ),
          ],
        ),
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

  Future<String> getAndroidProjects() async {
    NetworkRepository().getRequest(NetworkUrl.androidProjects).then((onValue) {
      var dataConvertedToJSON = json.decode(onValue);
      setState(() {
        var list = dataConvertedToJSON as List;
        mListAndroid.addAll(list
            .map<ProjectModel>((json) => ProjectModel.fromJson(json))
            .toList());
      });
    });
    return 'success';
  }

  Future<String> getIosProjects() async {
    NetworkRepository().getRequest(NetworkUrl.iosProjects).then((onValue) {
      var dataConvertedToJSON = json.decode(onValue);
      setState(() {
        var list = dataConvertedToJSON as List;
        mListIos.addAll(list
            .map<ProjectModel>((json) => ProjectModel.fromJson(json))
            .toList());
      });
    });
    return 'success';
  }

  Future<String> getWebProjects() async {
    NetworkRepository().getRequest(NetworkUrl.webProjects).then((onValue) {
      var dataConvertedToJSON = json.decode(onValue);
      setState(() {
        var list = dataConvertedToJSON as List;
        mListPhp.addAll(list
            .map<ProjectModel>((json) => ProjectModel.fromJson(json))
            .toList());
      });
    });
    return 'success';
  }

  Widget android() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const Icon(
                Icons.android,
                size: 35,
              ),
              const Padding(padding: EdgeInsets.only(left: 8)),
              Text(
                Lang.androidProject,
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 8)),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: mListAndroid.length,
            itemBuilder: (context, int) {
              ProjectModel model = mListAndroid[int];
              return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: InkWell(
                    onTap: () {
                      js.context.callMethod("open", [model.url]);
                    },
                    child: Row(
                      children: <Widget>[
                        Image.network(
                          '${model.logo}',
                          height: 100,
                          width: 100,
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16)),
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
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16)),
                        const Icon(FontAwesomeIcons.googlePlay),
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16)),

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
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.phone_iphone,
                size: 35,
              ),
              const Padding(padding: EdgeInsets.only(left: 8)),
              Text(
                Lang.iosProject,
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 8)),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: mListIos.length,
            itemBuilder: (context, int) {
              ProjectModel model = mListIos[int];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: InkWell(
                  onTap: () {
                    js.context.callMethod("open", [model.url]);
                  },
                  child: Row(
                    children: <Widget>[
                      Image.network(
                        '${model.logo}',
                        height: 100,
                        width: 100,
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16)),
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
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16)),
                      const Icon(FontAwesomeIcons.appStoreIos),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16)),

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
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.web,
                size: 35,
              ),
              const Padding(padding: EdgeInsets.only(left: 8)),
              Text(
                Lang.web,
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 8)),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: mListPhp.length,
            itemBuilder: (context, int) {
              ProjectModel model = mListPhp[int];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: InkWell(
                  onTap: () {
                    js.context.callMethod("open", [model.url]);
                  },
                  child: Row(
                    children: <Widget>[
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8)),
                      Image.network(
                        '${model.logo}',
                        height: 100,
                        width: 100,
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16)),
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
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16)),
                      const Icon(FontAwesomeIcons.chrome),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16)),

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

  Widget header() {
    return Column(
      children: <Widget>[
        const CircleAvatar(
          radius: 60.0,
          backgroundImage: NetworkImage(
              'https://avatars0.githubusercontent.com/u/22388017?s=460&v=4'),
        ),
        const Padding(padding: EdgeInsets.only(top: 16)),
        Text(
          Lang.fName + ' ' + Lang.lName,
          style: Theme.of(context).textTheme.title,
        ),
        const Padding(padding: EdgeInsets.only(top: 8)),
        Text(
          Lang.designation,
          style: Theme.of(context).textTheme.subtitle,
        ),
        const Padding(padding: EdgeInsets.only(top: 16)),
        Text(
          Lang.contactMe1,
          style: Theme.of(context).textTheme.subtitle,
          textAlign: TextAlign.center,
        ),
        const Padding(padding: EdgeInsets.only(top: 8)),
        Text(
          Lang.contactMe2,
          style: Theme.of(context).textTheme.title,
          textAlign: TextAlign.center,
        ),
        const Padding(padding: EdgeInsets.only(top: 16)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(FontAwesomeIcons.whatsapp),
            const Padding(padding: EdgeInsets.only(left: 8)),
            SelectableText(
              '+91-8962328415',
              style: Theme.of(context).textTheme.title,
            )
          ],
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(FontAwesomeIcons.google),
            const Padding(padding: EdgeInsets.only(left: 8)),
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
                icon: const Icon(FontAwesomeIcons.stackOverflow),
                onPressed: () {
                  js.context.callMethod("open", [
                    'https://stackoverflow.com/users/5734205/ravinder-kumar?tab=profile'
                  ]);
                }),
            Container(
              height: 16,
              width: 1,
              color: Colors.grey,
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            IconButton(
                icon: const Icon(FontAwesomeIcons.github),
                onPressed: () {
                  js.context
                      .callMethod("open", ['https://github.com/raviganwal']);
                }),
          ],
        ),
      ],
    );
  }
}
