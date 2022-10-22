import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empowering_humanity/constants/common_widgets/background_main.dart';
import 'package:empowering_humanity/constants/common_widgets/banner.dart';
import 'package:empowering_humanity/constants/common_widgets/base_container.dart';
import 'package:empowering_humanity/constants/common_widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../models/user_model.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationForm();
}

class _RegistrationForm extends State<RegistrationForm> {
  final controllerName = TextEditingController();
  final controllerStatus = TextEditingController();
  final controllerDob = TextEditingController();
  final controllerContact1 = TextEditingController();
  final controllerContact2 = TextEditingController();

  var items = ['Senior Citizen', 'Adolescent', 'Below 18'];

  @override
  Widget build(BuildContext context) {
    final deviceInfo = MediaQuery.of(context);
    final screenHeight = deviceInfo.size.height;
    final screenWidth = deviceInfo.size.width;

    return MediaQuery(
        data: MediaQueryData(),
        child: Scaffold(
          body: BgMain(
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    BaseContainer(
                      color: Color.fromRGBO(221, 219, 200, 0.79),
                      height: screenHeight * 0.08,
                      width: screenWidth * 0.6,
                      curveRadius: 9,
                      widget: Center(
                          child: Text(
                        "FEEL SAFE",
                        textScaleFactor: 1.7,
                      )),
                    ),
                    SizedBox(
                      height: screenHeight * 0.06,
                    ),
                    BaseContainer(
                      height: screenHeight * 0.70,
                      width: screenWidth * 0.8,
                      curveRadius: 40,
                      widget: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                    minHeight: screenHeight * 0.05,
                                    maxWidth: screenWidth * 0.5),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 124, 131, 152),
                                    borderRadius: BorderRadius.circular(9)),
                                child: Center(
                                    child: Text(
                                  "REGISTER HERE",
                                  textScaleFactor: 1.3,
                                )),
                              ),
                              Form(
                                  child: Column(
                                children: [
                                  SizedBox(
                                    height: 45,
                                  ),
                                  TextFormField(
                                    controller: controllerName,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        constraints: BoxConstraints(
                                            minHeight: 30,
                                            maxWidth: screenWidth * 0.7),
                                        labelText: "Name",
                                        fillColor: Colors.white,
                                        filled: true),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  DropdownButtonFormField(
                                    // TODO : add controller
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    onTap: () {},
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        constraints: BoxConstraints(
                                            minHeight: 30,
                                            maxWidth: screenWidth * 0.7),
                                        labelText: "Status",
                                        fillColor: Colors.white,
                                        filled: true),
                                    onChanged: (Object? value) {},
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: controllerDob,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        constraints: BoxConstraints(
                                            minHeight: 30,
                                            maxWidth: screenWidth * 0.7),
                                        labelText: "Date of Birth",
                                        fillColor: Colors.white,
                                        filled: true),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: controllerContact1,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        constraints: BoxConstraints(
                                            minHeight: 30,
                                            maxWidth: screenWidth * 0.7),
                                        labelText: "Contact 1",
                                        fillColor: Colors.white,
                                        filled: true),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: controllerContact2,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        constraints: BoxConstraints(
                                            minHeight: 30,
                                            maxWidth: screenWidth * 0.7),
                                        labelText: "Contact 2",
                                        fillColor: Colors.white,
                                        filled: true),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.02,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: AppButton(
                                        pressedFunc: () {
                                          final user = User(
                                              name: controllerName.text,
                                              dob: DateTime.parse(
                                                  controllerDob.text),
                                              contact1:
                                                  (controllerContact1.text),
                                              contact2:
                                                  (controllerContact2.text),
                                              status: Status.Adolescent);

                                          createUser(user);
                                        },
                                        buttonColor:
                                            Color.fromRGBO(66, 139, 202, 1),
                                        buttonText: "SUBMIT",
                                        textColor: Colors.white,
                                        height: screenHeight * 0.05,
                                        width: screenWidth * 0.3),
                                  )
                                ],
                              ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

Future createUser(User user) async {
  final docuser = FirebaseFirestore.instance.collection('users').doc();
  user.id = docuser.id;

  final json = user.toJson();
  await docuser.set(json);
}

Stream<List<User>> readUsers() =>
    FirebaseFirestore.instance.collection('users').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
