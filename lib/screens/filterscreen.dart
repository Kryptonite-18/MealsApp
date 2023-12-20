import 'package:flutter/material.dart';

enum filter { glutenfree, lactosefree, vegan, vegetarian }

class FilterScreen extends StatefulWidget {
  FilterScreen({super.key, required this.currentFilters});
  final Map<filter, bool>? currentFilters;
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFreeStateSet = false;
  var _lactoseFreeStateSet = false;
  var _veganSet = false;
  var _vegetarianSet = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenFreeStateSet = widget.currentFilters![filter.glutenfree]!;
    _lactoseFreeStateSet = widget.currentFilters![filter.lactosefree]!;
    _veganSet = widget.currentFilters![filter.vegan]!;
    _vegetarianSet = widget.currentFilters![filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'Meals') {
      //     Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(builder: (context) => TabsScreen()));
      //   }
      // }),
      appBar: AppBar(title: Text("Your Filters")),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            filter.glutenfree: _glutenFreeStateSet,
            filter.lactosefree: _lactoseFreeStateSet,
            filter.vegan: _veganSet,
            filter.vegetarian: _vegetarianSet
          });
          return false;
        },
        child: Column(children: [
          SwitchListTile(
            value: _glutenFreeStateSet,
            onChanged: (isChecked) {
              setState(() {
                _glutenFreeStateSet = isChecked;
              });
            },
            title: Text(
              'Gluten-Free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'only include glutenfree meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.onBackground,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _lactoseFreeStateSet,
            onChanged: (isChecked) {
              setState(() {
                _lactoseFreeStateSet = isChecked;
              });
            },
            title: Text(
              'Lactose-Free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'only include Lactose-free meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.onBackground,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _veganSet,
            onChanged: (isChecked) {
              setState(() {
                _veganSet = isChecked;
              });
            },
            title: Text(
              'vegan only',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'vegetarian meals only',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.onBackground,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _vegetarianSet,
            onChanged: (isChecked) {
              setState(() {
                _vegetarianSet = isChecked;
              });
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'only include vegetarian meal',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.onBackground,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
        ]),
      ),
    );
  }
}
