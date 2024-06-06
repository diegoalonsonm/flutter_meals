import 'package:flutter/material.dart';
import 'package:flutter_meals/widgets/filter_item.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegeterian,
  vegan
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegeterianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegeterianFilterSet = widget.currentFilters[Filter.vegeterian]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegeterian: _vegeterianFilterSet,
            Filter.vegan: _veganFilterSet
          });
        },
        child: Column(
          children: [
            FilterItem(
              isFilterSet: _glutenFreeFilterSet, 
              title: 'Gluten-free', 
              subtitle: 'Only include gluten-free meals',
              onFilterChange: (isSet) {
                setState(() {
                  _glutenFreeFilterSet = isSet;
                });
              }
            ),
            FilterItem(
              isFilterSet: _lactoseFreeFilterSet, 
              title: 'Lactose-free', 
              subtitle: 'Only include lactose-free meals',
              onFilterChange: (isSet) {
                setState(() {
                  _lactoseFreeFilterSet = isSet;
                });
              }
            ),
            FilterItem(
              isFilterSet: _vegeterianFilterSet, 
              title: 'Vegeterian', 
              subtitle: 'Only include vegeterian meals',
              onFilterChange: (isSet) {
                setState(() {
                  _vegeterianFilterSet = isSet;
                });
              }
            ),
            FilterItem(
              isFilterSet: _veganFilterSet, 
              title: 'Vegan', 
              subtitle: 'Only include vegan meals',
              onFilterChange: (isSet) {
                setState(() {
                  _veganFilterSet = isSet;
                });
              }
            ),
          ],
        ),
      )
    );
  }
}