import 'package:flutter/material.dart';

import '../widgets/mainDrawer.dart';

class FiltersPage extends StatefulWidget {
  static const String routeName = '/filters';
  final Function _saveFilters;
  final List<bool> filters;

  const FiltersPage(this._saveFilters, this.filters);

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  List<String> _names = ['gluten-free', 'lactose-free', 'vegetarian', 'vegan'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.save,
            ),
            onPressed: () {
              List<bool> filterData = [
                widget.filters[0],
                widget.filters[1],
                widget.filters[2],
                widget.filters[3],
              ];
              widget._saveFilters(filterData);
            },
          )
        ],
        title: Text(
          'Your Filters',
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.filters.length,
              itemBuilder: (context, index) => SwitchListTile(
                value: widget.filters[index],
                onChanged: (value) {
                  setState(() {
                    widget.filters[index] = value;
                  });
                },
                subtitle: Text('Only include ${_names[index]} meals.'),
                title: Text(
                  _names[index][0].toUpperCase() + _names[index].substring(1),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
