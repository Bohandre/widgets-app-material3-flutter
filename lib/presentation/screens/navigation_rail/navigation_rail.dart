import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationRailScreen extends StatefulWidget {
  static const name = 'navigation-rail';
  const NavigationRailScreen({super.key});

  @override
  State<NavigationRailScreen> createState() => _NavigationRailScreenState();
}

class _NavigationRailScreenState extends State<NavigationRailScreen> {
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAligment = -1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            groupAlignment: groupAligment,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: labelType,
            leading: showLeading
                ? FloatingActionButton(
                    elevation: 0,
                    child: const Icon(Icons.add),
                    onPressed: () {},
                  )
                : const SizedBox(),
            trailing: showTrailing
                ? IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(
                      Icons.more_horiz_outlined,
                    ),
                  )
                : const SizedBox(),
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: Text('Favoritos'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.book),
                label: Text('Guardados'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star_border),
                selectedIcon: Icon(Icons.star),
                label: Text('Destacados'),
              ),
            ],
            selectedIndex: _selectedIndex,
          ),
          const VerticalDivider(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Item $_selectedIndex'),
                const SizedBox(
                  height: 20,
                ),
                Text('Label type: $labelType'),
                const SizedBox(
                  height: 10,
                ),
                OverflowBar(
                  spacing: 10.0,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          labelType = NavigationRailLabelType.none;
                        });
                      },
                      child: const Text('None'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          labelType = NavigationRailLabelType.selected;
                        });
                      },
                      child: const Text('Selected'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          labelType = NavigationRailLabelType.all;
                        });
                      },
                      child: const Text('All'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('Group alignment: $groupAligment'),
                const SizedBox(
                  height: 10,
                ),
                OverflowBar(
                  spacing: 10.0,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          groupAligment = -1.0;
                        });
                      },
                      child: const Text('Top'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          groupAligment = 0.0;
                        });
                      },
                      child: const Text('Center'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          groupAligment = 1.0;
                        });
                      },
                      child: const Text('Bottom'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                OverflowBar(spacing: 10.0, children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showLeading = !showLeading;
                      });
                    },
                    child: Text(showLeading ? 'Hide Leading' : 'Show Leading'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showTrailing = !showTrailing;
                      });
                    },
                    child:
                        Text(showTrailing ? 'Hide Tailing' : 'Show Trailing'),
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
