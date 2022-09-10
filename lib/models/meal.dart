enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordiblity {
  Affordible,
  Pricey,
  Luxurious,
}

class Meal {
  final String? id;
  final List<String>? categories;
  final String? title;
  final String? imageUrl;
  final List<String>? ingridients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordiblity affordiblity;
  final bool isGluteenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegeteria;
  Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingridients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordiblity,
    required this.isGluteenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegeteria,
  });
}
