import 'package:favorcate/core/model/meal_model.dart';
import 'package:flutter/material.dart';

import 'filter_view_model.dart';


class HYBaseViewModel extends ChangeNotifier {

  List<HYMealModel> _meals = [];
  HYFilterViewModel _filterVM;

  void updateFilter(HYFilterViewModel filterVM) {
    _filterVM = filterVM;
  }

  List<HYMealModel> get meals {
    return _meals.where((meal) {
      if (_filterVM.isGlutenFree && !meal.isGlutenFree) return false;
      if (_filterVM.isLactoseFree && !meal.isLactoseFree) return false;
      if (_filterVM.isVegetarian && !meal.isVegetarian) return false;
      if (_filterVM.isVegan && !meal.isVegan) return false;
      return true;
    }).toList();
  }

  List<HYMealModel> get originMeals {
    return _meals;
  }

  set meals(List<HYMealModel> value) {
    _meals = value;
    notifyListeners();
  }
}
