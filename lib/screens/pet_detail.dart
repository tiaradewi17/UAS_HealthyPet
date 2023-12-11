import 'package:flutter/material.dart';

class CookieDetail extends StatelessWidget {
  final List<String> cartItems;

  CookieDetail({required this.cartItems});
    void removeItem(BuildContext context, int index) {
    // Implementasi logika penghapusan item dari keranjang
    // contoh: cartItems.removeAt(index);

    // Setelah menghapus, panggil setState jika menggunakan Stateful widget
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Shopping Bag', // Ubah judul sesuai kebutuhan
          style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 20.0,
            color: Color(0xFF545D68),
          ),
        ),
      ),
  body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (BuildContext context, int index) {
          // Ubah kode untuk menampilkan detail harga dan aksi hapus
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(cartItems[index]), // Nama item
                Text(
                  '\$10.00', // Ganti dengan harga sesuai item
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            // trailing: IconButton(
            //   icon: Icon(Icons.delete),
            //   onPressed: () {
            //     removeItem(context, index); // Panggil fungsi hapus item
            //   },
            // ),
          );
        },
      ),
    );
  }
}

 