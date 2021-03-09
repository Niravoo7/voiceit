import 'package:flutter/material.dart';
import 'package:voiceit/custom_widget/divider_widget.dart';
import 'package:voiceit/custom_widget/search_input_field.dart';
import 'package:voiceit/custom_widget/text_widget.dart';
import 'package:voiceit/helper/constants.dart';
import 'package:voiceit/screen/main_module/search/people_screen.dart';
import 'package:voiceit/screen/main_module/search/tags_screen.dart';

enum TabItemSearch { people, tags }

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/search';
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TabItemSearch currentTab;

  TextEditingController searchController = new TextEditingController();

  PeopleScreen peopleScreen;
  TagsScreen tagsScreen;
  Map<TabItemSearch, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItemSearch.people: GlobalKey<NavigatorState>(),
    TabItemSearch.tags: GlobalKey<NavigatorState>()
  };

  @override
  void initState() {
    super.initState();
    peopleScreen = new PeopleScreen();
    tagsScreen = new TagsScreen();
    currentTab = TabItemSearch.people;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(children: <Widget>[
      SearchInputField(
          AppConstants.str_coolPeople, searchController, (text) {}),
      bottomBar(context),
      DividerWidget(height: 1, width: MediaQuery.of(context).size.width),
      Flexible(
          child: Stack(children: <Widget>[
            buildOffstageNavigator(TabItemSearch.people, context),
            buildOffstageNavigator(TabItemSearch.tags, context)
          ]),
          flex: 1)
    ])));
  }

  // ignore: missing_return
  Map<String, WidgetBuilder> _routeBuilders(
      BuildContext context, TabItemSearch tabItem) {
    if (tabItem == TabItemSearch.people) {
      return {TabNavigatorRoutes.root: (context) => peopleScreen};
    } else if (tabItem == TabItemSearch.tags) {
      return {TabNavigatorRoutes.root: (context) => tagsScreen};
    }
  }

  Widget buildOffstageNavigator(TabItemSearch tabItem, BuildContext context) {
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
      height: 40,
      decoration: BoxDecoration(color: AppConstants.clrWhite),
      child: Row(
        children: <Widget>[
          SizedBox(width: 15),
          Flexible(
              child: tabWidget(
                  context, TabItemSearch.people, AppConstants.str_people),
              flex: 1),
          SizedBox(width: 15),
          Flexible(
              child:
                  tabWidget(context, TabItemSearch.tags, AppConstants.str_tags),
              flex: 1),
          SizedBox(width: 15),
        ],
      ),
    );
  }

  Widget tabWidget(
      BuildContext context, TabItemSearch itemMain, String tabName) {
    return GestureDetector(
      onTap: () async {
        onTabClick(itemMain);
      },
      child: GestureDetector(
        child: Container(
          height: 40,
          color: AppConstants.clrWhite,
          alignment: Alignment.center,
          child: Container(
            alignment: Alignment.center,
            decoration: (itemMain == currentTab)
                ? BoxDecoration(
                    color: AppConstants.clrGrey,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)))
                : null,
            child: TextWidget(tabName,
                fontWeight: FontWeight.w400,
                color: AppConstants.clrBlack,
                fontSize: AppConstants.size_medium_large),
          ),
        ),
        onTap: () async {
          onTabClick(itemMain);
        },
      ),
    );
  }

  onTabClick(TabItemSearch itemMain) async {
    setState(() {
      currentTab = itemMain;
    });
  }
}
