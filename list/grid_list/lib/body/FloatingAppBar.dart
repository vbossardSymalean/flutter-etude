import 'package:flutter/material.dart';
import 'package:grid_list/model/ListItem.dart';

class FloatingAppBar extends StatelessWidget {
  FloatingAppBar({@required this.items});
  final List<ListItem> items;

  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text('App Bar'),
          floating: true,
          // flexibleSpace: Placeholder(),
          expandedHeight: 200,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final item = items[index];
            return ListTile(title: item.buildTitle(context),subtitle: item.buildSubtitle(context));
          }),
          // delegate:
          //   SliverChildBuilderDelegate(
          //   (context, index) =>
          //   ListTile(title: Text('Item ${index}')),
          //   childCount: 1000,
          // )
        )
      ],
    );
  }
}
