import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app_screens/models/meal.dart';
import 'package:meal_app_screens/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = 'categoryMealScreen';
  final List<Meal> favoriteMeal;
  CategoryMealScreen(this.favoriteMeal);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeal;
  bool _loadedInitData = false;
  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final modelRoute =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final categoryId = modelRoute['id'];
      categoryTitle = modelRoute['title'] as String;

      displayedMeal = widget.favoriteMeal.where((data) {
        return data.categories!.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  // void removeItem(String mealId) {
  //   setState(() {
  //     displayedMeal.removeWhere((mealData) => mealData.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemCount: displayedMeal.length,
        itemBuilder: (context, index) {
          return MealItem(
            id: displayedMeal[index].id!,
            title: displayedMeal[index].title,
            imageUrl: displayedMeal[index].imageUrl,
            duration: displayedMeal[index].duration,
            complexity: displayedMeal[index].complexity,
            affordiblity: displayedMeal[index].affordiblity,
          );
        },
      ),
    );
  }
}
