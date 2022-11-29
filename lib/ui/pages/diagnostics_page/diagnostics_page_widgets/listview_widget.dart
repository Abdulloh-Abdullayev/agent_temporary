import 'package:flutter/cupertino.dart';

Widget listview_widget(Widget widget, int count){
  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: count,
    itemBuilder: (context,index){
      return widget;
    },
  );
}