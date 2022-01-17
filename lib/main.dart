import 'package:flutter/material.dart';
import 'package:meal_app_udemy/dummy_data.dart';
import 'package:meal_app_udemy/screens/categories_screen.dart';
import 'package:meal_app_udemy/screens/category_meals_screen.dart';
import 'package:meal_app_udemy/screens/filters.dart';
import 'package:meal_app_udemy/screens/meal_detail_screen.dart';
import 'package:meal_app_udemy/screens/tabs_screen.dart';

import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters={
    'gluten':false,
    'vegetarian':false,
    'vegan':false,
    'lactose':false,
  };
  List<Meal> availableMeals=DUMMY_MEALS;
  void setFilters(Map<String, bool> _filterData){
    setState(() {
      _filters=_filterData;
      availableMeals=DUMMY_MEALS.where((meal){
        if( !meal.isGlutenFree && _filters['gluten']){
          return false;
        }
        if( !meal.isLactoseFree && _filters['lactose']){
          return false;
        }
        if( !meal.isVegan && _filters['vegan']){
          return false;
        }
        if( !meal.isVegetarian && _filters['vegetarian']){
          return false;
        }
        return true;
      }).toList();
    });
  }
  bool isMealFavorite(String mealId){
    if(favoriteMeals.any((meal) => meal.id==mealId)){
      return true;
    }
    else
      return false;
  }

  List<Meal> favoriteMeals=[];
  void choosingFavorite(String mealId){
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if(existingIndex>=0){
      setState(() {
        favoriteMeals.removeAt(existingIndex);
        print(existingIndex);
      });
    }
    else{
      setState(() {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color:Color.fromRGBO(20, 50, 50, 1 )
          ),
          bodyText2: TextStyle(
              color:Color.fromRGBO(20, 50, 50, 1 )
          ),
          subtitle1: TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold
          )
        )
      ),
      initialRoute: TabsScreen.routeName,
      routes: {
        '/CategoriesScreen': (context)=> CategoriesScreen(),
        CategoryMealsScreen.routeName : (context)=> CategoryMealsScreen(availableMeals),
        MealDetailScreen.routeName : (context) => MealDetailScreen(choosingFavorite, isMealFavorite),
        TabsScreen.routeName : (context) => TabsScreen(favoriteMeals),
        Filters.routeName : (context)=>Filters(_filters, setFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal app"),
      ),
    );
  }
}
