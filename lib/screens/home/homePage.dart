import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../models/Note.dart';
import '../../providers/NoteProvider.dart';
import '../../shared/widgets/colors.dart';
import '../add/addPage.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = "/home";
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final value = Provider.of<NoteProvider>(context).allNotes;
    print('Value-----------');
    print(value);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Note List", style: TextStyle(color: Colors.black, fontFamily: 'ceraBold', fontSize: 30),),
        elevation: 0,
        actions: [
        ],
      ),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Consumer<NoteProvider>(
              builder: (context, noteProvider, _){
                return noteProvider.allNotes.isEmpty ?
                Center(
                  child: Text("Nothing for the moment...", style: TextStyle(fontSize: 20, color: Colors.black)),
                )
                    : MasonryGridView.builder(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemCount: noteProvider.allNotes.length,
                      itemBuilder: (context, i){
                        Note note = noteProvider.allNotes[i];
                        return GestureDetector(
                          onDoubleTap: (){
                            Provider.of<NoteProvider>(context, listen: false).deleteNote(note.dateTime);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(note.title, style: TextStyle(fontFamily: 'ceraBold', fontSize: 25, color: Colors.black),),
                                SizedBox(height: 10,),
                                Text(note.desc, style: TextStyle(fontSize: 20, color: Colors.black))
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: noteProvider.allNotes[i].color,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                border: Border.all(color: Colors.black, width: 1)
                            ),
                          ),
                        );
                      },
                );
              },
            )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showFullModal(context);
        },
        backgroundColor: darkBlue,
        elevation: 10,
        tooltip: 'Add Note',
        child: Icon(Icons.add, size: 30,),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _showFullModal(context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false, // should dialog be dismissed when tapped outside
      barrierLabel: "Modal", // label for barrier
      transitionDuration: Duration(milliseconds: 150), // how long it takes to popup dialog after button click
      pageBuilder: (_, __, ___) { // your widget implementation
        return AddNotePage();
      },
    );
  }
}
