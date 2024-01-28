import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping/models/Orders.dart';
import 'package:shopping/ui/recomended/bestseller/bestseller_page.dart';
import 'package:shopping/ui/recomended/discounts_installments/discount_page.dart';
import 'package:shopping/ui/recomended/new_item/new_item_page.dart';
import 'package:shopping/ui/recomended/popular/popular_page.dart';
import 'package:shopping/ui/utils/Constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int activeIndex = 0;
  int selectedPage = 0;

  late TabController _tabController;
  final List<Widget> _tabs = [
    NewItemPage(),
    NewItemPage(),
    NewItemPage(),
    NewItemPage(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  final controller = CarouselController();
  final urlImages = [
    'assets/images/meal.png',
    'assets/images/profile.svg',
    'assets/images/profile.svg',
  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var size = mediaQueryData.size;
    var width = mediaQueryData.size.width;
    var height = mediaQueryData.size.height;
    var orientation = mediaQueryData.orientation;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF0F0F0),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/images/location.svg'),
                    SvgPicture.asset('assets/images/orzugrand.svg'),
                    SvgPicture.asset('assets/images/messages.svg'),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/images/profile.svg'),
                    SizedBox(
                      width: 10
                    ),
                    Text(
                      'Здравствуйте,',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 10),
                     Text(
                      'Дониёр',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff14A23C),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 152,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal, // Horizontal scroll
                    itemCount: 3, // Umumiy elementlar soni
                    itemBuilder: (BuildContext context, int index) {
                      // Har bir element
                      return orderItem(index);
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    customEdit(),
                    SizedBox(
                      height: 10,
                    ),
                    carousel(),
                    SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      width: width,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll<Color>(
                                  Color(0xffFF7011)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child:  Text(
                          'Все акции',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, top: 16, right: 16, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Товар дня',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: height / 90,
                          ),
                          Text(
                            '22 : 33 : 15',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xff7B7B7B)),
                          ),
                        ],
                      ),
                    ),
                    recomendedItem(activeIndex),
                    SizedBox(height: 10),
                    ToggleButtons(
                        fillColor: Colors.transparent,
                        borderColor: Colors.transparent,
                        selectedBorderColor: Colors.transparent,
                        selectedColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        direction: Axis.horizontal,
                        onPressed: (int index) {
                          setState(() {
                            for (var element in Constants.recommendProducts) {
                              element.isActive = false;
                            }

                            Constants.recommendProducts[index].isActive = true;
                            activeIndex = index;
                          });
                        },
                        isSelected: Constants.recommendProducts
                            .map((e) => e.isActive)
                            .toList(),
                        children: [
                          Constants.langButton(Constants.recommendProducts[0]),
                          Constants.langButton(Constants.recommendProducts[1]),
                          Constants.langButton(Constants.recommendProducts[2]),
                        ]),
                    Container(
                      height: height * 3/ 4,
                      child: Scaffold(
                        appBar: AppBar(
                          title:  Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Рекомендуем вам',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          bottom: TabBar(
                            indicatorColor: Color(0xffFF7011),
                            labelColor: Color(0xffFF7011),
                            unselectedLabelColor: Colors.grey,
                            controller: _tabController,
                            tabs: const [
                              Tab(text: 'Новинки'),
                              Tab(text: 'Популярное'),
                              Tab(text: 'Скидки + Рассрочка'),
                              Tab(text: 'Хиты продаж'),
                            ],
                          ),
                        ),
                        body: TabBarView(
                          controller: _tabController,
                          children: _tabs,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SvgPicture.asset(
                          'assets/images/orzu_blog.svg',
                        ),
                      ),
                    ),
                    carouselBlog(width, height),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      width: width,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll<Color>(
                                  Color(0xffFF7011)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child:  Text(
                          'Читать все',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    catalogItem(),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Widget carousel() {
    return Container(
      width: 392,
      height: 144,
      child: CarouselSlider(
        items: [0, 1].map((i) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 1),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Image.asset(Constants.listBanners[i]),
          );
        }).toList(),
        options: CarouselOptions(
          height: 300,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  Widget customEdit() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        height: 40,
        child: TextField(
          decoration: InputDecoration(
            fillColor: Color(0xffF0F0F0),
            filled: true,
            contentPadding: EdgeInsets.only(top: 0.0),
            hintText: 'Поиск товаров',
            prefixIcon: Icon(Icons.search),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffF0F0F0), width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffF0F0F0), width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget recomendedItem(index) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: Colors.white),
            width: 320,
            height: 300,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 170,
                          height: 130,
                          child: Image.asset(
                              Constants.recommendProducts[index].img_url)),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('Микроволновая печь соло Gorenje MO17E1W',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        children: [
                          Text('2 000 000 сум',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.lineThrough)),
                          Text('1 750 000 сум',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xffFF7011),
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      Container(
                        width: 86,
                        height: 32,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Color(0xffFF7011)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)))),
                          onPressed: () {},
                          child: SvgPicture.asset(
                            'assets/images/shopping_cart.svg',
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: 20,
            left: -5,
            height: 23,
            width: 70,
            child: SvgPicture.asset(
              'assets/images/vector.svg',
            )),
        const Positioned(
          top: 21,
          left: 16,
          child: Text(
            'Хит',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  Widget orderItem(index) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: Colors.white),
            width: 292,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Orders.listProducts[index].title.toString(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFF7011)),
                      ),
                      SvgPicture.asset(
                        'assets/images/tick_square.svg',
                      ),
                    ],
                  ),
                  Text(
                    Orders.listProducts[index].order_number.toString(),
                    style: TextStyle(fontSize: 14, color: Color(0xff7B7B7B)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    Orders.listProducts[index].delivery_date.toString(),
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    child: Container(
                      height: 34,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Color(0xffFF7011)),
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)))),
                        onPressed: () {},
                        child: Text(
                          'Забрать заказ',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 4,
          right: 3,
          height: 90,
          width: 90,
          child: SvgPicture.asset(
            Orders.listProducts[index].img_url.toString(),
          ),
        )
      ],
    );
  }

  Widget catalogItem() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              height: 120,
              width: 360,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'У нас всё!',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff14A23C),
                      ),
                    ),
                    Text(
                      'Хватит листать,\nпереходи в каталог.',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      width: 180,
                      height: 30,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Color(0xffFF7011)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)))),
                        onPressed: () {},
                        child:  Text(
                          'Каталог',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -25,
            right: 4,
            height: 135,
            width: 152,
            child: SvgPicture.asset(
              'assets/images/note.svg',
            ),
          )
        ],
      ),
    );
  }


  Widget carouselBlog(width, height) {
    return Container(
      width: 292,
      height: 180,
      color: Colors.transparent,
      child: CarouselSlider(
        items: [1, 2, 3].map((e) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/blog1.png')),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Топ-20 лучших недорогих планшетов на сегодняшний день',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  )),
            ),
          );
        }).toList(),
        options: CarouselOptions(
          height: 300,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
