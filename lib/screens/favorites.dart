import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app_udemy/models/meal.dart';
import 'package:meal_app_udemy/widgets/meal_item.dart';

class Favorites extends StatelessWidget {
  final List<Meal> favorites;
  Favorites(this.favorites);
  @override
  Widget build(BuildContext context) {
    if(favorites.isEmpty){
      return Scaffold(
        body : Center(child: Text("You don't have any favorite meals yet!", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold
        ),))
      );
    }
    else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favorites[index].id,
            title: favorites[index].title,
            imageUrl: favorites[index].imageUrl,
            duration: favorites[index].duration,
            affordability: favorites[index].affordability,
            complexity: favorites[index].complexity,
          );
        },
        itemCount: favorites.length,
      );
    }
    }
  }

