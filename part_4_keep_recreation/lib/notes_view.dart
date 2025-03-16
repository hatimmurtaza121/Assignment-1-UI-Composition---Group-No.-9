import 'package:flutter/material.dart';
import 'package:part_4_keep_recreation/note_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NotesScreen extends StatelessWidget {
  NotesScreen({super.key});

  final List<NoteWidget> notes = [
    NoteWidget(
      color: Color(0xffe9eaed),
      items: ["Abdullah", "Zara", "Ahmed", "Muriyum\n", "Emaan", "Arsal"],
      showBullets: false,
    ),
    NoteWidget(
      color: Colors.white,
      title: 'Things to buy',
      items: [
        "Carry case",
        "Fan capacitor",
        "Small locks (3)",
        "USB A - C",
        "Masks box",
        "Lighter",
        "Petrol",
        "Extension",
      ],
      tickedItems: 12,
      showBullets: true,
      tags: ["Travel"],
    ),
    NoteWidget(
      color: Color(0xffe6c9a9),
      title: 'To Do',
      items: [
        "Complete Ruby course",
        "Prepare WP final paper",
        "Complete Flutter course",
      ],
      tickedItems: 1,
      showBullets: true,
      icons: [Icons.account_circle_outlined, Icons.account_circle],
    ),
    NoteWidget(
      color: Color(0xffccff90),
      title: 'Big Wolf',
      items: [
        "https://itnext.io/dart-before-you-flutter-part-1",
        "Things to remember",
        "Enlarge animation is revision Jan 24, 4:50 PM",
        "CodeMagic Script...",
      ],
      showBullets: false,
    ),
    NoteWidget(
      color: Color(0xfffdcfe9),
      title: 'Before offer questionnaire',
      items: [
        "What are your timings?",
        "Leaves: annual? casual? sick?",
        "Increments policy?",
        "Salary disbursement date and via what medium?",
      ],
      showBullets: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: "Search your notes...",
            prefixIcon: const Icon(Icons.menu),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.view_agenda_outlined, size: 25),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.account_circle_outlined, size: 25),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("PINNED", textAlign: TextAlign.left),
            ),
          ),
          Expanded(
            child: MasonryGridView.count(
              padding: const EdgeInsets.only(bottom: 80),
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemBuilder: (context, index) {
                return notes[index];
              },
              itemCount: notes.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.check_box_outlined),
                  onPressed: () {},
                ),
                IconButton(icon: Icon(Icons.brush_outlined), onPressed: () {}),
                IconButton(
                  icon: Icon(Icons.mic_none_outlined),
                  onPressed: () {},
                ),
                IconButton(icon: Icon(Icons.image_outlined), onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
