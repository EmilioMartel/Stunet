import 'package:go_router/go_router.dart';
import 'package:stunet/presentation/screens/auth/login_screen.dart';
import 'package:stunet/presentation/screens/auth/signin_screen.dart';
import 'package:stunet/presentation/screens/stunet/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [GoRoute(
      path: '/',
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/sign-in',
      name: SignInScreen.name,
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: '/home',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),

  ]
);