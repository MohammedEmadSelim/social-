
import 'package:flutter/material.dart';
import '../../services/services.dart';
import '../../shared/screens.dart';

// ignore: must_be_immutable
class CreateProfileScreen extends StatelessWidget {
  CreateProfileScreen({super.key});
  var formKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var phoneNumber = TextEditingController();
  var iconPaswordVisible = false;
  var psswordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Create profile '),
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
                  //first textFormField for( name ) the the first lesson for firebase
                  TextFormField(
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(psswordFocus);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'name can\'t be empty';
                      }
                      return null;
                    },
                    controller: name,
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
                      label: Text('Enter a Valid name'),
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
                  TextFormField(
                    obscureText: false,
                    focusNode: psswordFocus,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ('phoneNumber can\'t be empty');
                      }

                      for (int i = 0; i < value.length; i++) {
                        if (value.codeUnitAt(i) < 48 ||
                            value.codeUnitAt(i) > 57) {
                          return 'phone number cannot contain characters';
                        }
                      }
                      return null;
                    },
                    controller: phoneNumber,
                    keyboardType: TextInputType.visiblePassword,
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
                      label: Text('Enter phone Number'),
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
                  ActionButton(
                    title: 'Craete',
                    butnWidth: double.infinity,
                    btnHeight: 60,
                    titleStyle: h5Bold,
                    action: () async {
                      fireBseServices().getUser();
                      if (formKey.currentState!.validate()) {
                        fireBseServices().createUser(
                          name: name.text,
                          phoneNumber: phoneNumber.text,
                          context: context,
                        );
                      }
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



