import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:sellermultivendor/Screen/DeshBord/profileagain.dart';
import 'package:sellermultivendor/Widget/validation.dart';
import '../../Helper/Color.dart';
import '../../Helper/Constant.dart';
import '../../Widget/desing.dart';
import '../HomePage/home.dart';
import '../OrderList/OrderList.dart';
import '../ProductList/ProductList.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late List<Widget> fragments;
  int _curBottom = 0;
  @override
  void initState() {
    super.initState();
    fragments = [
      const Home(),
      const OrderList(),
      // ProductList(
      //   flag: "",
      //   fromNavbar: true,
      // ),
      const ProfileAgain(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getBottomNav(),
      body: fragments[_curBottom],
    );
  }

  getBottomNav() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(circularBorderRadius13)),
        boxShadow: [
          BoxShadow(
            color: fillColor,
            offset: Offset(0, -3),
            blurRadius: 6,
            spreadRadius: 0,
          )
        ],
        color: white,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(circularBorderRadius12),
          topLeft: Radius.circular(circularBorderRadius12),
        ),
        child: BottomNavigationBar(
          unselectedItemColor: primary,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                    primary, BlendMode.srcIn),
                child: SvgPicture.asset(
                  DesignConfiguration.setSvgPath('home'),

                ),
              ),
              activeIcon: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                    primary, BlendMode.srcIn),
                child: SvgPicture.asset(
                  DesignConfiguration.setSvgPath('homeSelected'),

                ),
              ),
              label: getTranslated(context, 'Home')!,
            ),
            BottomNavigationBarItem(
              icon: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                    primary, BlendMode.srcIn),
                child: SvgPicture.asset(
                  DesignConfiguration.setSvgPath('order'),

                ),
              ),
              activeIcon: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                    primary, BlendMode.srcIn),
                child: SvgPicture.asset(
                  DesignConfiguration.setSvgPath('orderselected'),

                ),
              ),
              label: getTranslated(context, 'Orders')!,
            ),
            // BottomNavigationBarItem(
            //   icon: ColorFiltered(
            //     colorFilter: const ColorFilter.mode(
            //         primary, BlendMode.srcIn),
            //     child: SvgPicture.asset(
            //       DesignConfiguration.setSvgPath('product'),
            //
            //     ),
            //   ),
            //   activeIcon: ColorFiltered(
            //     colorFilter: const ColorFilter.mode(
            //         primary, BlendMode.srcIn),
            //     child: SvgPicture.asset(
            //       DesignConfiguration.setSvgPath('productSelected'),
            //
            //     ),
            //   ),
            //   label: getTranslated(context, 'PRODUCTS')!,
            // ),
            BottomNavigationBarItem(
              icon: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                    primary, BlendMode.srcIn),
                child: SvgPicture.asset(
                  DesignConfiguration.setSvgPath('profile'),

                ),
              ),
              activeIcon: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                    primary, BlendMode.srcIn),
                child: SvgPicture.asset(
                  DesignConfiguration.setSvgPath('profileSelected'),

                ),
              ),
              label: getTranslated(context, 'Profile')!,
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _curBottom,
          selectedItemColor: primary,
          onTap: (int index) {
            if (mounted) {
              setState(
                () {
                  _curBottom = index;
                },
              );
            }
          },
          elevation: 25,
        ),
      ),
    );
  }
}
