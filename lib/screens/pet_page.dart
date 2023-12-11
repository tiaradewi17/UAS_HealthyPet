import 'package:flutter/material.dart';
import 'package:healthypet/screens/pet_detail.dart';

class Cookie {
  final String name;
  final String price;
  final String imgPath;

  Cookie(this.name, this.price, this.imgPath);
}

class CookiePage extends StatefulWidget {
  @override
  _CookiePageState createState() => _CookiePageState();
}

class _CookiePageState extends State<CookiePage> {
  List<Cookie> cookies = [
    Cookie('Kucing Persia', '\$3.99', 'assets/images/persia.jpg'),
    Cookie('Kucing Anggora', '\$5.99', 'assets/images/anggora.jpg'),
    Cookie('Kucing Rusian Blue', '\$3.99', 'assets/images/rusianblue.jpg'),
    Cookie('Kucing Anggora', '\$5.99', 'assets/images/anggora.jpg'),
    Cookie('Kucing Persia', '\$3.99', 'assets/images/persia.jpg'),
    Cookie('Kucing Anggora', '\$5.99', 'assets/images/anggora.jpg'),
    Cookie('Kucing Rusian Blue', '\$3.99', 'assets/images/rusianblue.jpg'),
    Cookie('Kucing Anggora', '\$5.99', 'assets/images/anggora.jpg'),
    Cookie('Kucing Persia', '\$3.99', 'assets/images/persia.jpg'),
    Cookie('Kucing Anggora', '\$5.99', 'assets/images/anggora.jpg'),
    Cookie('Kucing Rusian Blue', '\$3.99', 'assets/images/rusianblue.jpg'),
    Cookie('Kucing Anggora', '\$5.99', 'assets/images/anggora.jpg'),
    Cookie('Kucing Persia', '\$3.99', 'assets/images/persia.jpg'),
    Cookie('Kucing Anggora', '\$5.99', 'assets/images/anggora.jpg'),
    Cookie('Kucing Rusian Blue', '\$3.99', 'assets/images/rusianblue.jpg'),
    Cookie('Kucing Anggora', '\$5.99', 'assets/images/anggora.jpg'),
  ];

  int totalSelectedItems = 0;

  void addToCart(Cookie cookie) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add to Cart"),
          content: Text("Are you sure you want to add ${cookie.name} to your shopping cart?"),
          actions: <Widget>[
            TextButton(
              child: Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Yes"),
              onPressed: () {
                setState(() {
                  totalSelectedItems = cookies.where((c) => c == cookie).length;

                  List<String> cartItems = cookies.map((c) => c.name).toList();

                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CookieDetail(cartItems: cartItems),
                  ));
                });
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildCard(Cookie cookie) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          addToCart(cookie);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Hero(
                tag: cookie.imgPath,
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(cookie.imgPath),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 7.0),
              Text(
                cookie.price,
                style: TextStyle(
                  color: Color(0xFF818AF9),
                  fontFamily: 'Varela',
                  fontSize: 14.0,
                ),
              ),
              Text(
                cookie.name,
                style: TextStyle(
                  color: Color(0xFF575E67),
                  fontFamily: 'Varela',
                  fontSize: 14.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(color: Color(0xFFEBEBEB), height: 1.0),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.shopping_basket, color: Color(0xFF818AF9), size: 12.0),
                    Text(
                      'Add to cart',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        color: Color(0xFF818AF9),
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop Pet"),
        leading: GestureDetector(
          onTap: () {
            List<String> cartItems = cookies.map((c) => c.name).toList();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CookieDetail(cartItems: cartItems),
              ),
            );
          },
          child: Stack(
            children: [
              IconButton(
                onPressed: () {
                  List<String> cartItems = cookies.map((c) => c.name).toList();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CookieDetail(cartItems: cartItems),
                    ),
                  );
                },
                icon: Stack(
                  children: [
                    Icon(
                      Icons.shopping_bag,
                      color: Color(0xFF818AF9),
                    ),
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEF6497),
                          borderRadius: BorderRadius.circular(15 / 2),
                        ),
                        child: Center(
                          child: Text(
                            totalSelectedItems.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
            padding: EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 30.0,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: (MediaQuery.of(context).size.width / 2 - 30) / 220,
              children: cookies.map((cookie) => _buildCard(cookie)).toList(),
            ),
          ),
          SizedBox(height: 15.0),
        ],
      ),
    );
  }
}
