import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vortex/core/config/firebase_options.dart';

import 'package:vortex/core/constants/app_constants.dart';
import 'package:vortex/core/constants/user_status_constants.dart';
import 'package:vortex/core/themes/app_theme.dart';
import 'package:vortex/features/auth/data/repositories/auth_repository.dart';
import 'package:vortex/features/auth/data/services/auth_service.dart';
import 'package:vortex/features/auth/domain/usecases/forgot_password.dart';
import 'package:vortex/features/auth/domain/usecases/login.dart';
import 'package:vortex/features/auth/domain/usecases/logout.dart';
import 'package:vortex/features/auth/domain/usecases/register.dart';
import 'package:vortex/features/auth/domain/usecases/remove_account.dart';
import 'package:vortex/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:vortex/features/auth/presentation/screens/login_screen.dart';
import 'package:vortex/features/auth/presentation/screens/splash_screen.dart';
import 'package:vortex/features/chat/presentation/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create:
              (context) => AuthRepository(authService: FirebaseAuthService()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              final AuthRepository authRepository = context.read<AuthRepository>();
              return AuthBloc(
                login: Login(authRepository),
                register: Register(authRepository),
                logout: Logout(authRepository),
                forgotPassword: ForgotPassword(authRepository),
                removeAccount: RemoveAccount(authRepository),
              );
            },
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: AppTheme.appTheme,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      context.read<AuthRepository>().updateStatus(UserStatus.offline);
    } else if (state == AppLifecycleState.resumed) {
      context.read<AuthRepository>().updateStatus(UserStatus.online);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitial) {
          return const SplashScreen();
        } else if (state is AuthAuthenticated) {
          return const HomeScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
