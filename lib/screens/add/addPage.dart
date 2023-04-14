import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../shared/widgets/colors.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool _isPaint = false;
  Color _color = white;
  String day = "";
  String hour = "";
  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime datetime = DateTime.now();
    day = DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(datetime);
    hour = DateFormat(DateFormat.HOUR24_MINUTE).format(datetime);

    return Scaffold(
      backgroundColor: _color,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        //toolbarHeight: 100.2,
        //toolbarOpacity: 0.8,
        //title: Text("Add Note", style: TextStyle(color: Colors.black, fontFamily: 'ceraBold', fontSize: 30),),
        //leading: IconButton(onPressed: null, icon: Icon(FontAwesomeIcons.chevronLeft, color: darkBlue,),),
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text("Add"),
      ),
    );
  }
}

