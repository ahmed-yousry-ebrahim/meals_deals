enum Complexity { Simple, Challenging, Hard }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['categories'] = categories;
    data['title'] = title;
    data['imageUrl'] = imageUrl;
    data['ingredients'] = ingredients;
    data['steps'] = steps;
    data['duration'] = duration;
    data['complexity'] = complexity;
    data['isGlutenFree'] = isGlutenFree;
    data['isLactoseFree'] = isLactoseFree;
    data['isVegan'] = isVegan;
    data['isVegetarian'] = isVegetarian;
    return data;
  }

  Meal.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        categories = data['categories'],
        title = data['title'],
        imageUrl = data['imageUrl'],
        ingredients = data['ingredients'],
        steps = data['steps'],
        duration = data['duration'],
        complexity = data['complexity'],
        isGlutenFree = data['isGlutenFree'],
        isLactoseFree = data['isLactoseFree'],
        isVegan = data['isVegan'],
        isVegetarian = data['isVegetarian'];
}
