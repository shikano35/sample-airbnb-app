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

final List<Message> message = [
  Message(
    image: '',
    vendorImage: '',
    name: 'Andrea',
    date: '7/25/23',
    description: 'You: Airbnb update: Reservation of the',
    duration: 'Sep 24-28, 2024 Stockach',
  ),
  Message(
    image: '',
    vendorImage: '',
    name: 'Nikolaus',
    date: '7/14/23',
    description: 'Airbnb update: Reminder - Leave about',
    duration: 'Jul 9-14, 2024, Konstanz',
  ),
  Message(
    image: '',
    vendorImage: '',
    name: 'Manfred & Marcella',
    date: '7/2/23',
    description: 'You: Airbnb update: Reservation of the',
    duration: 'Oct 2-7, 2024 Khajura',
  ),
];
