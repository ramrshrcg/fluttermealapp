import 'package:flutter/material.dart';

class ManiDrawer extends StatelessWidget {
  const ManiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 50,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Cooking up!',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 26,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              'meal',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.primary,fontSize: 24),
            ),
            onTap: () {},
          ),
           ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              'filter',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.primary,fontSize: 24),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
