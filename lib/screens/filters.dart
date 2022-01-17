import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app_udemy/widgets/main_drawer.dart';

class Filters extends StatefulWidget {
  static final routeName = "/Filters";
  final Function setFilters;
  final Map<String, bool> filtersImported;

  Filters(this.filtersImported, this.setFilters);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  @override
  initState(){
    _glutenFree = widget.filtersImported['gluten'];
    _lactoseFree = widget.filtersImported['lactose'];
    _vegan = widget.filtersImported['vegan'];
    _vegetarian = widget.filtersImported['vegetarian'];
    super.initState();
  }

  Widget buildSwitchListTile(String title, bool myValue, String describtion, Function myFunction) {
    return SwitchListTile(
        title: Text(title),
        value: myValue,
        subtitle: Text(describtion),
        onChanged: myFunction
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Filters"),
      actions: [
        IconButton(icon : Icon(Icons.save), onPressed: (){
          Map<String, bool> selectedMeals={
            'gluten':_glutenFree,
            'vegetarian':_vegetarian,
            'vegan':_vegan,
            'lactose':_lactoseFree,
          };
          widget.setFilters(selectedMeals);
        },)
      ],),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                "Gluten-free",
                _glutenFree,
                "Only include gluten-free meals",
                (myValue) {
                  setState(() {
                    _glutenFree = myValue;
                  });
                },
              ),
              buildSwitchListTile(
                "Lactose-free",
                _lactoseFree,
                "Only include lactose-free meals",
                    (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
              buildSwitchListTile(
                "Vegetarian",
                _vegetarian,
                "Only include vegetarian meals",
                    (myValue) {
                  setState(() {
                    _vegetarian = myValue;
                  });
                },
              ),
              buildSwitchListTile(
                "Vegan",
                _vegan,
                "Only include vegan meals",
                    (myValue) {
                  setState(() {
                    _vegan = myValue;
                  });
                },
              ),
            ],
          )),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
