import 'package:flutter/material.dart';

class BelangrijkPage extends StatelessWidget {
  static const routeName = '/belangrijk';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Belangrijk pagina (2)',
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
