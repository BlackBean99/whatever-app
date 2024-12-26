import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatever/screens/onboarding_screen1.dart';
import 'package:whatever/screens/onboarding_screen2.dart';
import 'package:whatever/screens/onboarding_screen3.dart';
import 'controller/onboarding_controller.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => OnboardingController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthCheck(),
    );
  }
}

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  bool _isAuthorized = false;

  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    // Replace with your actual authorization token retrieval logic
    final authToken = await _getAuthToken();
    setState(() {
      _isAuthorized = authToken != null;
    });
  }

  Future<String?> _getAuthToken() async {
    // Placeholder: Replace with secure storage or other token retrieval
    await Future.delayed(const Duration(seconds: 1)); // Simulate async call
    return null; // Return null if no token is found
  }

  @override
  Widget build(BuildContext context) {
    return _isAuthorized
        ? const MyHomePage(title: 'Flutter Demo Home Page')
        : const OnboardingPage();
  }
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onboardingController = Provider.of<OnboardingController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Onboarding'),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          onboardingController.goToPage(index);
        },
        children: const [
          OnboardingScreen1(),
          OnboardingScreen2(),
          OnboardingScreen3(),
        ],
      ),
      bottomNavigationBar: Consumer<OnboardingController>(
        builder: (context, onboardingController, child) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: onboardingController.currentPage > 0
                  ? () => _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      )
                  : null,
              disabledColor: Colors.grey,
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: onboardingController.currentPage < 2
                  ? () => _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      )
                  : null,
              disabledColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
