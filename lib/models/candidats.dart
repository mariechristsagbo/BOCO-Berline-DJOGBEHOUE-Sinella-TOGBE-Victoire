import 'dart:async';
import 'dart:io';

class Candidate {
  String name;
  String firstName;
  String parti;
  String description;
  String birthDate;
  File? imageFile; // Add this line

  Candidate({
    required this.name,
    required this.firstName,
    required this.parti,
    required this.description,
    required this.birthDate,
    required this.imageFile,
  });
}
