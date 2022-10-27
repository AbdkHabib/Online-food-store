import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_store/api/controllers/category_api_controller.dart';
import 'package:food_store/models/categories.dart';
import 'package:food_store/widgets/loading_screen.dart';

import 'sub_category_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

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
          'Categories',

        ),
        elevation: 0,
      ),
      body: FutureBuilder<List<Categories>>(
        future: CategoryApiController().read(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: LoadingScreen(),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Padding(
              padding: EdgeInsets.all(16.0.r),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 30.w,
                  mainAxisSpacing: 30.h,
                  childAspectRatio: 90.w / 123.h,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SubCategoryScreen(id: snapshot.data![index].id),
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
                            snapshot.data![index].imageUrl,
                            height: 62.h,
                            width: 62.w,
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
              child: Text('NO DATA',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  )),
            );
          }
        },
      ),
    );
  }
}
