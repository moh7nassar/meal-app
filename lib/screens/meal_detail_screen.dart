import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app_udemy/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static final routeName = "/MealDetailScreen";
  final Function isMealFavorite;
  final Function choosingFavorite;
  MealDetailScreen(this.choosingFavorite, this.isMealFavorite);

  Widget buildSelectionTitle(BuildContext ctx, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: Theme.of(ctx).textTheme.title),
    );
  }

  Widget buildContainer(BuildContext ctx, Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selected_meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selected_meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.network(
                selected_meal.imageUrl,
                fit: BoxFit.cover,
              ),
              height: 300,
              width: double.infinity,
            ),
            buildSelectionTitle(context, "Ingredients"),
            buildContainer(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(ctx).accentColor,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(selected_meal.ingredients[index]),
                    ),
                  );
                },
                itemCount: selected_meal.ingredients.length,
              ),
            ),
            buildSelectionTitle(context, "Steps"),
            buildContainer(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("#${index + 1}"),
                      ),
                      title: Text(selected_meal.steps[index]),
                    ),
                    Divider(),
                  ]);
                },
                itemCount: selected_meal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isMealFavorite(mealId) ?  Icon(Icons.star) :  Icon(Icons.star_border),
        onPressed: ()=>choosingFavorite(mealId),
      ),
    );
  }
}
