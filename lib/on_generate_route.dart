import 'package:flutter/material.dart';
import 'package:shopsave/features/presentation/pages/mobile_phone_view_page.dart';

import 'const.dart';
import 'features/data/models/mobile_list_model.dart';


class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;


    switch (settings.name) {
      case PageConst.mobilePhoneViewPage:
        {
          if (args is MobileListModel){
            return materialBuilder(
              widget: MobilePhoneViewPage(mobileItem: args,),
            );
          }else{
            return materialBuilder(
              widget: ErrorPage(),
            );
          }

        }
      default:
        return materialBuilder(
          widget: ErrorPage(),
        );
    }
  }
}

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("error"),
      ),
      body: Center(
        child: Text("error"),
      ),
    );
  }
}

MaterialPageRoute materialBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}
