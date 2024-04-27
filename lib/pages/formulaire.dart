import 'dart:io';

import 'package:devoir_election/models/candidats.dart';
import 'package:flutter/material.dart';
import 'package:devoir_election/common/I_button.dart';
import 'package:devoir_election/common/i_datepicker.dart';
import 'package:devoir_election/common/i_input.dart';
import 'package:image_picker/image_picker.dart';
XFile? image;
String imagePath = image!.path;
File imageFile = File(imagePath);

class FormulairePage extends StatefulWidget {
  const FormulairePage({super.key});

  @override
  State<FormulairePage> createState() => _FormulairePageState();
}

class _FormulairePageState extends State<FormulairePage> {

  @override
  void initState() {
    super.initState();
    imageFile = null;
  }
  final _formKey = GlobalKey<FormState>();
   Candidate get candidate => Candidate(

  name: "name",
  firstName: "firstName",
  parti: "parti",
  description: "description",
  birthDate: "birthDate",
  imageFile: imageFile,
  );

  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BackButton(
            onPressed: () {},
          ),
        ],
        title: Text("Creation de candidat"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.grey,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.camera),
                        onPressed: takePicture,
                      ),
                      Text("Appuyer pour ajouter une image"),
                    ],
                  ),
                ),
              ),
              IIinput(
                name: 'Nom',
                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {
                  candidate.name = "value";
                },
                prefixIcon: Icon(Icons.person),

              ),
              SizedBox(height: 10,),
              IIinput(
                name: 'Prenom',
                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {
                  candidate.firstName = "value";
                },
                prefixIcon: Icon(Icons.person),

              ),
              SizedBox(height: 10,),
              IIinput(
                name: 'Parti politique',
                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {
                  candidate.parti = "value";
                },
                prefixIcon: Icon(Icons.flag),
              ),
              SizedBox(height: 10,),
              IIinput(
                name: 'Description',
                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {
                  candidate.description = "value";
                },
                prefixIcon: Icon(Icons.person),

              ),
              SizedBox(height: 10,),
              IDatePicker(
                name: 'Date de naissance',
                onChanged: (value) {
                  candidate.birthDate = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                prefixIcon: Icon(Icons.calendar_month),
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: IButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              Navigator.pop(context, candidate);
            }
          },
          text: 'Sauvegarder',
        ),
      ),
    );
  }

  Future<void> takePicture() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imageFile = File(image.path);
      });
    }
  }

}
