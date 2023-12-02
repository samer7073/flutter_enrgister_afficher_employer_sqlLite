// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Employe {
  String matricule;
  String nom;
  String prenom;
  int age;

  Employe({
     this.matricule="",
     this.nom="",
     this.prenom="",
     this.age=0,
  });

  String get getMatricule => this.matricule;
  set setMatricule(String matricule) => this.matricule = matricule;

  get getNom => this.nom;
  set setNom(nom) => this.nom = nom;

  get getPrenom => this.prenom;
  set setPrenom(prenom) => this.prenom = prenom;

  get getAge => this.age;
  set setAge(age) => this.age = age;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'matricule': matricule,
      'nom': nom,
      'prenom': prenom,
      'age': age,
    };
  }

  factory Employe.fromMap(Map<String, dynamic> map) {
    return Employe(
      matricule: map['matricule'] as String,
      nom: map['nom'] as String,
      prenom: map['prenom'] as String,
      age: map['age'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Employe.fromJson(String source) =>
      Employe.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Employe(matricule: $matricule, nom: $nom, prenom: $prenom, age: $age)';
  }
}
