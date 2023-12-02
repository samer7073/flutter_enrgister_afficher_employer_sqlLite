import 'package:flutter/material.dart';
import 'package:flutter_application_tp5/databaseHelper/dataBaseHelper.dart';

class ListEmployer extends StatefulWidget {
  const ListEmployer({super.key});

  @override
  State<ListEmployer> createState() => _ListEmployerState();
}

class _ListEmployerState extends State<ListEmployer> {
  DataBaseHelper db = DataBaseHelper.instance;
  List listEmplFromDB = [];
  Future readData() async {
    List tmp = await db.getEmployees();
    setState(() {
      listEmplFromDB.addAll(tmp);
    });
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listr des Employes'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: listEmplFromDB.length,
        itemBuilder: (context, index) {
          String nom = listEmplFromDB[index]['nom'].toString();
          String prenom = listEmplFromDB[index]['prenom'].toString();
          String matricule = listEmplFromDB[index]['matricule'].toString();
          return ListTile(
            title: Text(matricule),
            subtitle: Text(
                '${listEmplFromDB[index]['nom']} ${listEmplFromDB[index]['prenom']}'),
          );
        },
      ),
    );
  }
}
