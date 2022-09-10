import 'package:flutter/material.dart';
import 'package:meal_app_screens/dummy_data.dart';
import 'package:meal_app_screens/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: Dummy_Data.map((data) {
        return CategoryItem(
          data.id!,
          data.title!,
          data.color!,
        );
      }).toList(),
    );
  }
}
