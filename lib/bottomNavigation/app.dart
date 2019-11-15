

import 'package:cannagrowdev/bottomNavigation/tab_navigator.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  TabItem currentTab = TabItem.home;
  Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.store: GlobalKey<NavigatorState>(),
    TabItem.message: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    setState(() {
      currentTab = tabItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await navigatorKeys[currentTab].currentState.maybePop(),
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.home),
          _buildOffstageNavigator(TabItem.store),
          _buildOffstageNavigator(TabItem.message),
          _buildOffstageNavigator(TabItem.profile),
        ]),
        bottomNavigationBar:  
     //   child:
          BottomNavigation(
          currentTab: currentTab,
          onSelectTab: _selectTab,
        ),
        
        // new Theme(
        // data: Theme.of(context).copyWith(
        // // sets the background color of the BottomNavigationBar
        // canvasColor: Colors.transparent,
        // //backgroundColor: Colors.lightBlue,
        // // sets the active color of the BottomNavigationBar if Brightness is light
        // primaryColor: Colors.white,
        // //disabledColor: Colors.blue,
        // textTheme: Theme
        //     .of(context)
        //     .textTheme
        //     .copyWith(caption: new TextStyle(color: Colors.white54))
        // ),

        // child: Container(
  

                 
          // child: new BottomNavigationBar(
          // onTap: onTabTapped,
          // currentIndex: 0,//store.state.bottomNavigationState, // this will be set when a new tab is tapped
          // items: [
          //     BottomNavigationBarItem(
          //       icon: new Icon(Icons.home),
          //       title: new Text('Home'),
          //     ),
          //     BottomNavigationBarItem(
          //       icon: new Icon(Icons.list),
          //       title: new Text('Tournament'),
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.settings),
          //       title: Text('Settings'),
          //     ),
             
          //   ],
          // ),
      //   ),
      // ),
       
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
