import 'package:flutter/material.dart';
import 'package:testweb1/routers/routers.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text(
          'About Page',
        ),
        actions: [
          ElevatedButton(
            onPressed: () => context.navigateTo(
              AppRouteConfiguration.home(),
            ),
            child: Text('Home'),
          ),
          SizedBox(
            width: 100,
          ),
        ],
      ),
      body: Center(child: Text('About Page')),
    );
  }
}
