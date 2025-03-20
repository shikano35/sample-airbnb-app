import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Log in or sign up',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(color: Colors.black),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome to Airbnb",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    phoneNumberField(size),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Container phoneNumberField(Size size) {
  return Container(
    width: size.width,
    height: 130,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black45),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 10, left: 10, top: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Country/Region", style: TextStyle(color: Colors.black45)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Japan(+81)",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Icon(Icons.keyboard_arrow_down_sharp, size: 30),
                ],
              ),
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Phone number",
              hintStyle: TextStyle(fontSize: 18, color: Colors.black45),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    ),
  );
}
