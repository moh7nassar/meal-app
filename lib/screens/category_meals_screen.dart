import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app_udemy/dummy_data.dart';
import 'package:meal_app_udemy/models/meal.dart';
import 'package:meal_app_udemy/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/Category_meal_screen';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List <Meal> displayedMeals;
  Map <String, String> routeArg;
  @override
  void didChangeDependencies() {
    routeArg = ModalRoute.of(context).settings.arguments as Map<String,String>;
    displayedMeals= widget.availableMeals.where((meals){
      return meals.categories.contains(routeArg['id']);
    }).toList();
    super.didChangeDependencies();
  }
  /*void removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }*/
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArg['title']),
      ),
      body : ListView.builder(
        itemBuilder: (ctx, index){
          return MealItem(
            id : displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
          );
        },
        itemCount:displayedMeals.length,
      ),
    );
  }
}
