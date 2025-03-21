import 'package:flutter/material.dart';
import 'package:sample_airbnb_app/Components/search_bar_and_filter.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(children: [SearchBarAndFilter()]),
      ),
    );
  }
}
