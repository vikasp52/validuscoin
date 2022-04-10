import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:validuscoin/repository/watchlist/watchlist_repository.dart';
import 'package:validuscoin/screens/profile/profile.dart';
import 'package:validuscoin/screens/watchlist/cubit/watchlist_cubit.dart';
import 'package:validuscoin/screens/watchlist/watchlist.dart';
import 'package:validuscoin/util/custom_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  var pages = [
    BlocProvider<WatchlistCubit>(
      create: (context) => WatchlistCubit(
        WatchlistRepository(),
      ),
      child: const WatchList(),
    ),
    const ProfileScreen(),
  ];

  final navElement = [
    BottomNavElement(
      label: 'Stocks',
      path: 'assets/stock.svg',
    ),
    BottomNavElement(
      label: 'Home',
      path: 'assets/home.svg',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<BottomNavigationBarItem> bottomNavigationBarItem() {
    return List.generate(
      navElement.length,
      (index) => BottomNavigationBarItem(
        icon: SvgPicture.asset(
          navElement[index].path,
          color: (_selectedIndex == index)
              ? CustomColors.tabSelectedColor
              : CustomColors.whiteColor,
        ),
        label: navElement[index].label,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: CustomColors.backgroundColor,
        items: bottomNavigationBarItem(),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: CustomColors.tabSelectedColor,
        unselectedItemColor: CustomColors.whiteColor,
        iconSize: 40,
        onTap: _onItemTapped,
        elevation: 0,
      ),
    );
  }
}

class BottomNavElement {
  final String label;
  final String path;

  BottomNavElement({
    required this.label,
    required this.path,
  });
}
