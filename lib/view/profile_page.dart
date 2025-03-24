import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Icon(Icons.notifications_outlined, size: 35),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.black54,
                      backgroundImage: NetworkImage(
                        "${FirebaseAuth.instance.currentUser!.photoURL}",
                      ),
                    ),
                    SizedBox(width: size.width * 0.03),
                    Text.rich(
                      TextSpan(
                        text:
                            "${FirebaseAuth.instance.currentUser!.displayName}\n",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        children: [
                          TextSpan(
                            text: "Show Profile",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios),
                    SizedBox(height: 10),
                    Divider(color: Colors.black12),
                    SizedBox(height: 10),
                  ],
                ),
                Card(
                  elevation: 4,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "Airbnb your place\n",
                            style: TextStyle(
                              height: 2.5,
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    "It's simple to get set up and \nstart earning.",
                                style: TextStyle(
                                  height: 1.2,
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Image.network(
                          "https://static.vecteezy.com/system/resources/previews/034/950/530/non_2x/ai-generated-small-house-with-flowers-on-transparent-background-image-png.png",
                          height: 140,
                          width: 135,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Divider(color: Colors.black12),
                SizedBox(height: 10),
                Text(
                  "Settings",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20),
                profileInfo(Icons.person_2_outlined, "Personal information"),
                profileInfo(Icons.security, "Login & security"),
                profileInfo(Icons.payments_outlined, "Payments and payouts"),
                profileInfo(Icons.settings_outlined, "Accessibility"),
                profileInfo(Icons.note_outlined, "Taxes"),
                profileInfo(Icons.person_2_outlined, "Personal information"),
                profileInfo(Icons.translate, "Translation"),
                profileInfo(Icons.notifications_outlined, "Notifications"),
                profileInfo(Icons.lock_outline, "Privacy and sharing"),
                profileInfo(Icons.card_travel, "Tracel for work"),
                SizedBox(height: 15),
                Text(
                  "Hosting",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 25),
                profileInfo(Icons.add_home_outlined, "List your space"),
                profileInfo(Icons.home_outlined, "Learn about hosting"),
                SizedBox(height: 15),
                Text(
                  "Suport",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 25),
                profileInfo(Icons.help_outline, "Visit the Help Center"),
                profileInfo(
                  Icons.health_and_safety_outlined,
                  "Get help with a safert issue",
                ),
                profileInfo(Icons.ac_unit, "How Airbnb works"),
                profileInfo(Icons.edit_outlined, "Give us feedback"),
                SizedBox(height: 15),
                Text(
                  "Legal",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 25),
                profileInfo(Icons.menu_book_outlined, "Terms of Service"),
                profileInfo(Icons.menu_book_outlined, "Privacy Policy"),
                profileInfo(Icons.menu_book_outlined, "Open source licenses"),
                SizedBox(height: 10),
                Text(
                  "Log out",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                Divider(color: Colors.black12),
                SizedBox(height: 20),
                Text(
                  "Version 24.34 (28004615)",
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding profileInfo(icon, name) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 35,
                color: Colors.black.withAlpha((0.7 * 255).toInt()),
              ),
              SizedBox(width: 20),
              Text(name, style: TextStyle(fontSize: 17)),
              Spacer(),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
          SizedBox(height: 12),
          Divider(color: Colors.black12),
        ],
      ),
    );
  }
}
