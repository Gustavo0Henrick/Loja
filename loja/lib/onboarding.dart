import 'package:flutter/material.dart';
import 'package:loja/core/components/dots.dart';
import 'package:loja/core/routes.dart';

import 'package:loja/screens/onboarding1.dart';
import 'package:loja/screens/onboarding2.dart';
import 'package:loja/screens/onboarding3.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController _pageController;
  int currentPageValue = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      keepPage: false,
    );
  }

  void getChangedPageAndMoveBar(int page) {
    setState(() {
      currentPageValue = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.yellow,
                Colors.orange,
              ]),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: PageView(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      getChangedPageAndMoveBar(page);
                    },
                    children: [
                      BodyOnBoarding1(
                        image:
                            'https://png.pngtree.com/png-vector/20191026/ourlarge/pngtree-cat-face-glyph-icon-vector-png-image_1874311.jpg',
                        title: 'Loren Ipsum',
                        subtitle:
                            "Lorem Ipsum is simply dummy\ntext of the printing and typesetting \nindustry.",
                      ),
                      BodyOnBoarding2(
                        title: 'Loren Ipsum',
                        subtitle:
                            "Lorem Ipsum is simply dummy\ntext of the printing and typesetting \nindustry.",
                      ),
                      BodyOnBoarding3(
                        title: 'Loren Ipsum',
                        subtitle:
                            "Lorem Ipsum is simply dummy\ntext of the printing and typesetting \nindustry.",
                      ),
                    ]),
              ),
              Container(
                child: Text(
                  '${currentPageValue + 1}/3',
                  style: TextStyle(color: Colors.white, fontSize: 27),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 70, top: 50),
                child: Container(
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 5,
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      currentPageValue++;
                      setState(() {
                        if (currentPageValue == 3) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CustomRoutes.homepage));
                        } else {
                          _pageController.animateToPage(currentPageValue,
                              curve: Curves.decelerate,
                              duration: Duration(milliseconds: 500));
                        }
                      });
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (builder) => HomePage()));
                    },
                    child: Text(
                      'Avançar',
                      style: TextStyle(fontSize: 18, color: Colors.deepOrange),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
