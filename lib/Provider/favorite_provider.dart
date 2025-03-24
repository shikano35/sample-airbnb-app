import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  List<String> _favoriteList = [];
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<String> get favorites => _favoriteList;
  FavoriteProvider() {
    loadFavorite();
  }

  void toggleFavorite(DocumentSnapshot place) async {
    String placeId = place.id;
    if (_favoriteList.contains(placeId)) {
      _favoriteList.remove(placeId);
      await _removeFavorite(placeId);
    } else {
      _favoriteList.add(placeId);
      await _addFavorite(placeId);
    }
    notifyListeners();
  }

  bool isExist(DocumentSnapshot place) {
    return _favoriteList.contains(place.id);
  }

  Future<void> _addFavorite(String placeId) async {
    try {
      await firebaseFirestore.collection('useFavorites').doc(placeId).set({
        'isFavorite': true,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _removeFavorite(String placeId) async {
    try {
      await firebaseFirestore.collection('useFavorites').doc(placeId).delete();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> loadFavorite() async {
    try {
      QuerySnapshot snapshot =
          await firebaseFirestore.collection('useFavorites').get();
      _favoriteList = snapshot.docs.map((doc) => doc.id).toList();
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  static FavoriteProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<FavoriteProvider>(context, listen: listen);
  }
}
