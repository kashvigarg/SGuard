import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empowering_humanity/constants/common_widgets/background_main.dart';
import 'package:empowering_humanity/constants/common_widgets/banner.dart';
import 'package:empowering_humanity/constants/common_widgets/base_container.dart';
import 'package:empowering_humanity/constants/common_widgets/app_button.dart';
import 'package:empowering_humanity/constants/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

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
    return Scaffold(
      body: BgMain(
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                BaseContainer(
                  color: Color.fromRGBO(221, 219, 200, 0.79),
                  height: SizeConfig.screenHeight * 0.08,
                  width: SizeConfig.screenWidth * 0.6,
                  curveRadius: 9,
                  widget: Center(
                      child: Text(
                    "FEEL SAFE",
                    textScaleFactor: 1.7,
                  )),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.06,
                ),
                BaseContainer(
                  height: SizeConfig.screenHeight * 0.70,
                  width: SizeConfig.screenWidth * 0.8,
                  curveRadius: 40,
                  widget: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            constraints: BoxConstraints(
                                minHeight: SizeConfig.screenHeight * 0.05,
                                maxWidth: SizeConfig.screenWidth * 0.5),
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
                                        borderRadius: BorderRadius.circular(6)),
                                    constraints: BoxConstraints(
                                        minHeight: 30,
                                        maxWidth: SizeConfig.screenWidth * 0.7),
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
                                        borderRadius: BorderRadius.circular(6)),
                                    constraints: BoxConstraints(
                                        minHeight: 30,
                                        maxWidth: SizeConfig.screenWidth * 0.7),
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
                                        borderRadius: BorderRadius.circular(6)),
                                    constraints: BoxConstraints(
                                        minHeight: 30,
                                        maxWidth: SizeConfig.screenWidth * 0.7),
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
                                        borderRadius: BorderRadius.circular(6)),
                                    constraints: BoxConstraints(
                                        minHeight: 30,
                                        maxWidth: SizeConfig.screenWidth * 0.7),
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
                                        borderRadius: BorderRadius.circular(6)),
                                    constraints: BoxConstraints(
                                        minHeight: 30,
                                        maxWidth: SizeConfig.screenWidth * 0.7),
                                    labelText: "Contact 2",
                                    fillColor: Colors.white,
                                    filled: true),
                              ),
                              SizedBox(
                                height: SizeConfig.screenHeight * 0.02,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: AppButton(
                                    pressedFunc: () {
                                      final user = UserModel(
                                        name: controllerName.text,
                                        dob: DateTime.parse(controllerDob.text),
                                        contact1: (controllerContact1.text),
                                        contact2: (controllerContact2.text),
                                        status: ["Adult"],
                                        //status: Status.Adolescent);
                                      );
                                      //TODO await
                                      createUser(user);
                                      GoRouter.of(context).push('/user');
                                    },
                                    buttonColor:
                                        Color.fromRGBO(66, 139, 202, 1),
                                    buttonText: "SUBMIT",
                                    textColor: Colors.white,
                                    height: SizeConfig.screenHeight * 0.05,
                                    width: SizeConfig.screenWidth * 0.3),
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
    );
  }
}

// Stream<List<UserModel>> readUsers() => FirebaseFirestore.instance
//     .collection('users')
//     .snapshots()
//     .map((snapshot) => snapshot.docs
//         .map((doc) => UserModel.fromJson(doc.data() as String))
//         .toList());

getUser() async {
  final db = FirebaseFirestore.instance.collection('users');
  final ref = db.doc().withConverter(
        fromFirestore: UserModel.fromFirestore,
        toFirestore: (UserModel user, _) => user.toFirestore(),
      );
  final docSnap = await ref.get();
  final user = docSnap.data();
  return user;
}

Future createUser(UserModel user) async {
  final docuser = FirebaseFirestore.instance.collection('users').doc();
  // user.id = docuser.id;

  final json = user.toFirestore();
  await docuser.set(json);
}
