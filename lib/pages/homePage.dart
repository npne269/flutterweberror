import 'package:flutter/material.dart';
import '../routers/routers.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
        ),
        actions: [
          ElevatedButton(
            onPressed: () => context.navigateTo(
              AppRouteConfiguration.about(),
            ),
            child: Text('About'),
          ),
          SizedBox(
            width: 100,
          ),
        ],
      ),
      body: Center(
          child: Text(
        'Home Page',
      )),
    );
  }
}
