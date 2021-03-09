import 'package:flutter/cupertino.dart';

class NavigatePageRoute extends CupertinoPageRoute {
  Widget _page;

  NavigatePageRoute(BuildContext context, Widget page)
      : super(builder: (context) => page) {
    _page = page;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return ScaleTransition(
      scale: Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.fastOutSlowIn,
        ),
      ),
      child: _page,
    );
    //return new FadeTransition(opacity: animation, child: _page);
  }
}
