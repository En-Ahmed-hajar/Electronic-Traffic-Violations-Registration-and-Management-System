import 'package:flutter/material.dart';
import 'package:traffic_services/core/colors.dart';
import 'package:traffic_services/features/services/presentation/pages/traffic_violations_results.dart';
import 'package:traffic_services/features/services/presentation/pages/violation_inquiry_screen.dart';

class Home extends StatelessWidget {

  const Home({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor: Acolor.backgrond,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        
        backgroundColor: Acolor.backgrond,
        leading:_buildStack( SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: const Icon(Icons.notifications_none, color: Color(0xFFA52A2A))),),
        title:  Text(
          'الرئيسية',
          style: TextStyle(
            color: Acolor.contenr,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Directionality(
          textDirection: TextDirection.rtl, // ضبط الاتجاه للكل لتجنب التكرار
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'مرحباً بك، أحمد',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'إليك ملخص سريع لحالة مركباتك والمخالفات المرورية.',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
        
                
        
                const SizedBox(height: 25),
                const Text(
                  'الخدمات السريعة',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
        
                // شبكة الخدمات
                Container(
              
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: [
                        InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ViolationInquiryScreen()),
                      ),
                      child: _buildServiceCard(
                          'استعلام عن المخالفة',
                          Icons.shield_sharp,
                          
                      
                        ),
                    ),
                      _buildStack(
                        _buildServiceCard(
                          'تجديد رخصة',
                          Icons.cached,
                        ),
                      ),_buildStack( 
                         _buildServiceCard(
                        'الإبلاغ عن حادث',
                        Icons.report_problem,
                      
                      ),),
                  
                  
                    
                    
                    _buildStack(  _buildServiceCard(
                        'دفع الرسوم',
                        Icons.payments_outlined,
                      
                      ),)
                    ],
                  ),
                ),
        
                const SizedBox(height: 25),
        
                // إحصائيات المركبات والمخالفات
                _buildStatCard(
                  'المركبات المسجلة',
                  '2',
                  Icons.directions_car_filled,
                  Acolor.contenr,
                  isAlert: true,
                    
                        const Color.fromARGB(255, 255, 255, 255),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TrafficViolationsResults()),
                  ),
                  child: _buildStatCard(
                    'مخالفات غير مسددة',
                    '15,000 ريال',
                    Icons.warning_amber_rounded,
                    Acolor.contenr,
                      
                          const Color.fromARGB(255, 255, 255, 255),
                    isAlert: true,
                  ),
                ),
        
                const SizedBox(height: 25),
                  const Text(
                'إرشادات وأخبار',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
        
                // كرت النصيحة البديل للصورة (أيقونة)
                _buildAdviceCard(),
        
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      
    
    );
  }






  Widget _buildAdviceCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.lerp(Border(bottom: BorderSide(color:Acolor.contenr, width: 5)), null, 0.1),

        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              
              color:  Acolor.contenr,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
            ),
            child: const Icon(
              Icons.directions_car,
              size: 80,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    
                    color: Acolor.newCo,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    'نصيحة سلامة',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'أهمية الفحص الدوري للمركبة',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 5),
                const Text(
                  'الفحص الدوري لمركبتك يضمن سلامتك وسلامة الآخرين على الطريق. تأكد من فحص المكابح والإطارات بانتظام.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(
    String title,
    IconData icon,
  ) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      
        border: Border.lerp(Border(

          bottom: BorderSide(color: Acolor.contenr, width: 4)), null, 0.1),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5),blurRadius: 5,offset: Offset(0, 1))]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Acolor.contenr,
            child: Icon(icon, color: Acolor.backgrond, size: 28),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color bgColor,
    Color iconColor, {
    bool isAlert = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: isAlert
            ? const Border(right: BorderSide(color:  const Color(0xFFA52A2A), width: 4))
            : null,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 5),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: bgColor,
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color:  const Color(0xFFA52A2A),
                ),
              ),
            ],
          ),
        ],
      ),
    );


  }
      Widget _buildStack( Widget title,) {
      return Stack(
        clipBehavior:
            Clip.none, // للسماح للملصق بالخروج قليلاً عن الحواف إذا لزم الأمر
        children: [
        title,
          Positioned(
            top: 2,
            left: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
              decoration: BoxDecoration(
                color: Acolor.newCo,
                borderRadius: BorderRadius.circular(8),
              ),
              child:  Text(
                'New',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      );
    }
}
