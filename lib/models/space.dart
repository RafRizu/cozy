class Space {
  int? id;
  String? name;
  int? price;
  String? city;
  String? country;
  String? imageUrl;
  int? rating;
  String? address;
  String? phone;
  String? mapUrl;
  List? photos;
  int? numOfKitchens;
  int? numOfBedrooms;
  int? numOfCupboards;

  // Space({
  //   this.id,
  //   this.name = 'Place',
  //   this.price,
  //   this.city = 'Kota',
  //   this.country = 'Negara',
  //   this.imageUrl = 'assets/images/space1.png',
  //   this.rating,
  //   this.address = 'q',
  //   this.phone = 'd',
  //   this.mapUrl = 'd',
  //   this.photos,
  // });




  Space.fromJson(json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    city = json['city'];
    country = json['country'];
    imageUrl = json['image_url'];
    rating = json['rating'];
    address = json['address'];
    phone = json['phone'];
    mapUrl = json['map_url'];
    photos = json['photos'];
    numOfBedrooms = json['number_of_bedrooms'];
    numOfCupboards = json['number_of_cupboards'];
    numOfKitchens = json['number_of_kitchens'];
  }
}
