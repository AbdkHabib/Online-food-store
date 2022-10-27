import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_store/api/controllers/auth_api_controller.dart';
import 'package:food_store/api/controllers/home_api_controller.dart';
import 'package:food_store/models/api_response.dart';
import 'package:food_store/models/home_category.dart';
import 'package:food_store/models/slider.dart';
import 'package:food_store/utils/helpers.dart';
import 'package:food_store/widgets/app_text_field.dart';
import 'package:food_store/widgets/loading_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../api/controllers/home_api_controller.dart';
import 'product_screen.dart';
import 'sub_category_screen.dart';

class HomeScreen extends StatefulWidget with Helpers {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchTextController;
  late PageController _pageController;
  int _currentPageIndex = 0;

  static HomeScreen get info2 => info2;

  @override
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<HomeModel?>(
      future: HomeApiController().read(),
      builder: (context, snapshot) {
        // info2=snapshot.data!.categories[index].nameEn;
        // print(snapshot.data!.sliders.isNotEmpty);
        // print(snapshot.hasData.toString());
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: LoadingScreen(),
          );
        } else if (snapshot.hasData) {
          return ListView(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 258,
                      color: Color(0xff03A7A9),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.add_location_alt_rounded,
                              color: Colors.white,
                              size: 15,
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Text(
                              '204 Foxrun St.Davison, MI 48423',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 12, color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 28.0),
                          child: TextField(
                            onTap: () {
                              showSearch(
                                context: context,
                                delegate: MySearch(),
                              );
                            },
                            controller: _searchTextController,
                            style: GoogleFonts.nunito(),
                            decoration: InputDecoration(
                              hintText: 'Type something…',
                              hoverColor: Colors.white,
                              hintStyle:
                                  GoogleFonts.nunito(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.search_rounded,
                                color: Colors.white,
                              ),
                              enabledBorder: buildOutlineInputBorder(
                                color: const Color(0xFF9ADCDC),
                              ),
                              focusedBorder: buildOutlineInputBorder(
                                color: const Color(0xFF9ADCDC),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        /**************Slider********************/
                        Padding(
                          padding: const EdgeInsets.only(right: 28.0),
                          child: CarouselSlider.builder(
                            options: CarouselOptions(
                              scrollPhysics:
                                  ScrollPhysics(parent: ScrollPhysics()),
                              height: 180.0.h,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              viewportFraction: 1,
                            ),
                            itemBuilder: (context, i, id) {
                              return Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 5.0.w),
                                      child: Image.network(
                                          fit: BoxFit.cover,
                                          snapshot.data!.sliders[i].imageUrl),
                                    ),
                                  ),
                                ],
                              );
                            },
                            itemCount: snapshot.data!.sliders.length,
                          ),
                        ),
                        /**************famous_products********************/
                        SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            Text(
                              'Famous Products',
                              style: GoogleFonts.nunito(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             ProductScreen(id: ,),),);
                              },
                              child: const Text('See all'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 188.h,
                          child: GridView.builder(
                            itemCount: snapshot.data!.famousProducts.length,
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              crossAxisSpacing: 30.w,
                              mainAxisSpacing: 30.h,
                              childAspectRatio: 188.h / 150.w,
                            ),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        snapshot.data!.famousProducts[index]
                                            .imageUrl,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          snapshot.data!.famousProducts[index]
                                              .nameEn,
                                          style: GoogleFonts.ubuntu(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        /**************category********************/
                        Row(
                          children: [
                            Text(
                              'Categories',
                              style: GoogleFonts.nunito(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/category_screen');
                              },
                              child: const Text('See all'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 240.h,
                          child: GridView.builder(
                            itemCount: snapshot.data!.categories.length,
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 30.w,
                              mainAxisSpacing: 30.h,
                              childAspectRatio: 90.h / 66.w,
                            ),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SubCategoryScreen(
                                          id: snapshot
                                              .data!.categories[index].id),
                                    ),
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 93,
                                      width: 93,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white,
                                      ),
                                      child: Image.network(
                                        snapshot
                                            .data!.categories[index].imageUrl,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 11,
                                    ),
                                    Text(snapshot
                                        .data!.categories[index].nameEn),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        /**************latest_products********************/
                        Text(
                          'Collection',
                          style: GoogleFonts.nunito(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 200.h,
                          child: GridView.builder(
                            itemCount: snapshot.data!.latestProducts.length,
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                            ),
                            itemBuilder: (context, index) {
                              return Card(
                                color: Colors.transparent,
                                elevation: 0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(snapshot
                                        .data!.latestProducts[index].imageUrl),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Text(snapshot
                                        .data!.latestProducts[index].nameEn),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          return const Center(
            child: Text('NO DATA'),
          );
        }
      },
    ));
  }

  OutlineInputBorder buildOutlineInputBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}

class MySearch extends SearchDelegate {
  // HomeApiController<HomeModel?>? snapshot;
  // MySearch({this.snapshot});

  List<String> searchResults = [];

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: Icon(Icons.clear),
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResults) {
      final result = searchResults.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }
}
