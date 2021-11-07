class Meal {
  final String id, title, imageUrl;
  final List<String> categories, ingredients, steps;
  final int duration;
  final bool isGlutenFree, isLactoseFree, isVegan, isVegetarian;
  final Complexity complexity;
  final Affordability affordability;

 const Meal({
   required this.id,
   required this.title,
   required this.imageUrl,
   required this.categories,
   required this.ingredients,
   required this.steps,
   required this.duration,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.complexity,
    required this.affordability
  }
  );
}

enum Complexity{
  Simple, Challenging, Hard
}

enum Affordability{
  Affordable, Pricey, Luxurious
}
