import 'package:e_commerce/ui/screens/home/cubit/home_screen_states.dart';
import 'package:e_commerce/ui/screens/home/home_tabs/developer_tab/developer_tab.dart';
import 'package:e_commerce/ui/screens/home/home_tabs/products_tab/products_tab.dart';
import 'package:e_commerce/ui/screens/home/home_tabs/wishlist_tab/wishlist_tab.dart';
import 'package:e_commerce/ui/screens/home/home_tabs/home_tab/home_tab.dart';
import 'package:e_commerce/ui/screens/home/home_tabs/profile_tab/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  HomeScreenViewModel() : super(HomeScreenInitialState());
  int selectedIndex = 0;
  List<Widget> tabs = const [
    HomeTab(),
    ProductsTab(),
    WishListTab(),
    ProfileTab(),
    DeveloperPage(),
  ];
  void changeTab(newIndex) {
    // emit(HomeScreenInitialState());
    selectedIndex = newIndex;
    emit(HomeScreenChangingTabState());
  }
}
