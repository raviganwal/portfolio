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
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                  bottom: PreferredSize(
                    child: Container(
                      color: Theme.of(context).primaryColor,
                      child: TabBar(
                        isScrollable: false,
                        tabs: [
                          Tab(text: "Selling"),
                          Tab(text: "Buying"),
                        ],
                      ),
                    ),
                    preferredSize: Size(MediaQuery.of(context).size.width, 56),
                  ),
                  elevation: 0,
                  expandedHeight:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 470.0
                          : 250,
                  floating: false,
                  centerTitle: true,
                  pinned: true,
                  title: Text(Lang.appBarTitle),
                  flexibleSpace: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    return FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: Container(
                        child: Stack(
                          children: <Widget>[
                            Image.asset(
                              'assets/images/background.jpg',
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              colorBlendMode: BlendMode.darken,
                              fit: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? BoxFit.cover
                                  : BoxFit.fill,
                            ),
                          ],
                        ),
                      ),
                    );
                  })),
            ];
          },
          body: TabBarView(
            children: [
              Center(
                child: Text('abc'),
              ),
              Center(
                child: Text('abc'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
