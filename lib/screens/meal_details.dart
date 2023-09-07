import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetails extends StatelessWidget {
  const MealDetails(
      {super.key, required this.meal, required this.onToggleFavorite});

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title), actions: [
        IconButton(
          onPressed: () {
            onToggleFavorite(meal);
          },
          icon: const Icon(Icons.star),
        )
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
            ),
            const SizedBox(height: 15),
            const Text(
              'Ingredients',
              style: TextStyle(
                color: Color.fromRGBO(227, 155, 61, 1),
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                for (final ingredient in meal.ingredients)
                  Text(
                    ingredient,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  )
              ],
            ),
            const SizedBox(height: 15),
            const Text(
              'Steps',
              style: TextStyle(
                color: Color.fromRGBO(227, 155, 61, 1),
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                for (final step in meal.steps)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    child: Text(
                      step,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
