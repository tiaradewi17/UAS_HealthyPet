import 'package:flutter/material.dart';
import 'package:healthypet/style/color.dart';
import 'package:healthypet/style/styles.dart';
import 'package:healthypet/screens/favorit_detail.dart';


class FavoritPet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Gordita',
      ),
      home: const CategoryPage(),
    );
  }
  
}

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                padding: const EdgeInsets.only(left: 24),
                height: size.height / 4,
                width: size.width,
                decoration: const BoxDecoration(
                    color: AppColors.purple,
                    image: DecorationImage(
                        image: AssetImage('assets/BG-Gradient.png'),
                        alignment: Alignment.bottomCenter,
                        fit: BoxFit.cover)),
                child: SafeArea(
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/images/heart.png'),
                              const SizedBox(
                                width: 13,
                              ),
                              Text('Nutrition', style: AppStyle.m12w)
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            'Essential Nutrients ?',
                            style: AppStyle.b32w,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          // Text(
                          //   'Choose your subject',
                          //   style: AppStyle.r12w,
                          // )
                        ],
                      )),
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              height: size.height - (size.height / 5),
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(34)),
              child: Column(children: [
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 7.0, vertical: 21.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            LongCourseCard(
                                background: AppColors.pink,
                                title: 'Protein',
                                subtitle:
                                    'Prioritizing High-Quality Protein Sources',
                                image: 'assets/images/protein.jpg'),
                            ShortBottomCourseCard(
                                background: AppColors.purple,
                                title: 'Fat',
                                subtitle: 'Carbohydrates in a Cat\'s Diet',
                                image: 'assets/images/fat.jpg'),
                            ShortTopCourseCard(
                                background: AppColors.red,
                                title: 'Fiber',
                                subtitle:
                                    'Maintaining Digestive Health with Fiber',
                                image: 'assets/images/fiber.jpg')
                          ],
                        ),
                        Column(
                          children: [
                            ShortTopCourseCard(
                                background: AppColors.green,
                                title: 'Vitamin and Minerals',
                                subtitle:
                                    'Key Vitamins and Minerals for Feline Health',
                                image: 'assets/images/vitamin.jpg'),
                            LongCourseCard(
                                background: AppColors.orange,
                                title: 'Water',
                                subtitle:
                                    'Ensuring Adequate Hydration for Your Cat',
                                image: 'assets/images/water.jpg'),
                            ShortBottomCourseCard(
                                background: AppColors.green,
                                title: 'Avoid Toxic Foods',
                                subtitle:
                                    'Hazardous Foods to Steer Clear of for Your Cat',
                                image: 'assets/images/toxic.jpg'),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
          
        ]),
      ),
    );
    
  }
}


class LongCourseCard extends StatelessWidget {
  final Color background;
  final String title;
  final String subtitle;
  final String image;

  LongCourseCard({
    required this.background,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FavoritDetail(courseType: title),
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        width: 155,
        height: 170,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(34),
          border: Border.all(color: Colors.white, width: 10),
          boxShadow: [
            BoxShadow(
              blurRadius: 50,
              color: const Color(0xFF0B0C2A).withOpacity(.09),
              offset: const Offset(10, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Center(
              child: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign
                    .center, // Ini akan membuat teks menjadi pusat secara horizontal
              ),
            ),
            Expanded(
              child: ClipOval(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: 100, // Lebar gambar lingkaran
                  height: 90, // Tinggi gambar lingkaran
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: LongCourseCard(
          background: Colors.pink,
          title: 'Protein',
          subtitle: 'Prioritizing High-Quality Protein Sources',
          image: 'assets/images/protein.jpg',
        ),
      ),
    ),
  ));
}

class ShortTopCourseCard extends StatelessWidget {
  final Color background;
  final String title;
  final String subtitle;
  final String image;
  const ShortTopCourseCard(
      {Key? key,
      required this.background,
      required this.title,
      required this.subtitle,
      required this.image})
      : super(key: key);

  @override
 Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FavoritDetail(courseType: title),
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        width: 155,
        height: 170,
        decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(34),
            border: Border.all(color: Colors.white, width: 10),
            boxShadow: [
              BoxShadow(
                  blurRadius: 50,
                  color: const Color(0xFF0B0C2A).withOpacity(.09),
                  offset: const Offset(10, 10))
            ]),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
             Center(
                child: Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign
                      .center, // Ini akan membuat teks menjadi pusat secara horizontal
                ),
              ),
            Expanded(
                child: ClipOval(
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: 100, // Lebar gambar lingkaran
                    height: 90, //
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ShortBottomCourseCard extends StatelessWidget {
  final Color background;
  final String title;
  final String subtitle;
  final String image;
  const ShortBottomCourseCard(
      {Key? key,
      required this.background,
      required this.title,
      required this.subtitle,
      required this.image})
      : super(key: key);

   @override
 Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FavoritDetail(courseType: title),
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        width: 155,
        height: 170,
        decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(34),
            border: Border.all(color: Colors.white, width: 10),
            boxShadow: [
              BoxShadow(
                  blurRadius: 50,
                  color: const Color(0xFF0B0C2A).withOpacity(.09),
                  offset: const Offset(10, 10))
            ]),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
             Center(
                child: Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign
                      .center, // Ini akan membuat teks menjadi pusat secara horizontal
                ),
              ),
            Expanded(
                child: ClipOval(
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: 100, // Lebar gambar lingkaran
                    height: 90, //
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}