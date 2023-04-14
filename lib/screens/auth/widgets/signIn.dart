import 'package:flutter/material.dart';
import 'package:note/screens/home/homePage.dart';
import 'package:note/shared/widgets/colors.dart';

import '../../../shared/widgets/text_input.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Sign In", style: TextStyle(color: red, fontFamily: 'ceraBold', fontSize: 30)),
                  ],
                ),
                SizedBox(height: 7,),
                Row(
                  children: [
                    Text("Get started right where you left off...", style: TextStyle(color: Colors.black, fontSize: 17)),
                  ],
                ),
                Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(height: 110.0),
                              TextFormField(
                                controller: emailController,
                                autofocus: true,
                                keyboardType: TextInputType.emailAddress,
                                //maxLines: 15,
                                //minLines: 10,
                                decoration: textInputDecoration.copyWith(hintText: 'test@gmail.com', label: Text("Email")),
                                validator: (val) => !val!.contains("@")  ? 'Enter a valid email' : null,
                                onChanged: (val) {
                                  //setState(() => password = val);
                                },
                              ),
                              SizedBox(height: 20.0),
                              TextFormField(
                                controller: passController,
                                obscureText: true,
                                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                                validator: (val) => val!.length < 6 ? 'Enter a password 6+ chars long' : null,
                                onChanged: (val) {
                                  //setState(() => password = val);
                                },
                              ),
                              SizedBox(height: 30.0),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(200,60),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                ),
                                child: !_isLoading ? Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'ceraMedium')): Center(
                                  child: CircularProgressIndicator(color: Colors.white),
                                ),
                                onPressed: (){
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      _isLoading = true;
                                    });

                                    Navigator.pushReplacementNamed(context, MyHomePage.routeName);

                                    Future.delayed(Duration(seconds: 2), (){
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      //Provider.of<AuthProvider>(context, listen: false).login();
                                      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(title: "Note List")));
                                    });
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not yet member?", style: TextStyle(color: Colors.black, fontSize: 15)),
                    SizedBox(width: 5,),
                    InkWell(
                        onTap: () => widget.toggleView(),
                        child: Text("Sign Up", style: TextStyle(color: red, fontSize: 17, fontFamily: 'ceraMedium'))
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
