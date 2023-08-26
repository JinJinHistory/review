import 'package:flutter/material.dart';
import 'package:review/main.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.orange.withOpacity(0.3), // 투명도 설정
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.only(top: 40.0, bottom: 40.0),
              child: const Center(
                child: Text(
                  '상호명 - 테스터',
                  style: TextStyle(
                    color: Colors.orange, // 주황색 텍스트
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 15.0),
                SquareBox(icon: Icons.edit, text: '새로운 리뷰 생성'),
                SizedBox(width: 15.0),
                SquareBox(icon: Icons.edit_note, text: '진행중인 리뷰'),
                SizedBox(width: 15.0),
              ],
            ),
            const SizedBox(height: 15.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 15.0),
                SquareBox(icon: Icons.fact_check, text: '완료된 리뷰'),
                SizedBox(width: 15.0),
                SquareBox(icon: Icons.star, text: '인스타 좋아요 신청'),
                SizedBox(width: 15.0),
              ],
            ),
            const SizedBox(height: 30.0),
            // 공지사항 섹션 추가
            _buildNoticeSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildNoticeSection() {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '공지사항',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              TextButton(
                onPressed: () {
                  // 더보기 버튼 클릭 이벤트 처리
                  print('더보기 버튼 클릭');
                },
                child: const Text(
                  '더보기 >',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: notices.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => print('공지사항 상세보기 이동'),
                behavior: HitTestBehavior.opaque,
                child: Container(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text(notices[index]['title']!, style: const TextStyle(color: Colors.white)),
                        Text(notices[index]['date']!, style: const TextStyle(fontSize: 10, color: Colors.white)),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  static const List<Map<String, String>> notices = [
    {'title': '공지사항 제목 1', 'date': '2023-08-25'},
    {'title': '공지사항 제목 2', 'date': '2023-08-26'},
    {'title': '공지사항 제목 3', 'date': '2023-08-26'},
    {'title': '공지사항 제목 4', 'date': '2023-08-26'},
    {'title': '공지사항 제목 5', 'date': '2023-08-26'},
  ];

}

class SquareBox extends StatelessWidget {
  final IconData icon;
  final String text;

  const SquareBox({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 클릭 이벤트 처리
        print('Box clicked: $text');

        // // 리뷰생성 탭으로 이동
        // if (text == '새로운 리뷰 생성') {
        //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NavigationView(currentPageIndex: 1)));
        // }
      },
      child: Container(
        width: (MediaQuery.of(context).size.width / 2) - 22.5,
        height: (MediaQuery.of(context).size.width / 2) - 22.5,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
