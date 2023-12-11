class Cookie {
  final String name;
  final String price;
  final String imgPath;
  bool isFavorite;
  bool isAddedToCart; // Tambah properti baru

  Cookie(this.name, this.price, this.imgPath, this.isFavorite, this.isAddedToCart);
}