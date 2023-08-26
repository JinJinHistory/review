import 'package:flutter/material.dart';

class CreateReviewTab extends StatefulWidget {
  const CreateReviewTab({super.key});

  @override
  State<CreateReviewTab> createState() => _CreateReviewTabState();
}

class _CreateReviewTabState extends State<CreateReviewTab> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('create_review', style: TextStyle(color: Colors.white)),
    );
  }
}
