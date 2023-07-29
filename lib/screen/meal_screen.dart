import 'package:flutter/material.dart';
import 'package:meals_app/model/Category.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/widget/category_grid_item.dart';
import 'package:meals_app/widget/meal_list_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    super.key,
    this.title,
    this.meals = const [],
  });

  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        padding: const EdgeInsets.all(24),
        itemBuilder: (ctx, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: MealListItem(
                meal: meals[index],
                /*category:
                    Category(title: meals[index].title, id: meals[index].id),
                onPress: () {},*/
              ),
            ));

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'No meals available!',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              'Try different category.',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
