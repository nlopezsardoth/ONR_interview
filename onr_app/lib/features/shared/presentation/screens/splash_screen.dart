import 'package:flutter/material.dart';
import 'package:onr_app/features/shared/presentation/widgets/onr_loader.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ONRLoader());
  }
}