import 'package:go_router/go_router.dart';
import 'package:stunet/presentation/screens/auth/login_screen.dart';
import 'package:stunet/presentation/screens/auth/signin_screen.dart';
import 'package:stunet/presentation/screens/stunet/chat_screen.dart';
import 'package:stunet/presentation/screens/stunet/discover_screen.dart';
import 'package:stunet/presentation/screens/stunet/home_screen.dart';
import 'package:stunet/presentation/screens/stunet/profile_screen.dart';
import 'package:stunet/presentation/screens/stunet/search_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
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
    GoRoute(
      path: '/search',
      name: SearchScreen.name,
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: '/discover',
      name: DiscoverScreen.name,
      builder: (context, state) => const DiscoverScreen(),
    ),
    GoRoute(
      path: '/chat',
      name: ChatScreen.name,
      builder: (context, state) => const ChatScreen(),
    ),
    GoRoute(
      path: '/profile',
      name: ProfileScreen.name,
      builder: (context, state) => const ProfileScreen(),
    ),

  ]
);