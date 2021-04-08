import 'package:flutter/material.dart';
import 'package:grid_list/model/ListItem.dart';

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  Widget buildTitle(BuildContext context) {
    return Text(heading, style: Theme.of(context).textTheme.headline5);
  }

  Widget buildSubtitle(BuildContext context) => null;
}
