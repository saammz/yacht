// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> savePlacesToFirebase() async {
  final CollectionReference ref = FirebaseFirestore.instance.collection("myAppCpollection");
  for (final Place place in listOfPlace) {
    final String id = DateTime.now().toIso8601String() + Random().nextInt(1000).toString();
    ref.doc("das");
    await ref.doc(id).set(place.toMap());
  }
}

class Place {
  final String title;
  bool isActive;
  final String image;
  final double rating;
  final String date;
  final int price;
  final String address;
  final String vendor;
  final String vendorProfession;
  final String vendorProfile;
  final int review;
  final String bedAndBathroom;
  final int yearOfHostin;
  final double latitude;
  final double longitude;
  final List<String> imageUrls;

  Place({required this.title, required this.isActive, required this.image, required this.rating, required this.date, required this.price, required this.address, required this.vendor, required this.vendorProfession, required this.vendorProfile, required this.review, required this.bedAndBathroom, required this.yearOfHostin, required this.latitude, required this.longitude, required this.imageUrls});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isActive': isActive,
      'image': image,
      'rating': rating,
      'date': date,
      'price': price,
      'address': address,
      'vendor': vendor,
      'vendorProfession': vendorProfession,
      'vendorProfile': vendorProfile,
      'review': review,
      'bedAndBathroom': bedAndBathroom,
      'yearOfHostin': yearOfHostin,
      'latitude': latitude,
      'longitude': longitude,
      'imageUrls': imageUrls,
    };
  }
}

final List<Place> listOfPlace = [
  Place(
    isActive: true,
    title: "O'PTASIA Luxury",
    image: "https://www.momondo.in/himg/b1/a8/e3/revato-1172876-6930557-765128.jpg",
    rating: 4.85,
    review: 126,
    bedAndBathroom: "5M (16'5') Glass-Bottom Pool",
    date: "Nov 11-16",
    price: 38,
    address: "Punta Mita, Nayarit",
    vendor: "Marianne",
    vendorProfession: "Retired",
    yearOfHostin: 10,
    vendorProfile: "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg",
    latitude: 20.7794845,
    longitude: -105.5269376,
    imageUrls: [
      "https://i.ibb.co/Cbj1HKW/Whats-App-Image-2024-10-24-at-7-57-06-AM.jpg",
      "https://i.ibb.co/y67gKW1/Whats-App-Image-2024-10-24-at-7-57-06-AM-1.jpg",
      "https://i.ibb.co/CbDV4hZ/Whats-App-Image-2024-10-24-at-7-57-06-AM-1.jpg",
      "https://i.ibb.co/9rtQ8kn/Whats-App-Image-2024-10-24-at-7-57-07-AM-1.jpg",
    ],
  ),
  Place(
    isActive: false,
    title: "SILVERCAT SC22M HULL 881",
    image: "https://www.telegraph.co.uk/content/dam/Travel/hotels/2023/september/one-and-only-cape-town-product-image.jpg",
    rating: 4.55,
    date: "Oct 01-06",
    review: 26,
    yearOfHostin: 6,
    bedAndBathroom: "Touch-and-Go Helipad",
    price: 88,
    address: "Playa Balandra, La Paz",
    vendor: "Tracey",
    vendorProfession: "Holistic therapist",
    vendorProfile: "https://www.perfocal.com/blog/content/images/size/w960/2021/01/Perfocal_17-11-2019_TYWFAQ_100_standard-3.jpg",
    latitude: 24.321733,
    longitude: -110.324203,
    imageUrls: [
      "https://i.ibb.co/Cbj1HKW/Whats-App-Image-2024-10-24-at-7-57-06-AM.jpg",
      "https://i.ibb.co/y67gKW1/Whats-App-Image-2024-10-24-at-7-57-06-AM-1.jpg",
      "https://i.ibb.co/CbDV4hZ/Whats-App-Image-2024-10-24-at-7-57-06-AM-1.jpg",
      "https://i.ibb.co/9rtQ8kn/Whats-App-Image-2024-10-24-at-7-57-07-AM-1.jpg",
    ],
  ),
  Place(
    isActive: true,
    title: "SILVER EDGE",
    image: "https://www.theindiahotel.com/extra-images/banner-01.jpg",
    rating: 4.77,
    date: "Oct 10-16",
    price: 34,
    address: "Isla Mujeres, Quintana Roo",
    yearOfHostin: 4,
    review: 160,
    bedAndBathroom: "Advanced Tender Storage",
    vendor: "Ole",
    vendorProfession: "Consultant",
    vendorProfile: "https://shotkit.com/wp-content/uploads/bb-plugin/cache/cool-profile-pic-matheus-ferrero-landscape-6cbeea07ce870fc53bedd94909941a4b-zybravgx2q47.jpeg",
    latitude: 21.2,
    longitude: -86.716667,
    imageUrls: [
      "https://i.ibb.co/Cbj1HKW/Whats-App-Image-2024-10-24-at-7-57-06-AM.jpg",
      "https://i.ibb.co/y67gKW1/Whats-App-Image-2024-10-24-at-7-57-06-AM-1.jpg",
      "https://i.ibb.co/CbDV4hZ/Whats-App-Image-2024-10-24-at-7-57-06-AM-1.jpg",
      "https://i.ibb.co/9rtQ8kn/Whats-App-Image-2024-10-24-at-7-57-07-AM-1.jpg",
    ],
  ),
];
