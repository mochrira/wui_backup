import 'package:flutter/material.dart';

class HomeTypography extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Heading 1", style: Theme.of(context).textTheme.headline1),
          Text("Heading 2", style: Theme.of(context).textTheme.headline2),
          SizedBox(height: 5),
          Text("Heading 3", style: Theme.of(context).textTheme.headline3),
          SizedBox(height: 8),
          Text("Heading 4", style: Theme.of(context).textTheme.headline4),
          SizedBox(height: 12),
          Text("Heading 5", style: Theme.of(context).textTheme.headline5),
          SizedBox(height: 8),
          Text("Body Text 1", style: Theme.of(context).textTheme.bodyText1),
          SizedBox(height: 8),
          Text("Body Text 2", style: Theme.of(context).textTheme.bodyText2)
        ],
      ),
    );
  }
}