import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_bottom_navigation_bar.dart';
import '../../widgets/custom_image_rating_container.dart';
import '../../widgets/list_item.dart';

class SearchBarScreen extends StatefulWidget {
  static const id = "/search_bar_screen";

  const SearchBarScreen({Key? key}) : super(key: key);

  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {
  // final List<ListItem> _itemsTypeList = [const ListItem(itemType: "All")];

  final _searchController = TextEditingController();
  String itemType = "All";
  @override
  Widget build(BuildContext context) {
    // print("itemDocId: ${widget.itemDocId}");
    // print("itemCollectionId: ${widget.itemCollectionId}");

    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: const Size(360, 690),
      context: context,
      minTextAdapt: true,
      orientation: Orientation.portrait,
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF4F4F4),
        body: Column(children: [
          // SizedBox(
          //   height: 50.h,
          // ),
          _searchTextField(context, 'Flowers'),
          SizedBox(
            height: 5.h,
          ),
          SizedBox(
            height: 40.h,
            child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  try {
                    return GestureDetector(
                      onTap: () {},
                      child: const ListItem(
                        itemType: 'Flowers',
                      ),
                    );
                  } on Exception catch (e) {
                    return Container();
                  } catch (e) {
                    return Container();
                  }
                }),
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                try {
                  return const CustomImageRatingContainerWidget();
                } on Exception catch (e) {
                  return const Text("Some Thing went wrong");
                } catch (e) {
                  return Container();
                }
              },
            ),
          ),
        ]),
        bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 0),
      ),
    );
    ;
    // });
    //  });
  }

  Container _searchTextField(BuildContext context, String itemType) {
    return Container(
      color: Colors.white,
      height: 90.h,
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: TextFormField(
          textAlign: TextAlign.center,
          controller: _searchController,
          onChanged: (value) {
            setState(() {
              this.itemType = value;
            });
          },
          decoration: InputDecoration(
            hintText: 'Search For $itemType',

            fillColor: const Color(0xffF4F4F4).withOpacity(0.5),
            filled: true,
            prefixIcon: const Icon(
              Icons.search_sharp,
              color: Color(0xffBABABA),
            ),
            hintStyle: const TextStyle(color: Color(0xffA3A3A3)),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: InputBorder.none,
            // enabledBorder: enableBorder.copyWith(
            //   borderRadius: BorderRadius.circular(0.0),
            // ),
            // focusedBorder: focusedBorder,
          ),
        ),
      ),
    );
  }
}
