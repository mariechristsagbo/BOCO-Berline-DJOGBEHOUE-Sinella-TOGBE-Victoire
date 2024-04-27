import 'dart:io';

import 'package:flutter/material.dart';
import 'package:devoir_election/models/candidats.dart';
import 'package:devoir_election/pages/formulaire.dart';
import 'package:devoir_election/pages/infos_candidats.dart';
import 'package:image_picker/image_picker.dart';

class Candidats extends StatefulWidget {
  @override
  _CandidatsState createState() => _CandidatsState();
}

class _CandidatsState extends State<Candidats> {
  List<Candidate> candidates = [];
  List<File> files = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            Text('Elections'),
            // Ajoutez votre image ici
          ],
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: candidates.length,
          itemBuilder: (BuildContext context, int index) {
            final candidate = candidates[index];
            return ListTile(
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  image: DecorationImage(
                    image: FileImage(files[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text('${candidate.name} ${candidate.firstName}'),
              subtitle: Text(candidate.description),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InfosPage(candidate: candidate)),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => FormulairePage()),);
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Candidats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.how_to_vote),
            label: 'Votes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  void takePicture() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        files.add(File(image.path));
      });
    }
  }
}
