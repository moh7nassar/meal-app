import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app_udemy/models/meal.dart';
import 'package:meal_app_udemy/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({@required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      default:
        return "Unknown";
        break;
    }
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(MealDetailScreen.routeName, arguments: id)
        .then((result) {
      if (result != null) {
        //removeMeal(result);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectMeal(context);
      },
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    child: Image.network(imageUrl),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  Positioned(
                      bottom: 20,
                      right: 10,
                      child: Container(
                        width: 300,
                        color: Colors.black54,
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: Text(
                          title,
                          style: TextStyle(color: Colors.white, fontSize: 26),
                          overflow: TextOverflow.fade,
                          softWrap: true,
                        ),
                      )),
                ],
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(width: 5),
                        Text(
                          "$duration min",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w900),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(width: 5),
                        Text(
                          complexityText,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        Text(
                          affordabilityText,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
