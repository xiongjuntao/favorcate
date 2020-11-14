
import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/ui/pages/main/main.dart';
import 'package:favorcate/ui/pages/meal/meal.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/int_extension.dart';

class HYHomeCategoryItem extends StatelessWidget {

  final HYCategoryModel _category;
  HYHomeCategoryItem(this._category);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        //圆角和颜色渐变
        decoration: BoxDecoration(
            color: _category.cColor,
            borderRadius: BorderRadius.circular(12.px),
            gradient: LinearGradient(
                colors: [
                  _category.cColor.withOpacity(.7),
                  _category.cColor
                ]
            )
        ),
        alignment: Alignment.center,
        child: Text(
          _category.title,
          style: Theme.of(context).textTheme.display2.copyWith(
            fontWeight: FontWeight.bold
          ),
        ),
      ),

      onTap: (){
        Navigator.of(context).pushNamed(HYMealScreen.routeName, arguments: _category);
      },

    );
  }
}