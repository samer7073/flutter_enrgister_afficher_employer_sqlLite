import 'package:flutter/material.dart';
import 'package:flutter_application_tp5/model_employer.dart';

import 'custom_checkbox.dart';
import 'custom_elevated_button.dart';
import 'custom_radiobox.dart';
import 'custom_text_form_field.dart';
import 'databaseHelper/dataBaseHelper.dart';

void main() {
  runApp(const AddEmployee());
}

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  final formKey = GlobalKey<FormState>();
  bool? valuechk1, valuechk2;
  String radioValueselected = "";
  Employe emp = (Employe());
  DataBaseHelper db = DataBaseHelper();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Ajouter un nouveau employee"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        CustomText(
                          label: "Matricule",
                          hint: "Donner la matricule employee",
                          uneIcone: Icons.person,
                          valider: (value) {
                            if ((value == null) || (value.length == 0))
                              return "Matricule est obligatoire";
                            if (value.length != 6)
                              return "forma matricule incorrecte";
                            else
                              return null;
                          },

                          //AJOUTER DB TP
                          onsaved: (value) {
                            emp.setMatricule = value!;
                          },
                        ),
                        CustomText(
                          label: "Nom",
                          hint: "Donner le nom du l' employee",
                          uneIcone: Icons.person,
                          valider: (value) {
                            if ((value == null) || (value.length == 0))
                              return "Nom est obligatoire";

                            if ((value.length < 3))
                              return "forma Nom incorrecte";
                            else
                              return null;
                          },
                          onsaved: (value) {
                            emp.setNom = value!;
                          },
                        ),
                        CustomText(
                          label: "Prenom",
                          hint: "Donner le prenom employee",
                          uneIcone: Icons.person,
                          valider: (value) {
                            if ((value == null) || (value.length == 0))
                              return "prenom est obligatoire";
                            if (value.length < 3)
                              return "forma prenom incorrecte";
                            else
                              return null;
                          },
                          onsaved: (value) {
                            emp.setPrenom = value!;
                          },
                        ),
                        CustomText(
                          label: "Age",
                          hint: "Donner l'age de l'employee",
                          uneIcone: Icons.person,
                          TypeClavier: TextInputType.number,
                          valider: (value) {
                            if ((value == null) || (value.length == 0))
                              return "age est obligatoire";

                            if (int.parse(value) < 20)
                              return "forma age incorrecte";
                            else
                              return null;
                          },
                          onsaved: (value) {
                            emp.setAge = int.parse(value!);
                          },
                        ),
                        CustomCheckbox(
                          value: valuechk1,
                          msg: "Permis A",
                          onchanged: (value) {
                            setState(() {
                              valuechk1 = value;
                            });
                          },
                        ),
                        CustomCheckbox(
                          value: valuechk2,
                          msg: "Permis B",
                          onchanged: (value) {
                            setState(() {
                              valuechk2 = value;
                            });
                          },
                        ),
                        CustomRadioBox(
                          titre: "Homme",
                          soustitre:
                              "Selectionner cette option si vous etes un homme",
                          value: "H",
                          groupvalue: radioValueselected,
                          onchanged: (value) {
                            setState(() {
                              radioValueselected = value!;
                            });
                          },
                        ),
                        CustomRadioBox(
                          titre: "Femme",
                          soustitre:
                              "Selectionner cette option si vous etes un homme",
                          value: "F",
                          groupvalue: radioValueselected,
                          onchanged: (value) {
                            setState(() {
                              radioValueselected = value!;
                            });
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomButton(
                              TitreButoon: "Enregistrer",
                              couleur: Colors.green,
                              onpressed: () {
                                if (formKey.currentState?.validate() ?? false) {
                                  print("Form OK");
                                  //la recuperation desd donness validee dasn l'objet employee
                                  formKey.currentState!.save();
                                  //PERSISTANCE DANS LA BD
                                  print(emp);
                                  db.add(emp);
                                } else {
                                  print("not ok");
                                }
                              },
                            ),
                            CustomButton(
                              TitreButoon: "Annuler",
                              couleur: Colors.green,
                              onpressed: () async {
                                if (formKey.currentState?.validate() ?? false) {
                                  print("Form OK");
                                  // Retrieve validated data into the employee object
                                  formKey.currentState!.save();

                                  // Persist data in the database
                                  int result = await db.add(emp);

                                  if (result != -1) {
                                    print("Employee added successfully.");
                                  } else {
                                    print("Error adding employee.");
                                  }
                                } else {
                                  print("Form not OK");
                                }
                              },
                            ),
                          ],
                        )
                      ],
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
