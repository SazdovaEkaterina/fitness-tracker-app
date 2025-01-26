import 'package:flutter/material.dart';
import 'package:new_flutter_project/models/workout_model.dart';
import 'package:new_flutter_project/widgets/workout/workout_card.dart';

class workoutGrid extends StatefulWidget {
  final List<Workout> workouts;
  const workoutGrid({super.key, required this.workouts});

  @override
  State<workoutGrid> createState() => _workoutGridState();
}

class _workoutGridState extends State<workoutGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(padding: const EdgeInsets.all(4),
        crossAxisCount: 2,
    crossAxisSpacing: 4,
    mainAxisSpacing: 4,
    semanticChildCount: 250,
    childAspectRatio: 200/ 244,
    shrinkWrap: true,
      children: widget.workouts.map((workout) => workoutCard(
        id: workout.id, name: workout.name, image: workout.image,
      )).toList()
    );
  }
}
