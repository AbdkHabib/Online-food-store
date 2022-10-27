import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_store/api/controllers/sub_category_api_conroller.dart';
import 'package:food_store/models/sub_category.dart';
import 'package:food_store/screens/product_screen.dart';
import 'package:food_store/widgets/loading_screen.dart';

class SubCategoryScreen extends StatefulWidget {
  SubCategoryScreen({required this.id, Key? key}) : super(key: key);
  int id;

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),

        title: Text(
          'Categories details',

        ),
        elevation: 0,
      ),
      body: FutureBuilder<List<SubCategory>>(
        future: SubCategoryApiController().read(id: widget.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: LoadingScreen(),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Padding(
              padding: EdgeInsets.all(16.0.r),
              child: GridView.builder(

                itemCount: snapshot.data!.length,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 30.w,
                  mainAxisSpacing: 30.h,
                  childAspectRatio: 90.h / 123.w,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProductScreen(id: snapshot.data![index].id)));
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
                            snapshot.data![index].imageUrl,

                          ),
                        ),
                        SizedBox(height: 11,),
                        Text(snapshot.data![index].nameEn),
                      ],
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: Text('NO DATA'),
            );
          }
        },
      ),
    );
  }
}
