class Orders {
  int? id;
  String? title;
  String? order_number;
  String? delivery_date;
  String? img_url;

  Orders(this.id, this.title, this.order_number, this.delivery_date, this.img_url);

  static final List<Orders> listProducts = [
    Orders(1,'Готов к выдаче','Заказ №10021122','Самовывоз до 29 марта','assets/images/box.svg'),
    Orders(2,'Как вам работа приложения?','Нам важно ваше мнение','','assets/images/star.svg'),
    Orders(3,'Готов к выдаче','Заказ №10021122','Самовывоз до 29 марта','assets/images/notification.svg'),
  ];
}