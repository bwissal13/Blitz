import 'package:flutter/material.dart';

class SuccessBanner extends StatelessWidget {
  const SuccessBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFD9FBE0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Text(
          'Votre demande a été acceptée',
          style: TextStyle(
            color: Color(0xFF09804C),
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}