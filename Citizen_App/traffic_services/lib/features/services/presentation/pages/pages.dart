import 'package:flutter/material.dart';
import 'package:traffic_services/core/colors.dart';
import 'package:traffic_services/features/services/presentation/pages/home_services.dart';
import 'package:traffic_services/features/services/presentation/pages/my_vehicles_page.dart';

class HomeServices extends StatefulWidget {
  const HomeServices({super.key});

  @override
  State<HomeServices> createState() => _HomeServicesState();
}

class _HomeServicesState extends State<HomeServices> {
  int currentIndex = 2;
double _lastOffset = 0;
DateTime _lastTime = DateTime.now();  bool isVisible = true;
void _handleScroll(ScrollNotification notification) {
  if (notification is ScrollUpdateNotification) {
    final currentOffset = notification.metrics.pixels;
    final currentTime = DateTime.now();

    final delta = currentOffset - _lastOffset;
    final timeDiff = currentTime.difference(_lastTime).inMilliseconds;

    if (timeDiff > 0) {
      final velocity = delta / timeDiff; // السرعة

      // 🔴 نزول سريع → اخفاء
      if (velocity > 2.0 && isVisible) {
        setState(() => isVisible = false);
      }

      // 🔵 طلوع سريع → إظهار
      else if (velocity < -0.5 && !isVisible) {
        setState(() => isVisible = true);
      }
    }

    _lastOffset = currentOffset;
    _lastTime = currentTime;
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          _handleScroll(notification);
          return false;
        },
        child: _buildPage(),
      ),

     bottomNavigationBar:SafeArea(
  child: AnimatedSlide(
    duration: const Duration(milliseconds: 250),
    offset: isVisible ? Offset.zero : const Offset(0, 1),
    child: AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: isVisible ? 1 : 0,
      child: _buildBottonNav(),
    ),
  ),
),
    );
  }

  Widget _buildBottonNav() {
    return Padding(
       padding: const EdgeInsets.only(
      left: 15,
      right: 15,
      bottom: 10, // 👈 خففها بدل 15
    ),
            child: Container(
        decoration: BoxDecoration(
          color: Acolor.contenr, 
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 10)],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: _buildBottomNavigationBar(),
        ),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      
      
      currentIndex: currentIndex,
      onTap: (index) => setState(() => currentIndex = index),
      type: BottomNavigationBarType.fixed,
      backgroundColor: Acolor.contenr,
      selectedItemColor: Acolor.backgrond,
      unselectedItemColor: const Color.fromARGB(153, 255, 255, 255),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          activeIcon: Icon(Icons.settings),
          label: "الإعدادات",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_car_outlined),
          activeIcon: Icon(Icons.directions_car),
          label: "سياراتي",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: "الرئيسية",
        ),
      ],
    );
  }

  Widget _buildPage() {
    switch (currentIndex) {
      case 0:
        return const Center(child: Text("data"));
      case 1:
        return const MyVehiclesPage();
      case 2:
        return const Home();
      default:
        return const Center(child: Text("data"));
    }
  }
}
