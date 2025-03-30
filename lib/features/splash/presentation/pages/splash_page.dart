import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../auth/presentation/providers/auth_provider.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    // Trigger auth check after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeAuth();
    });
  }

  Future<void> _initializeAuth() async {
    if (!_isInitialized) {
      _isInitialized = true;
      await ref.read(authProvider.notifier).checkAuth();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Watch the auth state to rebuild when it changes
    final authState = ref.watch(authProvider);
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Replace with your app logo
            const FlutterLogo(size: 100),
            const SizedBox(height: 24),
            Text(
              'Flutter Boilerplate',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              _getStatusText(authState.status),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            if (authState.status == AuthStatus.error)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Error: ${authState.errorMessage ?? "Unknown error"}',
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => _initializeAuth(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              )
            else if (authState.status == AuthStatus.loading)
              const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
  
  String _getStatusText(AuthStatus status) {
    switch (status) {
      case AuthStatus.initial:
        return 'Initializing...';
      case AuthStatus.loading:
        return 'Loading...';
      case AuthStatus.authenticated:
        return 'Authenticated!';
      case AuthStatus.unauthenticated:
        return 'Please log in';
      case AuthStatus.error:
        return 'Something went wrong';
    }
  }
}
