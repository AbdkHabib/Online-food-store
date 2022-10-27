import 'package:flutter/material.dart';
import 'package:food_store/api/controllers/favorite_api_controller.dart';
import 'package:food_store/models/favorite.dart';
import 'package:food_store/widgets/loading_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Favourite',
            style: GoogleFonts.ubuntu(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
        ),
        body: FutureBuilder<List<Favorite>>(
          future: FavoriteApiController().getFavorite(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: LoadingScreen(),
              );
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Spacer(),
                          LikeButton(size: 30),
                        ],
                      ),
                      Center(
                        child: Image.network(
                          'https://media.istockphoto.com/vectors/logo-of-a-green-life-tree-with-roots-and-leaves-vector-illustration-vector-id1130887322?k=20&m=1130887322&s=612x612&w=0&h=dPVnCDJ4ocIqtn51iJDzEKdesx_RikdT74asv81jJdk=',
                          height: 115,
                          width: 115,
                        ),
                      ),
                      Text(
                        'snapshop',
                        style: GoogleFonts.ubuntu(fontSize: 14),
                      ),
                      Text(
                        '\$16',
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
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
        ));
  }
}
