
import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/services/meal_request.dart';
import 'package:favorcate/core/viewmodel/filter_view_model.dart';
import 'package:flutter/material.dart';

import 'base_view_model.dart';

class HYMealViewModel extends HYBaseViewModel {


  HYMealViewModel() {
    HYMealRequest.getMealData().then((value) {
      meals = value;
    });
  }

}