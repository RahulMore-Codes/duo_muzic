import 'package:duo_muzic/components/duoBottomPlayer.dart';
import 'package:duo_muzic/components/duoLocalMusicView.dart';
import 'package:duo_muzic/components/duoOnlineMusicView.dart';
import 'package:flutter/material.dart';

class DuoHome extends StatefulWidget {
  static final String id = "homeScreen";
  @override
  _DuoHomeState createState() => _DuoHomeState();
}

class _DuoHomeState extends State<DuoHome> with SingleTickerProviderStateMixin {
  TabController _duoTabs;

  @override
  void initState() {
    _duoTabs = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                backgroundColor: Theme.of(context).primaryColorDark,
                floating: true,
                snap: true,
                leading: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    // add menu
                  },
                  color: Theme.of(context).primaryColor,
                ),
                centerTitle: true,
                title: Text(
                  "Duo Muzic",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 30.0,
                    shadows: [
                      Shadow(
                        blurRadius: 4.0,
                        color: Colors.amber,
                        offset: Offset(-1.0, -1.0),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                    color: Theme.of(context).primaryColor,
                  ),
                ],
                bottom: TabBar(
                  controller: _duoTabs,
                  labelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: <Widget>[
                    Text(
                      "Local",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Text(
                      "Online",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _duoTabs,
            children: [
              LocalMusicView(),
              OnlineMusicView(),
            ],
          ),
        ),
      ),
      bottomSheet: BottomPlayer(),
    );
  }
}
