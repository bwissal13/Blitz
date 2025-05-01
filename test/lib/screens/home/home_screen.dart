import 'dart:async';
import 'package:flutter/material.dart';
import '../../controllers/home_controller.dart';
import 'widgets/next_rider_card.dart';
import 'widgets/request_button.dart';
import 'widgets/request_dialog.dart';
import 'widgets/request_history_list.dart';
import 'widgets/success_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _controller = HomeController();
  Timer? _bannerTimer;

  @override
  void initState() {
    super.initState();
    _controller.init();
_controller.showNavBar.addListener(() => setState(() {}));
_controller.showSuccessBanner.addListener(() => setState(() {}));
    _controller.nextRiderTime.addListener(() => setState(() {}));
    _controller.showFullText.addListener(() => setState(() {}));
    _controller.pastRequests.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _bannerTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onMainButtonPressed() {
    _controller.showFullText.value = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      RequestDialog.show(context, (phone) {
        _controller.sendRequest(phone);
      });
    });
  }

  void _handleTap() {
    _controller.toggleNavBar();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: _handleTap,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: false,
              title: const Text(
                "Restaurant Ô'Mexico",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              iconTheme: const IconThemeData(color: Colors.black),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(1),
                child: Divider(
                  color: Colors.black12,
                  height: 1,
                  thickness: 1,
                ),
              ),
            ),
            body: Column(
              children: [
                if (_controller.showSuccessBanner.value)
                  const SuccessBanner(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 32),
                          NextRiderCard(
                            nextRiderTime: _controller.nextRiderTime.value,
                          ),
                          const SizedBox(height: 24),
                          RequestButton(
                            showFullText: _controller.showFullText.value,
                            onPressed: _onMainButtonPressed,
                          ),
                          const SizedBox(height: 24),
                          RequestHistoryList(
                            requests: _controller.pastRequests.value,
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_controller.showNavBar.value)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomNavigationBar(
              currentIndex: 1,
              selectedItemColor: const Color(0xFFFF5C00),
              unselectedItemColor: Colors.grey[500],
              onTap: (_) {},
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Accueil',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Livreurs',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Commandes',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz),
                  label: 'Compte',
                ),
              ],
            ),
          ),
      ],
    );
  }
}
