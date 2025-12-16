import 'package:flutter/material.dart';
import '../../presentation/ui/layouts/favorities/favorities_layout.dart';
import '../../presentation/ui/layouts/help/help_layout.dart';
import '../../presentation/ui/layouts/home/home_layout.dart';
import '../../presentation/ui/layouts/menu/menu_layout.dart';
import '../../presentation/ui/layouts/orders/orders-layout.dart';

List<Widget> layouts = [
  HomeLayout(),
  MenuLayout(),
  FavoritesLayout(),
  OrdersLayout(),
  HelpLayout(),
];