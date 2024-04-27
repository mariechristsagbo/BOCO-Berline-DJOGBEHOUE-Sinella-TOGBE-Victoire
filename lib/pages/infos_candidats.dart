import 'dart:io';

import 'package:devoir_election/pages/formulaire.dart';
import 'package:flutter/material.dart';
import 'package:devoir_election/pages/liste_candidats.dart';
import 'package:devoir_election/models/candidats.dart';
import 'package:image_picker/image_picker.dart';

class InfosPage extends StatefulWidget {
  Candidate candidate;

  InfosPage({super.key, required this.candidate});

  @override
  _InfosPageState createState() => _InfosPageState();
}

class _InfosPageState extends State<InfosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BackButton(),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            "${widget.candidate.parti}",
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 8.0),
          Text(
            "${widget.candidate.name} ${widget.candidate.firstName}",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 8.0),
          Text(
            "Candidat",
            style: TextStyle(color: Colors.black45),
          ),
          SizedBox(height: 16.0),
          widget.candidate.imageFile == null
              ? CircleAvatar(
            radius: 50,
            child: Text("${widget.candidate.firstName[0]}"),
          )
              : Image.file(
            imageFile,
            width: 100,
            height: 100,
          ),
          SizedBox(height: 16.0),
          Text("${widget.candidate.firstName}"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: takePicture,
        child: Icon(Icons.camera_alt),
      ),
    );
  }

  void takePicture() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        widget.candidate.imageFile = File(image.path);
      });
    }
  }
}
