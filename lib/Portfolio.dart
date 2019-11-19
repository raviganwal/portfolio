import 'package:flutter/material.dart';

import 'Lang.dart';

class Portfolio extends StatefulWidget {
  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
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
            children: <Widget>[ CircleAvatar(
              radius: 80.0,
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
              Text(Lang.contactMe, style: Theme
                  .of(context)
                  .textTheme
                  .title
                  .copyWith(fontStyle: FontStyle.italic,letterSpacing: 1.0),textAlign: TextAlign.center,),

            ],
          ),
        ),
      ),
    );
  }
}
