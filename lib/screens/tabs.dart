import 'package:flutter/material.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/screens/categories.dart';
import 'package:meal/screens/filters_screen.dart';
import 'package:meal/screens/meals.dart';
import 'package:meal/widgets/main_drawre.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenStates();
  }
}

const kInitialfilters = {
  Filter.glutenfree: false,
  Filter.lactosefree: false,
  Filter.vegan: false,
  Filter.vegeterian: false,
};

class _TabsScreenStates extends State<TabsScreen> {
  int selectpageindex = 0;
  final List<Meal> _favouritemeals = [];
  Map<Filter, bool> _selectedfilters = kInitialfilters;

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

    if (isExisting == true) {
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

  void _selectscreeen(String identifire) async {
    if (identifire == 'filters') {
      Navigator.of(context).pop();
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => Filterscreen(
            currentfilter: _selectedfilters,
          ),
        ),
      );
      setState(() {
        _selectedfilters = result ?? kInitialfilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedfilters[Filter.glutenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedfilters[Filter.lactosefree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedfilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedfilters[Filter.vegeterian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

    Widget activescreen = categoryScreen(
      availableMeals: availableMeals,
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
      drawer: ManiDrawer(
        onSelectscreen: _selectscreeen,
      ),
      body: activescreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: selectpageindex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Category',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'favourites'),
        ],
      ),
    );
  }
}
