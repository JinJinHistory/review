import 'package:flutter/material.dart';

class CreateReviewTab extends StatefulWidget {
  const CreateReviewTab({super.key});

  @override
  State<CreateReviewTab> createState() => _CreateReviewTabState();
}

class _CreateReviewTabState extends State<CreateReviewTab> {
  @override
  void initState() {
    // TODO: implement initState
    print('create view init');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 250,
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password',
        ),
        style: TextStyle(color: Colors.white, fontSize: 16), // 입력된 텍스트 스타일 설정
      ),
    );
  }
}
