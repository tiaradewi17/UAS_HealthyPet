import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthypet/login/login2.dart';
import 'package:healthypet/screens/consultation.dart';
import 'package:healthypet/screens/klinik_page.dart';
import 'package:healthypet/login/login.dart';
import 'package:healthypet/models/doctor_model.dart';
import 'package:healthypet/models/service_model.dart';
import 'package:healthypet/screens/doctor_detailscreen.dart';
import 'package:healthypet/screens/favorit_pet.dart';
import 'package:healthypet/screens/pet_detail.dart';
import 'package:healthypet/screens/pet_page.dart';
// import 'package:healthypet/screens/spa_page.dart';
import 'favorit_pet.dart';
import 'profile.dart';
import 'chat.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedMenu = 0;

  final List<Widget> _screens = [
    HomeDetail(),
    FavoritPet(),
    Chat(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0), // Set the height to 0
        child: AppBar(
          automaticallyImplyLeading: false,
        ),
      ),
      body: IndexedStack(
        index: selectedMenu,
        children: _screens,
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
        selectedItemColor: const Color(0xFF818AF9),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(FeatherIcons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(FeatherIcons.menu), label: ''),
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.messageCircle), label: ''),
          BottomNavigationBarItem(icon: Icon(FeatherIcons.user), label: ''),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: const Color(0xFFBFBFBF),
        currentIndex: selectedMenu,
        onTap: (index) {
          setState(() {
            selectedMenu = index;
          });
        },
      );
}

class HomeDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0), // Set the height to 0
        child: AppBar(
          automaticallyImplyLeading: false,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            _greetings(context),
            const SizedBox(
              height: 16,
            ),
            _card(),
            const SizedBox(
              height: 20,
            ),
            // _search(),
            // const SizedBox(
            //   height: 20,
            // ),
            _services(),
            const SizedBox(
              height: 27,
            ),
            _doctors()
          ],
        ),
      )),
    );
  }

  ListView _doctors() {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => _doctor(context, doctors[index]),
        separatorBuilder: (context, index) => const SizedBox(
              height: 11,
            ),
        itemCount: doctors.length);
  }

  InkWell _doctor(BuildContext context, DoctorModel doctorModel) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorDetailsScreen(doctor: doctorModel),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                  color: const Color(0xFF35385A).withOpacity(.12),
                  blurRadius: 30,
                  offset: const Offset(0, 2))
            ]),
        child: Row(children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Image.asset(
              'assets/images/${doctorModel.image}',
              width: 88,
              height: 103,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorModel.name,
                  style: GoogleFonts.manrope(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF3F3E3F)),
                ),
                const SizedBox(
                  height: 7,
                ),
                RichText(
                    text: TextSpan(
                        text: "Service: ${doctorModel.services.join(', ')}",
                        style: GoogleFonts.manrope(
                            fontSize: 15, color: Colors.black))),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    const Icon(
                      FeatherIcons.mapPin,
                      size: 15,
                      color: Color(0xFFACA3A3),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text("${doctorModel.distance}km",
                        style: GoogleFonts.manrope(
                          fontSize: 15,
                          color: const Color(0xFFACA3A3),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Text(
                      "Available for",
                      style: GoogleFonts.manrope(
                          color: const Color(0xFF50CC98),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    const Spacer(),
                    SvgPicture.asset('assets/svgs/cat.svg'),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset('assets/svgs/dog.svg'),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  SizedBox _services() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () {
              if (Service.all()[index] == Service.categories) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CookiePage(),
                  ),
                );
              } else if (Service.all()[index] == Service.spaAndTreatment) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => KlinikPage(),
                  ),
                );
              } else if (Service.all()[index] == Service.consultation) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConsultationScheduleScreen(date: '23-12-01', day: 'wednesday',),
                  ),
                );
                // Pastikan untuk menghapus kurung kurawal tambahan di atas
              }
            },
            style: ElevatedButton.styleFrom(
                // primary: selectedService == index
                //     ? const Color(0xFF818AF9)
                //     : const Color(0xFFF6F6F6),
                // onPrimary: selectedService == index
                //     ? Colors.white
                //     : const Color(0x61000000).withOpacity(.3),
                // elevation: 2.0,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(10),
                // ),
                ),
            child: Text(
              Service.all()[index],
              style: GoogleFonts.manrope(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: Service.all().length,
      ),
    );
  }

//   Widget _search() {
//   TextEditingController _searchController = TextEditingController();
//   void performSearch(String query) {
//   print('Mencari data dengan query: $query');
//   }

//   return Container(
//     margin: const EdgeInsets.symmetric(horizontal: 20),
//     padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
//     decoration: BoxDecoration(
//       color: const Color(0xFFF6F6F6),
//       borderRadius: BorderRadius.circular(14),
//     ),
//     child: TextFormField(
//       controller: _searchController,
//       onChanged: (value) {
//         // Panggil fungsi pencarian ketika nilai berubah (setiap kali pengguna mengetik)
//         performSearch(value);
//       },
//       onFieldSubmitted: (value) {
//         // Panggil fungsi pencarian ketika pengguna menekan tombol "cari" di keyboard
//         performSearch(value);
//       },
//       decoration: InputDecoration(
//         border: InputBorder.none,
//         prefixIcon: const Icon(
//           FeatherIcons.search,
//           color: Color(0xFF263238),
//         ),
//         hintText: "Cari vaksin terbaik, perawatan...",
//         hintStyle: GoogleFonts.manrope(
//           fontSize: 15,
//           fontWeight: FontWeight.bold,
//           color: const Color(0x61000000),
//           height: 150 / 100,
//         ),
//       ),
//     ),
//   );
// }


  AspectRatio _card() {
    return AspectRatio(
      aspectRatio: 336 / 184,
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color(0xFF818AF9),
        ),
        child: Stack(children: [
          Image.asset(
            'assets/images/background_card.png',
            height: double.maxFinite,
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(
                        text: "Your ",
                        style: GoogleFonts.manrope(
                            fontSize: 18,
                            color: const Color(0xFFDEE1FE),
                            height: 150 / 100),
                        children: const [
                      TextSpan(
                          text: "Catrine ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800)),
                      TextSpan(text: "will get\nvaccination "),
                      TextSpan(
                          text: "tomorrow \nat 07.00 am!",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800)),
                    ])),
                const SizedBox(
                  height: 20,
                ),
                // Container(
                //   padding: const EdgeInsets.all(10),
                //   decoration: BoxDecoration(
                //       color: Colors.white.withOpacity(.4),
                //       border: Border.all(
                //           color: Colors.white.withOpacity(.12), width: 2),
                //       borderRadius: BorderRadius.circular(10)),
                //   // child: Text(
                //   //   "See details",
                //   //   style: GoogleFonts.manrope(
                //   //       fontSize: 16,
                //   //       fontWeight: FontWeight.bold,
                //   //       color: Colors.white),
                //   // ),
                // )
              ],
            ),
          )
        ]),
      ),
    );
  }

  Padding _greetings(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Hello, Human!',
              style: GoogleFonts.manrope(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF3F3E3F)),
            ),
          ],
        ));
  }
}
