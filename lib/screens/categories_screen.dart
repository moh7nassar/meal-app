import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app_udemy/dummy_data.dart';
import 'package:meal_app_udemy/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(20),
          children: DUMMY_CATEGORIES.map((e)=>
          CategoryItem(e.id, e.title, e.color),
          ).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3/2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20
          )
      ),
    );
  }
}
