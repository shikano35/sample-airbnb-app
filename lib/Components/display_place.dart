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
                              height: 360,
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
                                    : SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.03,
                                    ),
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
                        ],
                      ),
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
