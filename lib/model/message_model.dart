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
    image:
        'https://www.momondo.in/himg/b1/a8/e3/revato-1172876-6930557-765128.jpg',
    vendorImage:
        'https://kotonohaworks.com/free-icons/wp-content/uploads/kkrn_icon_user_6.png',
    name: 'Andrea',
    date: '7/25/23',
    description: 'You: Airbnb update: Reservation of the',
    duration: 'Sep 24-28, 2024 Stockach',
  ),
  Message(
    image:
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0e/de/f7/c3/standard-room.jpg?w=1200&h=-1&s=1',
    vendorImage:
        'https://kotonohaworks.com/free-icons/wp-content/uploads/kkrn_icon_user_8.png',
    name: 'Nikolaus',
    date: '7/14/23',
    description: 'Airbnb update: Reminder - Leave about',
    duration: 'Jul 9-14, 2024, Konstanz',
  ),
];
