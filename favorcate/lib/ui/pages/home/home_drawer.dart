import 'package:favorcate/ui/pages/filter/filter.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/int_extension.dart';

class YHHomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Drawer(
        child: Column(
          children: <Widget>[
            buildHeaderView(context),
            buildListTitle(context, Icon(Icons.restaurant), "进餐", (){
              Navigator.of(context).pop();
            }),
            buildListTitle(context, Icon(Icons.build), "过滤", (){
              Navigator.of(context).pushNamed(HYFilterScreen.routeName);
            }),
          ],
        ),
      ),
    );
  }


  Widget buildHeaderView(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.px,
      color: Colors.orange,
      alignment: Alignment(0, 0.5),
      margin: EdgeInsets.only(bottom: 20),
      child: Text("开始动手", style: Theme.of(context).textTheme.display3,),
    );
  }


  Widget buildListTitle(BuildContext context, Widget icon, String title, Function handle) {
    return ListTile(
      leading: icon,
      title: Text(title, style: Theme.of(context).textTheme.display2,),
      onTap: handle,
    );
  }

}
