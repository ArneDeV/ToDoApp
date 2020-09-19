import 'package:flutter/material.dart';

class VandaagPage extends StatelessWidget {
  static const routeName = '/vandaag';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Vandaag pagina (1)',
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
