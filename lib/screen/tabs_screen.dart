import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/providers/favorite_meal_provider.dart';
import 'package:meals_app/providers/filter_provider.dart';
import 'package:meals_app/providers/filtered_meal_provider.dart';
import 'package:meals_app/providers/meal_provider.dart';
import 'package:meals_app/screen/category_screen.dart';
import 'package:meals_app/screen/filter_screen.dart';
import 'package:meals_app/screen/meal_screen.dart';
import 'package:meals_app/widget/main_drawer.dart';

const kInitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMeals = ref.watch(favoriteMealProvider);

    final List<Meal> availableMeals = ref.watch(filteredMealProvider);

    Widget selectedPage = CategoryScreen(
      availableMeals: availableMeals,
    );
    String selectedAppText = 'Categories';

    if (_selectedPageIndex == 1) {
      selectedPage = MealScreen(
        meals: favoriteMeals,
      );
      selectedAppText = 'Your favorites';
    }

    void _onSelect(String identifier) {
      Navigator.of(context).pop();
      if (identifier == 'filter') {
        Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(
            builder: (ctx) => const FilterScreen(),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedAppText),
      ),
      body: selectedPage,
      drawer: MainDrawer(
        onSelect: _onSelect,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
