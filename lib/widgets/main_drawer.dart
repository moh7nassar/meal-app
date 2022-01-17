import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app_udemy/screens/filters.dart';
import 'package:meal_app_udemy/screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function myFunction){
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            fontSize: 24,
            fontFamily:"RobotoCondensed",
            fontWeight: FontWeight.bold
        ),
      ),
      leading: Icon(icon),
      onTap: myFunction,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:
      Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            height:120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text("Cooking Up!", style:TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).primaryColor
            ))
          ),
          SizedBox(height:20),
          buildListTile("Meals", Icons.restaurant, (){Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);}),
          buildListTile("Filters", Icons.settings, (){Navigator.of(context).pushReplacementNamed(Filters.routeName);}),


        ],
      )
    );
  }
}
