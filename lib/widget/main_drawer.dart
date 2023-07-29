import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelect});

  final Function(String identifier) onSelect;

  Widget _drawerListItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Function() onPress,
  }) {
    return ListTile(
      onTap: onPress,
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(context).colorScheme.onBackground,
      ),
      title: Text(
        label,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Theme.of(context).colorScheme.onBackground, fontSize: 24),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.4),
                Theme.of(context).colorScheme.primaryContainer,
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 10),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                )
              ],
            ),
          ),
          _drawerListItem(
            context: context,
            icon: Icons.restaurant,
            label: 'Meals',
            onPress: () {
              onSelect('meals');
            },
          ),
          _drawerListItem(
            context: context,
            icon: Icons.settings,
            label: 'Filter',
            onPress: () {
              onSelect('filter');
            },
          ),
        ],
      ),
    );
  }
}
