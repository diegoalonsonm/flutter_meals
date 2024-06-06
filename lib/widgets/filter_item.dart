import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({super.key, required this.isFilterSet, required this.title, required this.subtitle, required this.onFilterChange});

  final bool isFilterSet; 
  final String title;
  final String subtitle;
  final void Function(bool) onFilterChange;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: isFilterSet,
      onChanged: onFilterChange,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        )
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        )
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
