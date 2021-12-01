import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";
  final Function saveFilters;
  Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];

    print("initState update");
    print({
      '_glutenFree': _glutenFree,
      '_vegetarian': _vegetarian,
      '_vegan': _vegan,
      '_lactoseFree': _lactoseFree,
    });
  }

  Widget _buildSwitchListTile(String title, String subtitle, bool currentValue,
      Function updateValueHandler) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(subtitle),
        onChanged: updateValueHandler);
  }

  void _showToast(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
                'lactose': _lactoseFree
              };
              widget.saveFilters(
                  selectedFilters, _showToast(context, "Saved to favorites!"));
              // _showToast(context, "Saved to favorites!");
            },
          )
        ],
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Add your meal selection",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  "Gluten Free", "Only include gluten free meals", _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = !_glutenFree;
                });
              }),
              _buildSwitchListTile("Lactose Free",
                  "Only include lactose free meals", _lactoseFree, (newValue) {
                setState(() {
                  _lactoseFree = !_lactoseFree;
                });
              }),
              _buildSwitchListTile("Vegan", "Only include vegan meals", _vegan,
                  (newValue) {
                setState(() {
                  _vegan = !_vegan;
                });
              }),
              _buildSwitchListTile(
                  "Vegetarian", "Only include vegetarian meals", _vegetarian,
                  (newValue) {
                setState(() {
                  _vegetarian = !_vegetarian;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
