import 'package:flutter/material.dart';

class Filterscreen extends StatefulWidget {
  const Filterscreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FilterscreenStateState();
  }
}

class _FilterscreenStateState extends State<Filterscreen> {
  var _glutenefreeset = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Yours filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: _glutenefreeset,
            onChanged: (ischecked) {
              setState(() {
                _glutenefreeset=ischecked;
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
        ],
      ),
    );
  }
}
