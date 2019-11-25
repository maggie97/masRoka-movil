import 'dart:convert';
import 'dart:io';

class Roca {
  final String name;
  final String location;
  final String description;
  final String imagen;
  final double precio;
  String imageUrl;

  // Todas las rocas comienzan con 10, porque todas son buenas chicas :D
  int rating = 10;

  Roca(this.name, this.location, this.description, this.imagen, this.precio);
}