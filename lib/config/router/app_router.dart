import 'package:go_router/go_router.dart';
import 'package:stunet/presentation/screens/stunet/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    )
  ]
);