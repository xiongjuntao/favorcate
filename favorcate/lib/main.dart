import 'package:favorcate/core/router/router.dart';
import 'package:favorcate/core/services/meal_request.dart';
import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:favorcate/core/viewmodel/filter_view_model.dart';
import 'package:favorcate/ui/shared/app_theme.dart';
import 'package:favorcate/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/viewmodel/meal_view_model.dart';

void main() {
//  runApp(
//    MultiProvider(
//      providers: [
//        ChangeNotifierProvider(create: (ctx) => HYFilterViewModel()),
//        ChangeNotifierProxyProvider<HYFilterViewModel, HYMealViewModel>(
//          create: (ctx) => HYMealViewModel(),
//          update: (ctx, filterVM, mealVM) {
//            mealVM.updateFilter(filterVM);
//            return mealVM;
//          },
//        ),
//        ChangeNotifierProxyProvider<HYFilterViewModel, HYFavorViewModel>(
//          create: (ctx) => HYFavorViewModel(),
//          update: (ctx, filterVM, favorVM) {
//            favorVM.updateFilter(filterVM);
//            return favorVM;
//          },
//        ),
//      ],
//      child: MyApp(),
//    )
//  );
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => HYFilterViewModel()),
          ChangeNotifierProxyProvider<HYFilterViewModel, HYMealViewModel>(
            create: (ctx) => HYMealViewModel(),
            update: (ctx, filterVM, mealVM) {
              mealVM.updateFilter(filterVM);
              return mealVM;
            },
          ),
          ChangeNotifierProxyProvider<HYFilterViewModel, HYFavorViewModel>(
            create: (ctx) => HYFavorViewModel(),
            update: (ctx, filterVM, favorVM) {
              favorVM.updateFilter(filterVM);
              return favorVM;
            },
          ),
        ],
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    HYSizeFit.initialize();
    return MaterialApp(
      title: 'Flutter Demo',
      //主题
      theme: HYAppTheme.norTheme,
      //路由
      initialRoute: HYRouter.initialRoute,
      routes: HYRouter.routes,
      onGenerateRoute: HYRouter.generateRoute,
      onUnknownRoute: HYRouter.generateRoute,
    );
  }
}
