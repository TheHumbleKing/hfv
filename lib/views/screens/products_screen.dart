import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hfv_app/views/screens/add_to_cart_screen.dart';
import 'package:hfv_app/views/screens/ar_view.dart';
import 'package:hfv_app/views/screens/your_order_screen.dart';
import 'package:hfv_app/widgets/custom_bottom_navigation_bar.dart';

import 'search_flowers_screen.dart';

class ProductsScreen extends StatefulWidget {
  static const id = "/product_screen";

  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  // final List<Widget> _productsList = const [
  Icon customIcon = const Icon(Icons.shopping_cart);
  Widget customSearchBar = const SearchWidget();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      designSize: const Size(360, 690),
      context: context,
      minTextAdapt: true,
      orientation: Orientation.portrait,
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: customSearchBar,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => YourOrderScreen(),
                  ),
                );
                return;
                setState(() {
                  if (customIcon.icon == Icons.shopping_cart) {
                    customIcon = const Icon(Icons.cancel);
                    customSearchBar = const ListTile(
                      leading: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 28,
                      ),
                      title: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          hintText: 'type in journal name...',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                          ),
                          // border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  } else {
                    customIcon = const Icon(Icons.shopping_cart);
                    customSearchBar = const Text('Search Product');
                  }
                });
              },
              icon: customIcon,
            )
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyCard(
                  image1: 'assets/images/must.jpg',
                  image2: 'assets/images/m7.jpg'),
              MyCard(
                  image1: 'assets/images/b3.jpg',
                  image2: 'assets/images/m7.jpg'),
              MyCard(
                  image1: 'assets/images/w1.jpg',
                  image2: 'assets/images/w2.jpg'),
              MyCard(
                  image1: 'assets/images/b2.jpg',
                  image2: 'assets/images/m7.jpg'),
            ],
          ),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(
          currentIndex: 0,
        ),
      ),
    );
  }
}

class MyCard extends StatefulWidget {
  var image1;
  var image2;
  MyCard({Key? key, this.image1, this.image2}) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ProductCard(
        image: widget.image1,
      ),
      ProductCard(
        image: widget.image2,
      ),
    ]);
  }
}

class ProductCard extends StatefulWidget {
  var image;
  bool liked;

  ProductCard({Key? key, this.image, this.liked = false}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: 170,
        child: Column(
          children: [
            SizedBox(
              width: 170,
              height: 100,
              child: FittedBox(
                child: Image.asset(widget.image),
                fit: BoxFit.fill,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                ),
                Icon(
                  Icons.comment,
                  color: Colors.black,
                  size: 28.0,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ARView()));
                    },
                    icon: Icon(
                      Icons.view_in_ar,
                      color: Colors.black,
                      size: 30.0,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
          width: 250,
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.grey, width: 2.0)),
            ),
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        IconButton(
          onPressed: () {},
          splashRadius: 20,
          icon: const Icon(
            Icons.search,
            color: Colors.white,
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
        ),
      ],
    );
  }
}
