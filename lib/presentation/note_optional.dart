import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:my_ledger_app/note_list.dart';

class NoteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Note'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: optionalNote.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text(
                      optionalNote[index],
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    onTap: () => {
                      Navigator.of(context).pop(optionalNote[index]),
                    },
                  ),
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
