import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DisplayPlace extends StatefulWidget {
  const DisplayPlace({super.key});

  @override
  State<DisplayPlace> createState() => _DisplayPlaceState();
}

class _DisplayPlaceState extends State<DisplayPlace> {
  final CollectionReference placeCollection = FirebaseFirestore.instance
      .collection('myAppCpollection');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
      stream: placeCollection.snapshots(),
      builder: (context, streamSnapshot) {
        if (streamSnapshot.hasData) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            itemCount: streamSnapshot.data!.docs.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final place = streamSnapshot.data!.docs[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: SizedBox(
                              height: 375,
                              width: double.infinity,
                              child: AnotherCarousel(
                                images:
                                    place['imageUrls']
                                        .map((url) => NetworkImage(url))
                                        .toList(),
                                dotSize: 6,
                                indicatorBgPadding: 5,
                                dotBgColor: Colors.transparent,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            right: 15,
                            left: 15,
                            child: Row(
                              children: [
                                place['isActive'] == true
                                    ? Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 5,
                                        ),
                                        child: Text(
                                          "GuestFavorite",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                    : SizedBox(width: size.width * 0.03),
                                Spacer(),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Icon(
                                      Icons.favorite_outline_rounded,
                                      color: Colors.white,
                                      size: 34,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.favorite,
                                        size: 30,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          vendorProfile(place),
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                      Row(
                        children: [
                          Text(
                            place['address'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.star),
                          SizedBox(width: 5),
                          Text(place['rating'].toString()),
                        ],
                      ),
                      Text(
                        "Stay with ${place['vendor']} . ${place['vendorProfession']}",
                        style: TextStyle(color: Colors.black54, fontSize: 16.5),
                      ),
                      Text(
                        place['date'],
                        style: TextStyle(color: Colors.black54, fontSize: 16.5),
                      ),
                      SizedBox(height: size.height * 0.007),
                      RichText(
                        text: TextSpan(
                          text: '\$${place['price']}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: "night",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.025),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

Positioned vendorProfile(QueryDocumentSnapshot place) {
  return Positioned(
    bottom: 11,
    left: 10,
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          child: Image.asset(
            "asset/images/book_cover.png",
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: CircleAvatar(
            backgroundImage: NetworkImage(place['vendorProfile']),
          ),
        ),
      ],
    ),
  );
}
