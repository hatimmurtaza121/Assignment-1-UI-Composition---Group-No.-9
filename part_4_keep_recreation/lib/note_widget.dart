import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    super.key,
    required this.color,
    this.title = '',
    required this.items,
    this.tickedItems = 0,
    this.showBullets = false,
    this.icons = const <Icon>[],
    this.tags = const <String>[],
  });

  final Color color;
  final String title;
  final bool showBullets;
  final List<String> items;
  final int tickedItems;

  final dynamic icons;
  final dynamic tags;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (title.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              Column(
                children:
                    items.map((item) {
                      return ListTile(
                        leading:
                            showBullets
                                ? Icon(Icons.check_box_outline_blank, size: 18)
                                : null,
                        title: Text(item),
                      );
                    }).toList(),
              ),
              if (tickedItems > 0)
                Text(
                  "+ $tickedItems ticked items",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              if (icons.isNotEmpty)
                Row(
                  children: [
                    for (var icon in icons)
                      IconButton(icon: Icon(icon), onPressed: () {}),
                  ],
                ),
              if (tags.isNotEmpty)
                for (var tag in tags)
                  Chip(
                    label: Text(tag),
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
