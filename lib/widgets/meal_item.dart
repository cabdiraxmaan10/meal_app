import 'package:flutter/material.dart';
import 'package:meal_app_screens/models/meal.dart';
import 'package:meal_app_screens/screens/meal_detaial_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String? title;
  final String? imageUrl;
  final int? duration;
  final Complexity? complexity;
  final Affordiblity? affordiblity;

  MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordiblity,
  });
  // selected item funtion
  void selectedMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    )
        .then((value) {
      if (value != null) {
        // removeItem(value);
      }
    });
  }

  String get affordiblityText {
    switch (affordiblity) {
      case Affordiblity.Affordible:
        return 'Affrodibility';
        break;
      case Affordiblity.Pricey:
        return 'Pricey';
        break;
      case Affordiblity.Luxurious:
        return 'Expensive';
        break;
      default:
        return 'Unkhown';
    }
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challanging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unkhown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(imageUrl!),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  width: 220,
                  child: Container(
                    color: Colors.black54,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      title!,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          letterSpacing: 1.0),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.schedule,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text('$duration min')
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.work,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(complexityText)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(affordiblityText)
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
