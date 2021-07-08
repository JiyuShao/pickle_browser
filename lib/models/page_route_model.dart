/*
 * 路由相关数据
 * @Author: Jiyu Shao 
 * @Date: 2021-06-30 15:29:29 
 * @Last Modified by: Jiyu Shao
 * @Last Modified time: 2021-07-08 11:05:18
 */
import 'package:flutter/material.dart';
import 'package:appleickle_browser/screens/error_screen.dart';
import 'package:appleickle_browser/screens/home/home_screen.dart';
import 'package:appleickle_browser/screens/not_found_screen.dart';
import 'package:appleickle_browser/screens/popup_menu/popup_menu_screen.dart';
import 'package:appleickle_browser/screens/search/search_screen.dart';
import 'package:appleickle_browser/utils/routes/page_routes/fade_page_route.dart';
import 'package:appleickle_browser/utils/routes/page_routes/popup_page_route.dart';
import 'package:appleickle_browser/utils/routes/page_routes/search_page_route.dart';

// 路由配置
class PageRouteModel {
  PageRouteModel({
    required this.path,
    required this.routeGenerator,
  });

  // 当前路由路径
  final String path;
  // 当前路由创建方法
  final Route<dynamic>? Function(RouteSettings settings) routeGenerator;

  Map<String, dynamic> toJson() {
    return {
      "path": this.path,
    };
  }
}

// 页面路径配置
List<PageRouteModel> routeListConfig = [
  // 首页页面路径
  PageRouteModel(
      path: '/',
      routeGenerator: (_) => FadePageRoute(
          pageBuilder: (_, __, ___) => HomeScreen(),
          settings: RouteSettings(name: '/'))),

  // 弹窗菜单路由
  PageRouteModel(
      path: '/popup_menu',
      routeGenerator: (_) => PopupPageRoute(
          pageBuilder: (_, __, ___) => PopupMenuScreen(),
          settings: RouteSettings(name: '/popup_menu'))),

  // 搜索页面路径
  PageRouteModel(
      path: '/search',
      routeGenerator: (_) => SearchPageRoute(
          pageBuilder: (_, __, ___) => SearchScreen(),
          settings: RouteSettings(name: '/search'))),
];

// 错误路由
PageRouteModel errorRouteConfig = PageRouteModel(
    path: '/error',
    routeGenerator: (_) => FadePageRoute(
        pageBuilder: (_, __, ___) => ErrorScreen(),
        settings: RouteSettings(name: '/error')));

// 404 路由
PageRouteModel notFoundRouteConfig = PageRouteModel(
    path: '/not_found',
    routeGenerator: (_) => FadePageRoute(
        pageBuilder: (_, __, ___) => NotFoundScreen(),
        settings: RouteSettings(name: '/not_found')));