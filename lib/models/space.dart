import 'dart:ffi';

class Space {
  int? id;
  String name;
  double price;
  String city;
  String country;
  String imageUrl;
  int? rating;

  Space({
    this.id,
    this.name = 'Place',
    this.price = 1.0,
    this.city = 'Kota',
    this.country = 'Negara',
    this.imageUrl = 'assets/images/space1.png',
    this.rating,
  });
}
