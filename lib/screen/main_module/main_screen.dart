import 'package:flutter/material.dart';
import 'package:voiceit/custom_widget/divider_widget.dart';
import 'package:voiceit/helper/constants.dart';
import 'package:voiceit/helper/dialogues.dart';
import 'package:voiceit/screen/main_module/create/create_screen.dart';
import 'package:voiceit/screen/main_module/messages/messages_screen.dart';
import 'package:voiceit/screen/main_module/notifications/notifications_screen.dart';
import 'package:voiceit/screen/main_module/profile/profile_screen.dart';
import 'package:voiceit/screen/main_module/search/search_screen.dart';

enum TabItemMain { search, messages, create, notifications, profile }

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/main';
}

// ignore: must_be_immutable
class MainScreen extends StatefulWidget {

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  TabItemMain currentTab;

  SearchScreen searchScreen;
  MessagesScreen messagesScreen;
  CreateScreen createScreen;
  NotificationsScreen notificationsScreen;
  ProfileScreen profileScreen;

  Map<TabItemMain, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItemMain.search: GlobalKey<NavigatorState>(),
    TabItemMain.messages: GlobalKey<NavigatorState>(),
    TabItemMain.create: GlobalKey<NavigatorState>(),
    TabItemMain.notifications: GlobalKey<NavigatorState>(),
    TabItemMain.profile: GlobalKey<NavigatorState>(),
  };

  @override
  void initState() {
    super.initState();

    searchScreen = new SearchScreen();
    messagesScreen = new MessagesScreen();
    createScreen = new CreateScreen();
    notificationsScreen = new NotificationsScreen();
    profileScreen = new ProfileScreen();

    currentTab = TabItemMain.create;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (!navigatorKeys[currentTab].currentState.canPop()) {
         // onWillPops(context);
        } else {
          !await navigatorKeys[currentTab].currentState.maybePop();
        }
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                Flexible(
                    child: Stack(children: <Widget>[
                      buildOffstageNavigator(TabItemMain.search, context),
                      buildOffstageNavigator(TabItemMain.messages, context),
                      buildOffstageNavigator(TabItemMain.create, context),
                      buildOffstageNavigator(TabItemMain.notifications, context),
                      buildOffstageNavigator(TabItemMain.profile, context),
                    ]),
                    flex: 1),
                DividerWidget(
                    height: 2, width: MediaQuery.of(context).size.width),
                bottomBar(context),
              ],
            ),
          ),
        ),
        // ignore: unrelated_typ
      ),
    );
  }

  // ignore: missing_return
  Map<String, WidgetBuilder> _routeBuilders(
      BuildContext context, TabItemMain tabItem) {
    if (tabItem == TabItemMain.search) {
      return {TabNavigatorRoutes.root: (context) => searchScreen};
    } else if (tabItem == TabItemMain.messages) {
      return {TabNavigatorRoutes.root: (context) => messagesScreen};
    } else if (tabItem == TabItemMain.create) {
      return {TabNavigatorRoutes.root: (context) => createScreen};
    } else if (tabItem == TabItemMain.notifications) {
      return {TabNavigatorRoutes.root: (context) => notificationsScreen};
    } else if (tabItem == TabItemMain.profile) {
      return {TabNavigatorRoutes.root: (context) => profileScreen};
    }
  }

  Widget buildOffstageNavigator(TabItemMain tabItem, BuildContext context) {
    var routeBuilders = _routeBuilders(context, tabItem);
    return Offstage(
      offstage: currentTab != tabItem,
      child: Navigator(
          key: navigatorKeys[tabItem],
          initialRoute: TabNavigatorRoutes.root,
          onGenerateRoute: (routeSettings) {
            return MaterialPageRoute(
                builder: (context) =>
                    routeBuilders[routeSettings.name](context));
          }),
    );
  }

  Widget bottomBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(color: AppConstants.clrWhite),
      child: Row(
        children: <Widget>[
          Flexible(
            child: tabWidget(context, TabItemMain.search,
                AppConstants.img_search, AppConstants.clrTabSearch),
            flex: 1,
          ),
          Flexible(
            child: tabWidget(context, TabItemMain.messages,
                AppConstants.img_messages, AppConstants.clrTabMessages),
            flex: 1,
          ),
          Flexible(
            child: tabWidget(context, TabItemMain.create,
                AppConstants.img_create_voice, AppConstants.clrTabCreate),
            flex: 1,
          ),
          Flexible(
            child: tabWidget(
                context,
                TabItemMain.notifications,
                AppConstants.img_notification,
                AppConstants.clrTabNotifications),
            flex: 1,
          ),
          Flexible(
            child: tabWidget(context, TabItemMain.profile,
                AppConstants.img_profile, AppConstants.clrTabProfile),
            flex: 1,
          ),
        ],
      ),
    );
  }

  Widget tabWidget(
      BuildContext context, TabItemMain itemMain, String ic, Color color) {
    return GestureDetector(
      onTap: () async {
        onTabClick(itemMain);
      },
      child: GestureDetector(
        child: Container(
          height: 60,
          color: AppConstants.clrWhite,
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration: (itemMain == currentTab)
                    ? BoxDecoration(
                        color: AppConstants.clrGrey,
                        borderRadius: BorderRadius.circular(10))
                    : null,
                child: Image.asset(
                  ic,
                  height: 20,
                  width: 20,
                ),
              ),
              /*Container(
                height: 45,
                width: 60,
                alignment: Alignment.topLeft,
                child: Container(
                  height: 11,
                  width: 11,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: color),
                ),
              ),*/
            ],
          ),
        ),
        onTap: () async {
          onTabClick(itemMain);
        },
      ),
    );
  }

  onTabClick(TabItemMain itemMain) async {
    setState(() {
      currentTab = itemMain;
    });
  }
}
