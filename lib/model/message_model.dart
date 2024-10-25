class Message {
  final String image;
  final String vendorImage;
  final String name;
  final String date;
  final String description;
  final String duration;

  Message({
    required this.image,
    required this.vendorImage,
    required this.name,
    required this.date,
    required this.description,
    required this.duration,
  });
}

final List<Message> messages = [
  Message(
    image: "https://i.ibb.co/Cbj1HKW/Whats-App-Image-2024-10-24-at-7-57-06-AM.jpg",
    vendorImage: "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg",
    name: "Andrea",
    date: "7/25/23",
    description: "You: Yacht update: Reservation of the",
    duration: "Sep 24-28, 2024 Stockach",
  ),
  Message(
    image: "https://i.ibb.co/9rtQ8kn/Whats-App-Image-2024-10-24-at-7-57-07-AM-1.jpg",
    vendorImage: "https://www.perfocal.com/blog/content/images/size/w960/2021/01/Perfocal_17-11-2019_TYWFAQ_100_standard-3.jpg",
    name: "Nikolaus",
    date: "7/14/23",
    description: "Yacht update: Reminder - Leave about",
    duration: "Jul 9-14, 2024, Konstanz",
  ),
  Message(
    image: "https://i.ibb.co/y67gKW1/Whats-App-Image-2024-10-24-at-7-57-06-AM-1.jpg",
    vendorImage: "https://shotkit.com/wp-content/uploads/bb-plugin/cache/cool-profile-pic-matheus-ferrero-landscape-6cbeea07ce870fc53bedd94909941a4b-zybravgx2q47.jpeg",
    name: "Manfred & Marcella",
    date: "7/2/23",
    description: "You: Yacht update: Reservation of the",
    duration: "Oct 2-7, 2024 Khajura",
  ),
];
