import 'package:flutter/material.dart';
import 'package:grid_list/model/ListItem.dart';

class CustomListView extends StatelessWidget {
  CustomListView({@required this.items});
  final List<ListItem> items;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
            title: item.buildTitle(context),
            subtitle: item.buildSubtitle(context));
      },
    );
  }
}
