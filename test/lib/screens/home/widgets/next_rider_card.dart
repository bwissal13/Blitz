import 'package:flutter/material.dart';

class NextRiderCard extends StatelessWidget {
  final String nextRiderTime;

  const NextRiderCard({
    Key? key,
    required this.nextRiderTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        const Text(
          'Prochain Livreur peut arriver dans',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          nextRiderTime,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}