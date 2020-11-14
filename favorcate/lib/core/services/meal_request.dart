

import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/services/http_request.dart';
import '../services/config.dart';

class HYMealRequest {

  static Future<List<HYMealModel>> getMealData() async {
    final url = "${HttpConfig.baseURL}/meal";
    final result = await HttpRequest.request(url);

    final mealArray = result["meal"];
    List<HYMealModel> meals = [];
    for (var json in mealArray) {
      meals.add(HYMealModel.fromJson(json));
    }
    return meals;
  }
}