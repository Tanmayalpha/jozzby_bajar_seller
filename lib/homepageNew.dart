import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePageNewScreen extends StatefulWidget {
  const HomePageNewScreen({Key? key}) : super(key: key);

  @override
  State<HomePageNewScreen> createState() => _HomePageNewScreenState();
}

class _HomePageNewScreenState extends State<HomePageNewScreen> {
  final FixedExtentScrollController _controller = FixedExtentScrollController(initialItem: 0);
  int _currentItem = 0;
  Random random = Random();
  final scrollDirection = Axis.vertical;
  // late AutoScrollController controller;
  int _itemCount = 15;
  ScrollController controller = ScrollController();
  // PageController controller = PageController(initialPage: 100);
  int _currentPage = 0;

  void _scrollToFullHeight() {
    double screenHeight = MediaQuery.of(context).size.height;
    _controller.animateTo(
      screenHeight,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
  //
  // void _scrollToTop() {
  //   _controller.animateTo(
  //     _controller.position.maxScrollExtent,
  //     duration: Duration(milliseconds: 500),
  //     curve: Curves.easeInOut,
  //   );
  // }
  //
  //
  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }
  // double _previousPosition = 0.0;
  // final _animationDuration = Duration(milliseconds: 500);
  // final _curve = Curves.easeIn;
  @override
  void initState() {
    super.initState();
    // controller.addListener(_pageListener);
  }

  // @override
  // void dispose() {
  //   controller.removeListener(_pageListener);
  //   controller.dispose();
  //   super.dispose();
  // }
  //
  // void _pageListener() {
  //   setState(() {
  //     _currentPage = controller.page!.round();
  //   });
  // }
  // void _handleVerticalDragUpdate(DragUpdateDetails details) {
  //   // Calculate the total scroll distance based on the touch movement.
  //   double scrollDistance = details.delta.dy;
  //
  //   // Calculate the number of items that need to be scrolled.
  //   int itemCount = _itemCount;
  //   int itemsToScroll = (scrollDistance / 50).round();
  //
  //   // Calculate the new page index based on the current position and the number of items to scroll.
  //   int newPageIndex = _currentPage - itemsToScroll;
  //
  //   // Limit the newPageIndex within the bounds of the page count.
  //   newPageIndex = newPageIndex.clamp(0, itemCount - 1);
  //
  //   // Calculate the new scroll position of the ListWheelScrollView.
  //   double newScrollPosition = (scrollDistance % 50) + 25;
  //
  //   // Animate the ListWheelScrollView to the new position.
  //   _controller.animateToItem(newPageIndex * itemCount,
  //       duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
  //
  //   // Animate the PageView to the new page index.
  //   controller.animateToPage(
  //     newPageIndex,
  //     duration: Duration(milliseconds: 200),
  //     curve: Curves.easeInOut,
  //   );
  // }
bool isGoingUp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     DragUpdateDetails? details ;
      //     // _controller.position.moveTo(_currentItem-1 - details!.delta.dy);
      //     _controller.animateToItem(_currentItem-1, duration: Duration(milliseconds: 500), curve: Curves.linear);
      //     setState(() {});
      //   },
      //   child: Icon(Icons.arrow_upward_sharp),
      //   backgroundColor: Colors.green,
      // ),

      ///-------------trying with pageview--------------------
      // GestureDetector(
      //   // onVerticalDragUpdate: _handleVerticalDragUpdate,
      //   child: PageView.builder(
      //     controller: controller,
      //     // physics: NeverScrollableScrollPhysics(),
      //     itemCount: _itemCount *100,
      //     scrollDirection: Axis.vertical,
      //     itemBuilder: (context, index) {
      //       return _buildPage(index);
      //     },
      //     // onPageChanged: (index) {
      //     //   _currentItem = index;
      //     // },
      //     // children: [
      //     //   Container(
      //     //       height: MediaQuery.of(context).size.height / 1,
      //     //       child: ListWheelScrollView.useDelegate(
      //     //           controller: controller,
      //     //           diameterRatio: 9,
      //     //           itemExtent: 750,
      //     //           // physics: NeverScrollableScrollPhysics(),
      //     //           // physics:FixedExtentScrollPhysics(),
      //     //           perspective: 0.009,
      //     //           onSelectedItemChanged: (int index) {
      //     //             _currentItem = index;
      //     //             print("_currentItem $_currentItem");
      //     //           },
      //     //           childDelegate: ListWheelChildBuilderDelegate(
      //     //             childCount: 10,
      //     //             builder: (context, index) {
      //     //               return Container(
      //     //                   height: MediaQuery.of(context).size.height / 1.5,
      //     //                   width: MediaQuery.of(context).size.width / 1,
      //     //                   child: Column(
      //     //                     children: [
      //     //                       Stack(
      //     //                         children: [
      //     //                           Image.asset(
      //     //                             'assets/images/image2.png',
      //     //                             fit: BoxFit.fill,
      //     //                           ),
      //     //                           Positioned(
      //     //                             top: 30,
      //     //                             left:
      //     //                             MediaQuery.of(context).size.width / 2.5,
      //     //                             child: Image.asset(
      //     //                               'assets/images/cop_g_icon.png',
      //     //                               height: 50,
      //     //                               width: 80,
      //     //                             ),
      //     //                           )
      //     //                         ],
      //     //                       )
      //     //                     ],
      //     //                   ));
      //     //             },
      //     //           ))),
      //     // ],
      //   ),
      // ),

      ///working with only scroll down
       body: SingleChildScrollView(

        child: GestureDetector(
          onVerticalDragUpdate: (details) {
            if(isGoingUp == false){
              _controller.position.moveTo(_currentItem+1 - details.delta.dy);
            }else {
              _controller.position.moveTo(_currentItem-1 + details.delta.dy);
            }
          },

          onVerticalDragEnd: (details) {
            double currentOffset = _controller.position.pixels;
            double screenHeight = MediaQuery.of(context).size.height;

            if (details.velocity.pixelsPerSecond.dy < -300 && currentOffset < _controller.position.maxScrollExtent) {
              print("going down");
              _scrollToFullHeight();
            }else if (details.velocity.pixelsPerSecond.dy > 300 && currentOffset < _controller.position.maxScrollExtent - screenHeight) {

              setState(() {
                isGoingUp = true;
              });
              print("going up $isGoingUp");
            }
          },

          child: Container(
              //height: MediaQuery.of(context).size.height / 1,
              child: ListWheelScrollView.useDelegate(
                  controller: _controller,
                  diameterRatio: 9,
                  itemExtent: 750,
                 physics: NeverScrollableScrollPhysics(),
                   // physics: FixedExtentScrollPhysics(parent: ScrollPhysics()),
                  perspective: 0.009,
                  onSelectedItemChanged: (int index) {
                    _currentItem = index;
                    print("_currentItem $_currentItem");
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 10,
                    builder: (context, index) {
                      return Container(
                          height: MediaQuery.of(context).size.height / 1.5,
                          width: MediaQuery.of(context).size.width / 1,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Image.asset(
                                    'assets/images/image2.png',
                                    fit: BoxFit.fill,
                                  ),
                                  Positioned(
                                    top: 30,
                                    left:
                                        MediaQuery.of(context).size.width / 2.5,
                                    child: Image.asset(
                                      'assets/images/cop_g_icon.png',
                                      height: 50,
                                      width: 80,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ));
                    },
                  ))),
        ),
      ),

    );
  }
  Widget _buildPage(int pageIndex) {
    return Transform.rotate(
      angle: 0.8,
      child: Container(
        height: MediaQuery.of(context).size.height / 1,
        child:
        ListView.builder(
        // ListWheelScrollView.useDelegate(
        //   itemExtent: 750,
        //   diameterRatio: 9,
        //   perspective: 0.009,
          // controller: controller,
          // physics: NeverScrollableScrollPhysics(),
          // controller: _controller,
          // physics: FixedExtentScrollPhysics(),
          itemBuilder: (context, index){
            return Container(
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width / 1,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          'assets/images/image2.png',
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          top: 30,
                          left:
                          MediaQuery.of(context).size.width / 2.5,
                          child: Image.asset(
                            'assets/images/cop_g_icon.png',
                            height: 50,
                            width: 80,
                          ),
                        )
                      ],
                    )
                  ],
                ));
          },
          // onSelectedItemChanged: (index) {
          //   if (_currentPage * _itemCount + index != controller.page!.round()){
          //     controller.animateToPage(
          //       _currentPage * _itemCount + index,
          //       duration: Duration(milliseconds: 300),
          //       curve: Curves.easeInOut,
          //     );
          //   }
          //
          // },
          // childDelegate: ListWheelChildBuilderDelegate(
          //   builder: (context, index) {
          //     final itemIndex = pageIndex * _itemCount + index;
          //     return Container(
          //         height: MediaQuery.of(context).size.height / 1.5,
          //         width: MediaQuery.of(context).size.width / 1,
          //         child: Column(
          //           children: [
          //             Stack(
          //               children: [
          //                 Image.asset(
          //                   'assets/images/image2.png',
          //                   fit: BoxFit.fill,
          //                 ),
          //                 Positioned(
          //                   top: 30,
          //                   left:
          //                   MediaQuery.of(context).size.width / 2.5,
          //                   child: Image.asset(
          //                     'assets/images/cop_g_icon.png',
          //                     height: 50,
          //                     width: 80,
          //                   ),
          //                 )
          //               ],
          //             )
          //           ],
          //         ));
          //   },
          //   childCount: _itemCount,
          // ),
        ),
      ),
    );
  }
}


// Stack(
// children: [
// Image.asset('assets/images/image2.png',fit: BoxFit.fill,),
// Positioned(
// top: 30,
// left: MediaQuery.of(context).size.width/2.5,
// child: Image.asset('assets/images/cop_g_icon.png',height: 50,width: 80,),)
//
// ],
// ),
