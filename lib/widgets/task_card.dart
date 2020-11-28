import 'package:flutter/material.dart';

import '../main.dart';

// Widget voor verschillende app categorien
class TaskCard extends StatelessWidget {
  final String title;
  final String desc;
  final Color color;

  const TaskCard({Key key, this.title, this.desc, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 19.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color ?? myColors[PRIMARY],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Titel van categorie
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                title ?? 'Geen Titel',
                style: TextStyle(fontSize: 20),
              ),
            ),
            // Beschrijving van categorie
            Text(desc ?? 'Geen beschrijving gegeven.'),
            // Todo: Toevoegen van progress bar binnen elke categorie.
          ],
        ),
      ),
    );
  }
}
