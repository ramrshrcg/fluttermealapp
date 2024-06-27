import 'package:flutter/material.dart';
// import 'package:meal/screens/tabs.dart';
// import 'package:meal/widgets/main_drawre.dart';
enum Filter {
  vegan,
  glutenfree,
  vegeterian,
  lactosefree,
}

class Filterscreen extends StatefulWidget {
  const Filterscreen({
    super.key,
    required this.currentfilter,
  });
  final Map<Filter, bool> currentfilter;

  @override
  State<StatefulWidget> createState() {
    return _FilterscreenStateState();
  }
}


class _FilterscreenStateState extends State<Filterscreen> {
  var _glutenefreeset = false;
  var _lactosefreeet = false;
  var _veganfreeset = false;
  var _vegeterianset = false;

  @override
  void initState() {
    
    super.initState();
    _glutenefreeset = widget.currentfilter[Filter.glutenfree]!;
    _veganfreeset= widget.currentfilter[Filter.vegan]!;
    _lactosefreeet= widget.currentfilter[Filter.lactosefree]!;
    _vegeterianset = widget.currentfilter[Filter.vegeterian]!;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yours filters'),
      ),

      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.vegan: _veganfreeset,
            Filter.lactosefree: _lactosefreeet,
            Filter.vegeterian: _vegeterianset,
            Filter.glutenfree: _glutenefreeset,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenefreeset,
              onChanged: (ischecked) {
                setState(() {
                  _glutenefreeset = ischecked;
                });
              },
              title: Text(
                'Glutenfree',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include glutene free meals ',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactosefreeet,
              onChanged: (ischecked) {
                setState(() {
                  _lactosefreeet = ischecked;
                });
              },
              title: Text(
                'Lactosefree',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include lactose  free meals ',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganfreeset,
              onChanged: (ischecked) {
                setState(() {
                  _veganfreeset = ischecked;
                });
              },
              title: Text(
                'veganfree',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include vegan meals ',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegeterianset,
              onChanged: (ischecked) {
                setState(() {
                  _vegeterianset = ischecked;
                });
              },
              title: Text(
                'Vegeterian ',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include vegertrian meals ',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
