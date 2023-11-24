import 'package:auto_route/auto_route.dart';
import 'package:ebook_reader/core/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const [
        BookshelfTab(),
        FavoritesTab(),
      ],
      builder: (context, child, controller) {
        return Theme(
          data: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blueAccent,
              brightness: Brightness.light,
            ),
          ),
          child: SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  TabBar(
                    controller: controller,
                    tabs: const [
                      Tab(text: 'Estante', icon: Icon(Icons.book)),
                      Tab(text: 'Favoritos', icon: Icon(Icons.bookmark)),
                    ],
                  ),
                  Expanded(child: child),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
