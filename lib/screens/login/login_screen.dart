import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/login/signUp_screen.dart';
import 'package:flutter_application_2/shared/screens.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var email = TextEditingController();

  var password = TextEditingController();

  var formKey = GlobalKey<FormState>();

  var psswordFocus = FocusNode();

  var iconPaswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login '),
        ),
        backgroundColor: teal,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(psswordFocus);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'email can\'t be empty';
                      }
                      return null;
                    },
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: white,
                    style: title1,
                    decoration: InputDecoration(
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(
                          color: white,
                          width: 2,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(
                          color: lightRed,
                          width: 2,
                        ),
                      ),
                      label: Text('Enter a Valid Email'),
                      labelStyle: title1,
                      // hintText: '012******',
                      // hintStyle: title1,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(
                          color: white,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(
                            color: white,
                            width: 2,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  StatefulBuilder(
                    builder: (BuildContext context,
                            void Function(void Function()) setState) =>
                        TextFormField(
                      obscureText: iconPaswordVisible,
                      focusNode: psswordFocus,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ('Password can\'t be empty');
                        }
                        return null;
                      },
                      controller: password,
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: white,
                      style: title1,
                      decoration: InputDecoration(
                        suffixIcon: iconPaswordVisible == true
                            ? IconButton(
                                icon: Icon(
                                  Icons.lock,
                                  color: white,
                                ),
                                onPressed: () {
                                  iconPaswordVisible = !iconPaswordVisible;
                                  setState(() {});
                                },
                              )
                            : IconButton(
                                icon: Icon(
                                  Icons.lock_open,
                                  color: white,
                                ),
                                onPressed: () {
                                  iconPaswordVisible = !iconPaswordVisible;
                                  setState(() {});
                                },
                              ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(
                            color: white,
                            width: 2,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(
                            color: lightRed,
                            width: 2,
                          ),
                        ),
                        label: Text('Enter Password'),
                        labelStyle: title1,
                        // hintText: '012******',
                        // hintStyle: title1,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(
                            color: white,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              color: white,
                              width: 2,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ActionButton(
                    title: 'Login',
                    butnWidth: double.infinity,
                    btnHeight: 60,
                    titleStyle: h5Bold,
                    action: () {
                      if (formKey.currentState!.validate()) {
                        print('===========================');
                        print(email.text);
                        print('===========================');
                        print(password.text);
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forget My Password',
                        style: title1,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 110,
                  ),
                  ActionButton(
                    title: 'Login With Google ',
                    butnWidth: double.infinity,
                    action: () {},
                    btnHeight: 60,
                    titleStyle: h5Bold,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ActionButton(
                    title: 'Login With Facebook ',
                    butnWidth: double.infinity,
                    action: () {},
                    btnHeight: 60,
                    titleStyle: h5Bold,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'I Don\'t Have An Account',
                        style: title1,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
