import 'package:flutter/material.dart';

class StatsPage extends StatelessWidget {
  static const routeName = '/stats';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Stats pagina (3)',
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
