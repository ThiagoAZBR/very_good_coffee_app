import 'package:flutter/material.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        Center(
          child: CircularProgressIndicator(),
        )
      ],
    );
  }
}
