import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gameapp/screens/detailpage.dart';
import 'package:gameapp/screens/lading_page.dart';

import '../models/data_model.dart';

part 'approuter.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LandingPage, initial: true),
    AutoRoute(page: DetailsPage)
  ],
)
class AppRouter extends _$AppRouter {}
