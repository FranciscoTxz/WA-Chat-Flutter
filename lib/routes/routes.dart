import 'package:simple_menu/screens/home_screen.dart';
import 'package:simple_menu/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => HomeScreen(), routes: [
    /*GoRoute(
      path: "login_screen",
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: "main_page",
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      path: "order_page/:id",
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return OrderPage(id: id);
      },
    ),*/
  ]),
]);
