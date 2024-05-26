import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'package:site/app/core/injections/injections.dart';
import 'package:site/app/core/responsive/responsive.dart';
import 'package:site/app/features/contact/contact.dart';
import 'package:site/app/features/home/widgets/experience/experience.dart';
import 'package:site/app/features/home/widgets/footer/footer.dart';
import 'package:site/app/features/home/widgets/presentation/presentation.dart';
import 'package:site/app/features/home/widgets/projects/projects.dart';
import 'package:site/app/features/home/widgets/social/social.dart';
import 'package:site/app/widgets/app_bar/app_bar.dart';
import 'package:site/app/widgets/drawer/drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
    FirebaseRemoteConfig? firebaseRemoteConfig,
  }) : _firebaseRemoteConfig = firebaseRemoteConfig ?? getIt();

  /// The [FirebaseRemoteConfig] instance is here to be used for future updates and configurations.
  // ignore: unused_field
  final FirebaseRemoteConfig _firebaseRemoteConfig;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Widget> items;

  final itemScrollController = ItemScrollController();
  final itemPositionsListener = ItemPositionsListener.create();

  @override
  void initState() {
    super.initState();
    items = [
      ContactWidget(
        contactCubit: getIt<ContactCubit>(),
      ),
      Presentation(itemScrollController),
      const Projects(),
      const Experience(),
      const Social(),
      const CustomFooter(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isToShowDrawer = constraints.maxWidth < Breakpoints.appBar;

        return Scaffold(
          appBar: CustomAppBar(itemScrollController),
          drawer: isToShowDrawer ? CustomDrawer(itemScrollController) : null,
          body: ScrollablePositionedList.builder(
            itemCount: items.length,
            itemScrollController: itemScrollController,
            itemPositionsListener: itemPositionsListener,
            itemBuilder: (context, index) => items[index],
          ),
        );
      },
    );
  }
}
