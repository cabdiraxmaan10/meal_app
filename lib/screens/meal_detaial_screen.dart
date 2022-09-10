import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  final Function toggaleFunction;
  final Function isMealFavorite;
  static const routeName = 'mealDetailScreen';
  MealDetailScreen(this.toggaleFunction, this.isMealFavorite);
  Widget buildTextTile(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  buildSectonTile(Widget child) {
    return Container(
      height: 200,
      width: 300,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
          border: Border.all(width: 2, color: Colors.white)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((data) {
      return data.id == mealId;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Detail Screen'),
      ),
      // ignore: sized_box_for_whitespace
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
            buildTextTile(context, 'Ingridients'),
            buildSectonTile(
              ListView.builder(
                  itemCount: selectedMeal.ingridients!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.pink,
                      elevation: 4,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          selectedMeal.ingridients![index],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            buildTextTile(context, 'Steps'),
            buildSectonTile(ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text("${index + 1}"),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  );
                })),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggaleFunction(mealId),
        child:
            isMealFavorite(mealId) ? Icon(Icons.star) : Icon(Icons.star_border),
      ),
    );
  }
}
