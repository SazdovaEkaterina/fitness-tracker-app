import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/workout_model.dart';
import '../services/api_service.dart';
import '../widgets/workout/workout_grid.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Workout> workouts = [];

  @override
  void initState() {
    super.initState();
    getworkoutFromAPI();
  }

  void getworkoutFromAPI() async {
    ApiService.getworkoutFromworkoutAPI().then((response) {
      var data = List.from(json.decode(response.body)["results"]);
      setState(() {
        workouts = data.asMap().entries.map<Workout>((element) {
          element.value['id'] = element.key + 1;
          element.value['img'] =
              "https://raw.githubusercontent.com/workoutAPI/sprites/master/sprites/workout/other/official-artwork/${element.key + 1}.png";
          return Workout.fromJson(element.value);
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu, color: Colors.white, size: 24)),
        title: const Text("Workout App", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.settings, color: Colors.white, size: 24))],
      ),
      body: workoutGrid(workouts: workouts),
    );
  }
}
