import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping/ui/basket/basket_page.dart';
import 'package:shopping/ui/catalog/catalog_page.dart';
import 'package:shopping/ui/favorite/favorite_page.dart';
import 'package:shopping/ui/home/home_page.dart';
import 'package:shopping/ui/profile/profile_page.dart';
import 'package:shopping/ui/recomended/new_item/new_item_page.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedPage = 0;

  final _pagesOptions = [
    HomePage(),
    CatalogPage(),
    BasketPage(),
    FavoritePage(),
    NewItemPage()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: _pagesOptions[selectedPage],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: BottomNavigationBar(
          currentIndex: selectedPage,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          fixedColor: const Color(0xffff6f12),
          items: [
            BottomNavigationBarItem(
                label: "Главная",
                icon: selectedPage == 0
                    ? SvgPicture.asset('assets/images/home.svg')
                    : SvgPicture.asset('assets/images/home.svg',
                        color: Colors.grey)),
            BottomNavigationBarItem(
                label: "Каталог",
                icon: selectedPage == 1
                    ? SvgPicture.asset('assets/images/search_status.svg',
                        color: const Color(0xffff6f12))
                    : SvgPicture.asset('assets/images/search_status.svg')),
            BottomNavigationBarItem(
                label: "Корзина",
                icon: selectedPage == 2
                    ? SvgPicture.asset('assets/images/shopping_cart2.svg',
                        color: const Color(0xffff6f12))
                    : SvgPicture.asset('assets/images/shopping_cart2.svg')),
            BottomNavigationBarItem(
                label: "Избранное",
                icon: selectedPage == 3
                    ? SvgPicture.asset('assets/images/heart.svg',
                        color: const Color(0xffff6f12))
                    : SvgPicture.asset('assets/images/heart.svg')),
            BottomNavigationBarItem(
                label: "Профиль",
                icon: selectedPage == 4
                    ? SvgPicture.asset('assets/images/user.svg',
                        color: const Color(0xffff6f12))
                    : SvgPicture.asset('assets/images/user.svg')),
          ],
          onTap: (value) {
            setState(() {
              selectedPage = value;
            });
          },
        ),
      ),
    ));
  }
}
