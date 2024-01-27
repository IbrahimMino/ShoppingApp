class Products {
  int? id;
  String? name;
  String? price;
  String? sale_price;
  String? img_url;

  Products(this.id, this.name, this.price, this.sale_price, this.img_url);

  static final List<Products> listProducts = [
    Products(1,'Электрическая варочная поверхность MAUNFELD EEHE.32.4B','2 000 000 сум','1 750 000 сум','assets/images/chang.png'),
    Products(2,'Игровая приставка Sony PlayStation PS5 DIGITAL EDITION 825Gb/Go','','1 750 000 сум','assets/images/pl.png'),
    Products(3,'Электрическая варочная поверхность MAUNFELD EEHE.32.4B','','1 750 000 сум','assets/images/xolo.png'),
  ];
}
