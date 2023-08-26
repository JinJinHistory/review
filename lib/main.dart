import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review/page/account/login.dart';
import 'package:review/providers/tab_provider.dart';
import 'package:review/tabs/completed_reviews.dart';
import 'package:review/tabs/create_review.dart';
import 'package:review/tabs/home.dart';
import 'package:review/tabs/ongoing_reviews.dart';

void main() => runApp(const StartApp());

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TabProvider()),
      ],
      child: MaterialApp(
        home: const initApp(),
        theme: ThemeData(
          primaryColor: Colors.black,
        ),
      ),
    );
  }
}

class initApp extends StatefulWidget {
  const initApp({super.key});

  @override
  State<initApp> createState() => _initAppState();
}

class _initAppState extends State<initApp> {
  bool isLoggedIn = true; // 로그인 여부 확인하는 변수 (임시로 false로 설정)
  DateTime? currentBackPressTime; // 마지막으로 뒤로가기 버튼을 누른 시간 저장

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: isLoggedIn ? const NavigationView(currentPageIndex: 0) : const LoginView(),
    );
  }

  Future<bool> _onWillPop() async {
    final now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("뒤로 가기 버튼을 한 번 더 누르시면 종료됩니다.")),
      );
      return false;
    }
    return true;
  }
}

class NavigationView extends StatefulWidget {
  final int currentPageIndex;

  const NavigationView({super.key, required this.currentPageIndex});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  late int currentPageIndex;

  @override
  void initState() {
    super.initState();
    currentPageIndex = widget.currentPageIndex;
  }

  @override
  Widget build(BuildContext context) {
    // final tabProvider = Provider.of<TabProvider>(context);

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.black,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorShape: const Border(
          top: BorderSide(width: 1.0, color: Colors.deepOrangeAccent), // 상단 border 설정
        ),
        indicatorColor: Colors.black,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: Colors.white),
            icon: Icon(Icons.home_outlined, color: Colors.white),
            label: 'Home',
            labelColor: Colors.white,
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.edit, color: Colors.white),
            icon: Icon(Icons.edit_outlined, color: Colors.white),
            label: '리뷰생성',
            labelColor: Colors.white,
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.edit_note, color: Colors.white),
            icon: Icon(Icons.edit_note_outlined, color: Colors.white),
            label: '진행중인 리뷰',
            labelColor: Colors.white,
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.fact_check, color: Colors.white),
            icon: Icon(Icons.fact_check_outlined, color: Colors.white),
            label: '완료된 리뷰',
            labelColor: Colors.white,
          ),
        ],
      ),
      // 탭 이동 시 이전 값들 유지
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0xff111111),
          child: IndexedStack(
            index: currentPageIndex,
            children: const <Widget>[
              HomeTab(),
              CreateReviewTab(),
              OngoingReviewsTab(),
              CompletedReviewsTab(),
            ],
          ),
        ),
      )
      // 탭 이동 시 이전 값들 초기화
      // body: SafeArea(
      //   child: Container(
      //     width: double.infinity,
      //     height: double.infinity,
      //     color: const Color(0xff111111),
      //     child: <Widget>[
      //       const HomeTab(),
      //       const CreateReviewTab(),
      //       const OngoingReviewsTab(),
      //       const CompletedReviewsTab()
      //     ][currentPageIndex],
      //   ),
      // ),
    );
  }
}
