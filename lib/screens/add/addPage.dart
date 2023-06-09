import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:note/providers/NoteProvider.dart';
import 'package:note/providers/UiProvider.dart';
import 'package:note/screens/home/homePage.dart';
import 'package:provider/provider.dart';
import '../../../shared/widgets/text_input.dart';
import '../../providers/UiProvider.dart';
import '../../providers/UiProvider.dart';
import '../../shared/widgets/colors.dart';
import 'package:note/models/Note.dart';
import 'package:provider/provider.dart';

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
        title: Text("Add Note", style: TextStyle(color: Colors.black, fontFamily: 'ceraBold', fontSize: 30),),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(FontAwesomeIcons.chevronLeft, color: Colors.black,),),
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(80,10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                  side: BorderSide(width: 1)
              ),
              primary: lightBlue,
            ),
            child: !_isLoading ? Text("Save", style: TextStyle(color: darkBlue, fontSize: 20, fontFamily: 'ceraMedium')): Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(color: darkBlue),
              ),
            ),
            onPressed: (){
              setState(() {
                _isLoading = true;
              });
              Provider.of<NoteProvider>(context, listen: false).addNote(
                  Note(title: titleController.text, desc: descController.text, dateTime: DateTime.now(), color: _color)
              );
              Future.delayed(Duration(seconds: 1), (){
                setState(() {
                  _isLoading = false;
                });
                Navigator.pushReplacementNamed(context, MyHomePage.routeName);
              });
            },
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: titleController,
                            textCapitalization: TextCapitalization.sentences,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(fontFamily: 'ceraBold', fontSize: 25,),
                            autofocus: true,

                            decoration: addTextInputDecoration.copyWith(
                                hintText: 'Title',
                                hintStyle: TextStyle(fontFamily: 'ceraBold', fontSize: 25,)
                            ),
                            validator: (val) => val!.isEmpty ? 'Enter a title' : null,
                            onChanged: (val) {
                              //setState(() => email = val);
                              getTime();
                            },
                          ),
                          TextFormField(
                            controller: descController,
                            style: TextStyle(fontSize: 20),
                            textCapitalization: TextCapitalization.sentences,
                            textInputAction: TextInputAction.done,
                            minLines: 2,
                            maxLines: 100,
                            decoration: addTextInputDecoration.copyWith(
                              hintText: 'Your note...',
                              hintStyle: TextStyle(fontSize: 20),
                            ),
                            validator: (val) => val!.isEmpty ? 'Enter a note' : null,
                            onChanged: (val) {
                              //setState(() => email = val);
                              getTime();
                            },
                          ),
                          SizedBox(height: 30.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ChangeNotifierProvider.value(
                  value: UiProvider(),
                  child: Consumer<UiProvider>(
                    builder: (context, uiProvider, _){
                      return Row(
                        mainAxisAlignment: uiProvider.isPaint ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Icon(FontAwesomeIcons.palette, color: Colors.black, size: 30,),
                            onTap: (){
                              Provider.of<UiProvider>(context, listen: false).toggle();
                            },
                          ),
                          SizedBox(width: 20,),
                          uiProvider.isPaint ?
                          Expanded(
                            child: Container(
                              height: 30,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: colors.length,
                                itemBuilder: (context, i){
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 5),
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: colors[i],
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.black, width: _color == colors[i] ? 5 : 1)
                                      ),
                                    ),
                                    onTap: (){
                                      setState(() {
                                        _color = colors[i];
                                      });
                                    },
                                  );
                                },
                              ),
                            ),
                          )
                              :Text("$day $hour", style: TextStyle(fontSize: 20, color: Colors.black))
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getTime(){
    setState(() {
      DateTime datetime = DateTime.now();
      day = DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(datetime);
      hour = DateFormat(DateFormat.HOUR24_MINUTE_SECOND).format(datetime);
    });
  }
}

