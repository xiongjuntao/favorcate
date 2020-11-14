import 'package:favorcate/core/viewmodel/filter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/int_extension.dart';
import 'package:provider/provider.dart';

class HYFilterContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildChoiceTitle(context),
        buildChoiceSelect(),
      ],
    );
  }


  Widget buildChoiceTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.px),
      alignment: Alignment.center,
      child: Text("展示你的选择", style: Theme.of(context).textTheme.display3.copyWith(fontWeight:FontWeight.bold),),
    );
  }

  Widget buildChoiceSelect() {
    return Expanded(
      child: Consumer<HYFilterViewModel> (
        builder: (ctx, filterVM, child) {
          return ListView(
            children: <Widget>[
              buildListTitle("无谷蛋白", "无谷蛋白", filterVM.isGlutenFree, (onChange) {
                filterVM.isGlutenFree = onChange;
              }),
              buildListTitle("不含乳糖", "不含乳糖", filterVM.isLactoseFree, (onChange) {
                filterVM.isLactoseFree = onChange;
              }),
              buildListTitle("素食主义", "素食主义", filterVM.isVegetarian, (onChange) {
                filterVM.isVegetarian = onChange;
              }),
              buildListTitle("严格素食主义", "严格素食主义", filterVM.isVegan, (onChange) {
                filterVM.isVegan = onChange;
              }),
            ],
          );
        },
      ),
    );
  }

  Widget buildListTitle(String title, String subtitle, bool value, Function onChange) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Switch(value: value, onChanged: onChange),
    );
  }

}