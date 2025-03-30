import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'config/dependency_injection.dart';
import 'config/providers/theme_provider.dart';
import 'config/router.dart';
import 'config/theme.dart';
import 'core/network/dio_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Khởi tạo các dependencies trước
  try {
    // Khởi tạo SharedPreferences
    final sharedPreferences = await SharedPreferences.getInstance();
    
    // Khởi tạo Dio client
    final dio = DioClient.getInstance();

    // Chạy ứng dụng với các providers đã được khởi tạo
    runApp(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(sharedPreferences),
          dioProvider.overrideWithValue(dio),
        ],
        child: const MyApp(),
      ),
    );
  } catch (e, stack) {
    debugPrint('Error initializing app: $e');
    debugPrint(stack.toString());    
    
    // Nếu có lỗi, vẫn chạy ứng dụng với trạng thái lỗi
    runApp(const AppErrorScreen());
  }
}

// Màn hình hiển thị khi có lỗi nghiêm trọng
class AppErrorScreen extends StatelessWidget {
  const AppErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Error',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 64),
                const SizedBox(height: 24),
                const Text(
                  'Application Error',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'There was a problem initializing the app. Please restart the application.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    // Không thể thực sự khởi động lại ứng dụng từ đây,
                    // nhưng có thể cung cấp phản hồi UX
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please manually restart the app'),
                      ),
                    );
                  },
                  child: const Text('Restart App'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Ứng dụng chính
class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    try {
      // Lấy router và theme
      final router = ref.watch(routerProvider);
      final brightness = ref.watch(currentBrightnessProvider);

      return MaterialApp.router(
        title: 'Flutter Boilerplate',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light,
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      );
    } catch (e, stack) {
      // Xử lý lỗi trong quá trình khởi tạo router
      debugPrint('Error in MyApp build: $e');
      debugPrint(stack.toString());
      
      return MaterialApp(
        title: 'Error',
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.warning_amber_rounded, color: Colors.amber, size: 48),
                const SizedBox(height: 16),
                const Text('Navigation Error'),
                const SizedBox(height: 8),
                Text(e.toString()),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Không thực sự có tác dụng khởi động lại toàn bộ ứng dụng,
                    // chỉ khởi tạo lại State
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const MyApp()),
                    );
                  },
                  child: const Text('Try Again'),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
