import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/screens/categories.dart';
import 'package:meal/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenStates();
  }
}

class _TabsScreenStates extends State<TabsScreen> {
  int selectpageindex = 0;
  final List<Meal> _favouritemeals = [];

  void _tooglemealfavstatus(Meal meal) {
    final isExisting = _favouritemeals.contains(meal);
    void Showmssage(String message) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }

    if (isExisting) {
      setState(() {
        _favouritemeals.remove(meal);
        Showmssage('favourites removed');
      });
    } else {
      setState(() {
        _favouritemeals.add(meal);

        Showmssage('favourites added');
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      selectpageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activescreen = categoryScreen(
      onToogleFavourite: _tooglemealfavstatus,
    );
    var activetitle = 'category ';
    if (selectpageindex == 1) {
      activescreen = Mealscreen(
        meals: _favouritemeals,
        onToogleFavourite: _tooglemealfavstatus,
      );
      activetitle = 'Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activetitle),
      ),
      body: activescreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: selectpageindex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'favourites'),
        ],
      ),
    );
  }
}
