import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping/models/Products.dart';

class NewItemPage extends StatefulWidget {
  const NewItemPage({super.key});

  @override
  State<NewItemPage> createState() => _NewItemPageState();
}

class _NewItemPageState extends State<NewItemPage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var size = mediaQueryData.size;
    var width = mediaQueryData.size.width;
    var height = mediaQueryData.size.height;
    var orientation = mediaQueryData.orientation;

    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(16.0),
              color: Colors.white,
              elevation: 0.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return recomendedItem(index, width,height);
                  },
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              width: width,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  const MaterialStatePropertyAll<Color>(
                      Color(0xffFF7011)),
                  shape: MaterialStateProperty.all<
                      RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Все акции',
                  style: TextStyle(
                      color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget recomendedItem(index, width, height) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          color: Colors.transparent,
          height: height / 6,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                      height: 81,
                      child: Image.asset(
                          Products.listProducts[index].img_url.toString())),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Products.listProducts[index].name.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          softWrap: true,
                        ),
                        SizedBox(height: height/90,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  Products.listProducts[index].price.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                  overflow: TextOverflow.clip,
                                ),
                                Text(
                                    Products.listProducts[index].sale_price
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Color(0xffFF7011),
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                            Container(
                              width: 65,
                              height: 32,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll<Color>(
                                            Color(0xffFF7011)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)))),
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
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
