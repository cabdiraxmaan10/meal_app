import 'package:flutter/material.dart';
import 'package:meal_app_screens/dummy_data.dart';
import 'package:meal_app_screens/models/meal.dart';
import 'screens/filters_screen.dart';
import '/screens/filters_screen.dart';
import '/screens/tabs_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/category_meal_screen.dart';
import '../screens/meal_detaial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false,
  };
  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];
  void setFilters(Map<String, bool> setFilterData) {
    setState(() {
      _filters = setFilterData;
      bool _isGluteenFree = setFilterData['gluten'] as bool;
      bool _IsLactose = setFilterData['lactose'] as bool;
      bool _isVegan = setFilterData['vegan'] as bool;
      bool _isVegeterian = setFilterData['vegeterian'] as bool;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (_isGluteenFree && !meal.isGluteenFree) {
          return false;
        }
        if (_IsLactose && !meal.isLactoseFree) {
          return false;
        }
        if (_isVegeterian && !meal.isVegeteria) {
          return false;
        }
        if (_isVegan && !meal.isVegan) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final exsistingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (exsistingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(exsistingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String mealid) {
    return _favoriteMeals.any((meal) => meal.id == mealid);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyLarge: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyMedium: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            titleLarge:
                TextStyle(fontSize: 24, fontFamily: ' RobotoCondensed')),
      ),
      initialRoute: '/',
      routes: {
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(availableMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorite),
        '/': (context) => TabsScreen(_favoriteMeals),
        FilterScreen.routeName: (context) => FilterScreen(setFilters),
      },
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(builder: (context) {
      //     return CategoriesScreen();
      //   });
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return CategoriesScreen();
        });
      },
    );
  }
}
