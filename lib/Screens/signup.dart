import 'package:flutter/material.dart';
import 'package:trader/Screens/dashboard.dart';

import '../Utils/customize_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  final TradrCustomizeStyle appStyle = TradrCustomizeStyle();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            TradrCustomizeStyle appStyle =
                TradrCustomizeStyle.init(constraints, orientation);
            return Scaffold(
              body: Container(
                width: appStyle.sizes.screenWidth,
                height: appStyle.sizes.screenHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/2.jpg"), fit: BoxFit.cover),
                ),
                child: Center(
                  child: Padding(
                    padding: appStyle.tradrAllScreenPadding(),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        spacing: appStyle.sizes.horizontalBlockSize * 2,
                        children: [
                          Container(
                            padding: EdgeInsets.all(
                                appStyle.sizes.horizontalBlockSize * 5),
                            decoration: BoxDecoration(
                              color: Colors.purple.shade700,
                              borderRadius: BorderRadius.circular(
                                  appStyle.sizes.textMultiplier * 2),
                            ),
                            child: appStyle.tradrIcon(
                              Icons.person,
                              sizeOfIcon: appStyle.sizes.textMultiplier * 8,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Login',
                            style: appStyle.headerStyle(
                                color: Colors.white,
                                size: appStyle.sizes.textMultiplier * 3.5),
                          ),
                          Text(
                            'user',
                            style: appStyle.subHeaderStyle(
                                color: Colors.white,
                                size: appStyle.sizes.textMultiplier * 3),
                          ),
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              contentPadding:
                                  appStyle.tradrAllScreenPadding(hor: 6),
                              hintText: 'Enter Your Email',
                              filled: true,
                              fillColor: Colors.grey.shade800,
                              hintStyle: const TextStyle(color: Colors.white70),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    appStyle.sizes.textMultiplier * 5),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                          TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              contentPadding:
                                  appStyle.tradrAllScreenPadding(hor: 6),
                              hintText: 'Password',
                              filled: true,
                              fillColor: Colors.grey.shade800,
                              hintStyle: const TextStyle(color: Colors.white70),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    appStyle.sizes.textMultiplier * 5),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                          appStyle.tradrElevatedButton(
                              widthInPercent: 100,
                              backgroundColor: Colors.purple.shade700,
                              borderRadiusOfButton: BorderRadius.circular(
                                  appStyle.sizes.textMultiplier * 5),
                              onPressed: () {
                                if (loading) return;
                                setState(() {
                                  loading = true;
                                });
                                if (emailController.text
                                            .trim()
                                            .toString()
                                            .compareTo("kajal@gmail.com") ==
                                        0 &&
                                    passwordController.text
                                            .trim()
                                            .toString()
                                            .compareTo("123456") ==
                                        0) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DashboardPage(),
                                      ));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text("Invalid email or password"),
                                      backgroundColor: Colors.redAccent,
                                    ),
                                  );
                                  setState(() {
                                    loading = false;
                                  });
                                }
                              },
                              childOfButton: Text("Log in"))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
