import 'package:flutter/material.dart';
import '/screens/categories_screen.dart';
import '/screens/favorite_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, dynamic>> _pages;
  int pageIndex = 0;
  @override
  void initState() {
    _pages = [
      {
        'pages': CategoriesScreen(),
        'title': 'CategoryScreen',
      },
      {
        'pages': FavoriteScreen(widget.favoriteMeals),
        'title': 'Favorite Screen'
      }
    ];

    super.initState();
  }

  void selectedPageIndex(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[pageIndex]['title']),
      ),
      drawer: Drawer(child: MainDrawer()),
      body: _pages[pageIndex]['pages'],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: selectedPageIndex,
          backgroundColor: Colors.pink,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.yellow,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Category'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite '),
          ]),
    );
  }
}
