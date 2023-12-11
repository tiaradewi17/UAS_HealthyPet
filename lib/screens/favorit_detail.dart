import 'package:flutter/material.dart';

class FavoritDetail extends StatelessWidget {
  final String courseType; // Parameter untuk jenis kursus

  FavoritDetail({required this.courseType});

  @override
  Widget build(BuildContext context) {
    // Gunakan courseType untuk menentukan konten yang sesuai
    String title;
    String subtitle;
    String description;
    String imageAsset;

    if (courseType == "Protein") {
      title = "Protein";
      subtitle = "Prioritizing High-Quality Protein Sources";
      description =
          "This course will teach you about the importance of protein in your cat's diet and how to choose high-quality protein sources to ensure your cat's health and well-being. You will learn about different protein-rich foods and their benefits for your furry friend.";
      imageAsset =
          "assets/images/protein.jpg"; // Ganti dengan path gambar protein
    } else if (courseType == "Water") {
      title = "Water";
      subtitle = "Ensuring Adequate Hydration for Your Cat";
      description =
          "In this course, you will discover the significance of keeping your cat properly hydrated. We'll explore the importance of water for your cat's health and provide tips on ensuring your feline friend gets enough water daily. Hydration is key to your cat's well-being!";
      imageAsset = "assets/images/water.jpg"; // Ganti dengan path gambar air
    } else if (courseType == "Fat") {
      title = "Fat";
      subtitle = "Understanding Healthy Fats for Your Cat";
      description =
          "This course will educate you on the role of healthy fats in your cat's diet and how to select the right sources of fat to promote your cat's health and well-being. You'll also learn about avoiding toxic foods, ensuring a balance of vitamins and minerals, and providing sufficient fiber in your cat's diet.";
      imageAsset = "assets/images/fat.jpg"; // Ganti dengan path gambar lemak
    } else if (courseType == "Vitamin") {
      title = "Vitamin";
      subtitle = "Essential Nutrition: Vitamins and Minerals Your Cat Needs";
      description =
          "This course will cover the essential vitamins and minerals that play a crucial role in maintaining your cat's overall health. Learn how to ensure your cat receives all the necessary nutrients.";
      imageAsset =
          "assets/images/vitamin.jpg"; // Ganti dengan path gambar vitamin
    } else if (courseType == "Fiber") {
      title = "Fiber";
      subtitle = "Balancing Fiber in Your Cat's Diet";
      description =
          "In this course, you'll delve into the significance of dietary fiber for your cat. Discover how to maintain the right balance of fiber to support your cat's digestive health and overall well-being.";
      imageAsset = "assets/images/fiber.jpg"; // Ganti dengan path gambar serat
    } else if (courseType == "avoid toxic food") {
      title = "Avoid Toxic Food";
      subtitle = "Empower Your Well-being with Smart Food Choices";
      description =
          "In a world filled with tempting yet harmful food options, it's crucial to steer clear of toxic choices that can jeopardize your health. Discover the art of making smarter dietary decisions and learn how to protect your well-being with our comprehensive guide. From decoding food labels to identifying common toxins in your daily diet, we'll equip you with the knowledge and tools you need to avoid toxic foods and make informed, health-conscious choices. Say goodbye to harmful additives, preservatives, and hidden dangers in your meals. Your path to a healthier, toxin-free lifestyle begins here.";
      imageAsset = "assets/images/toxic.jpg"; // Ganti dengan path gambar serat
    } else {
      title = "Avoid Toxic Food";
      subtitle = "Empower Your Well-being with Smart Food Choices";
      description =
          "In a world filled with tempting yet harmful food options, it's crucial to steer clear of toxic choices that can jeopardize your health. Discover the art of making smarter dietary decisions and learn how to protect your well-being with our comprehensive guide. From decoding food labels to identifying common toxins in your daily diet, we'll equip you with the knowledge and tools you need to avoid toxic foods and make informed, health-conscious choices. Say goodbye to harmful additives, preservatives, and hidden dangers in your meals. Your path to a healthier, toxin-free lifestyle begins here.";
      imageAsset = "assets/images/toxic.jpg"; // Ganti dengan path gambar serat
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 24, // Ukuran font
          ),
        ),
        backgroundColor:
            Colors.purple, // Warna latar belakang AppBar (warna ungu)
      ),
      body: Column(
        children: [
          Image.asset(
            imageAsset,
            height: 200, // Ukuran gambar
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              subtitle,
              style: TextStyle(
                fontSize: 18, // Ukuran font
                color: Colors.black, // Warna teks
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 16, // Ukuran font
                color: Colors.black, // Warna teks
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white, // Warna latar belakang body
    );
  }
}
