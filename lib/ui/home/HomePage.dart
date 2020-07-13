import 'package:CovidMonitor/ui/admob_service.dart';
import 'package:flutter/material.dart';
import 'package:CovidMonitor/ui/home/faq/FaqPage.dart';
import 'package:CovidMonitor/ui/home/global/GlobalPage.dart';
import 'package:CovidMonitor/ui/home/map/MapPage.dart';
import 'package:CovidMonitor/util/ColorUtil.dart';
import 'package:CovidMonitor/util/StyleUtil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:CovidMonitor/ui/about_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:admob_flutter/admob_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> screens = [GlobalPage(), FaqPage(), MapPage(), AboutPage() ];
  Widget currentScreen = GlobalPage();
  final PageStorageBucket bucket = PageStorageBucket();
  int currentTab = 0;



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor:
            currentTab == 3 ? Colors.white : getPageBackgroundColor(),
        title: Row(
          children: <Widget>[
            Container(
              height: 30,
              width: 100,
              child: Hero(
                  tag: "ic_goaway",
                  child: Image.asset(
                    'images/COVID monitor.png',
                    height: 25,
                    width: 150,
                  )),
            ),
            Spacer(),
            InkWell(
                onTap: () {
                  removeUserCountry();
                },
                child: Text(getPageTitle(currentTab),
                    style: getPageTitleTextStyle(18.0)))
          ],
        ),
      ),
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  Widget getBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentTab,
      backgroundColor: getBottomNavigationBarColor(),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(MdiIcons.viewDashboardOutline),
          activeIcon: Icon(MdiIcons.viewDashboard),
          title: Text('Dashboard'),
        ),
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(MdiIcons.frequentlyAskedQuestions),
          title: Text('faq'),
        ),
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(MdiIcons.map),
          activeIcon: Icon(MdiIcons.map),
          title: Text('News'),
        ),
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(MdiIcons.informationOutline),
          activeIcon: Icon(MdiIcons.information),
          title: Text('About'),
        )
      ],
      onTap: (index) {
        setState(() {
          currentScreen = screens[index];
          currentTab = index;
        });
      },
    );
  }

  String getPageTitle(int currentTab) {
    var pageTitle = "GLOBAL";
    switch (currentTab) {
      case 0:
        pageTitle = 'GLOBAL';
        break;
      case 1:
        pageTitle = 'FAQ';
        break;
      case 2:
        pageTitle = 'MAP';
        break;
      case 3:
        pageTitle = 'ABOUT';
        break;
    }
    setState(() {
      pageTitle = pageTitle;
    });
    return pageTitle;
  }
}


void removeUserCountry() async  {
  var preference = await SharedPreferences.getInstance();
  preference.remove('userCountry');
}