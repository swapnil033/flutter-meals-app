import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filter_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  Widget _filterItem({
    required BuildContext context,
    required bool value,
    required String title,
    required String subTitle,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      body: Column(
        children: [
          _filterItem(
              context: context,
              value: activeFilter[Filter.glutenFree]!,
              title: 'Gluten-free',
              subTitle: 'Only include Gluten-free meals.',
              onChanged: (isChecked) {
                ref
                    .read(filterProvider.notifier)
                    .onChangeFilter(Filter.glutenFree, isChecked);
              }),
          _filterItem(
              context: context,
              value: activeFilter[Filter.lactoseFree]!,
              title: 'Lactose-free',
              subTitle: 'Only include Lactose-free meals.',
              onChanged: (isChecked) {
                ref
                    .read(filterProvider.notifier)
                    .onChangeFilter(Filter.lactoseFree, isChecked);
              }),
          _filterItem(
              context: context,
              value: activeFilter[Filter.vegetarian]!,
              title: 'Vegetarian',
              subTitle: 'Only include vegetarian meals.',
              onChanged: (isChecked) {
                ref
                    .read(filterProvider.notifier)
                    .onChangeFilter(Filter.vegetarian, isChecked);
              }),
          _filterItem(
              context: context,
              value: activeFilter[Filter.vegan]!,
              title: 'vegan',
              subTitle: 'Only include vegan meals.',
              onChanged: (isChecked) {
                ref
                    .read(filterProvider.notifier)
                    .onChangeFilter(Filter.vegan, isChecked);
              }),
        ],
      ),
    );
  }
}
