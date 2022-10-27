import 'package:flutter/material.dart';
import 'package:food_store/widgets/on_boarding_content.dart';
import 'package:food_store/widgets/on_boarding_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPageIndex = 0;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (int pageIndex) {
                    setState(() {
                      _currentPageIndex = pageIndex;
                    });
                  },
                  children: const [
                    OnBoardingContent(
                      image: 'undraw_chef_lbjx',
                      title: 'Largest Variety Food',
                      subTitle:
                          'Borrow the largest variety of food, groceries, drink and more.',
                    ),
                    OnBoardingContent(
                      image: '3333446',
                      title: 'Realtime Tracking',
                      subTitle: 'Track your delivery in realtime.',
                    ),
                    OnBoardingContent(
                      image: 'undraw_eating_together_tjhx',
                      title: 'Pickup Delivery',
                      subTitle:
                          'Pickup dlivery at door step and enjoy your meal & groceries.',
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Visibility(
                    maintainState: true,
                    maintainAnimation: true,
                    maintainSize: true,

                    child:      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OnBoardingIndicator(
                          isSelected: _currentPageIndex == 0,
                          marginEnd: 14,
                        ),
                        OnBoardingIndicator(
                          isSelected: _currentPageIndex == 1,
                          marginEnd: 14,
                        ),
                        OnBoardingIndicator(
                          isSelected: _currentPageIndex == 2,
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_currentPageIndex != 2){
                        _pageController.nextPage(
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOutBack);}else{
                        Navigator.pushReplacementNamed(context, '/login_screen');
                      }
                    },
                    child: Text(
                      'Skip',
                      style: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  )
                ],
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     TabPageSelectorIndicator(
              //       backgroundColor:
              //           _currentPageIndex == 0 ? Colors.blue : Colors.grey.shade200,
              //       borderColor: Colors.orange,
              //       size: 10,
              //     ),
              //     TabPageSelectorIndicator(
              //       backgroundColor:
              //           _currentPageIndex == 1 ? Colors.blue : Colors.grey.shade200,
              //       borderColor: Colors.orange,
              //       size: 10,
              //     ),
              //     TabPageSelectorIndicator(
              //       backgroundColor:
              //           _currentPageIndex == 2 ? Colors.blue : Colors.grey.shade200,
              //       borderColor: Colors.orange,
              //       size: 10,
              //     ),
              //   ],
              // ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
//ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       primary: Color(0xFF6A90F2),
//                       minimumSize: Size(double.infinity, 45),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(22.5))),
//                   onPressed: () =>
//                       Navigator.pushReplacementNamed(context, '/login_screen'),
//                   child: Text(
//                     'START',
//                     style: GoogleFonts.nunito(),
//                   ),
//                 ),
