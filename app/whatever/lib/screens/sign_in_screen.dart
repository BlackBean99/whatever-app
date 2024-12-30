import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_user.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? userInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                try {
                  OAuthToken token =
                      await UserApi.instance.loginWithKakaoTalk();
                  print('Kakao Login Success: ${token.accessToken}');
                  try {
                    User user = await UserApi.instance.me();
                    setState(() {
                      userInfo = user.toString();
                    });
                  } catch (error) {
                    print('Failed to get user information: $error');
                  }
                } catch (error) {
                  print('Kakao Login Failed: $error');
                }
              },
              child: const Text('Sign in with Kakao'),
            ),
            const SizedBox(height: 20),
            Text('User Info: ${userInfo ?? "Not logged in"}'),
          ],
        ),
      ),
    );
  }
}
