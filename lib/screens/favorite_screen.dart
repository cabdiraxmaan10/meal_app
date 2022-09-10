import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;

  FavoriteScreen(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return Center(
          child: Text(
        'Favorite screen is empty',
        style: Theme.of(context).textTheme.titleLarge,
      ));
    } else {
      return ListView.builder(
        itemCount: favoriteMeal.length,
        itemBuilder: (context, index) {
          return MealItem(
            id: favoriteMeal[index].id!,
            title: favoriteMeal[index].title,
            imageUrl: favoriteMeal[index].imageUrl,
            duration: favoriteMeal[index].duration,
            complexity: favoriteMeal[index].complexity,
            affordiblity: favoriteMeal[index].affordiblity,
          );
        },
      );
    }
  }
}
