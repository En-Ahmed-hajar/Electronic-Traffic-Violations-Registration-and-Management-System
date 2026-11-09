import 'package:flutter/material.dart';

class TrafficViolationsResults extends StatelessWidget {
  const TrafficViolationsResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'مرور اليمن',
            style: TextStyle(color: Color(0xFF8B0000), fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        
          
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'نتائج البحث',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'اللوحة رقم: أ ب ج 1234',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 25),
      
                // كرت إجمالي المخالفات
                _buildTotalSummaryCard(),
      
                const SizedBox(height: 30),
                const Text(
                  'التفاصيل',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
      
                // قائمة المخالفات
                _buildViolationDetailCard(
                  title: 'تجاوز السرعة المحددة',
                  amount: '15,000',
                  date: '12 أكتوبر 2023, 14:30',
                  location: 'صنعاء، شارع الستين الجنوبي',
                  icon: Icons.speed,
                ),
                _buildViolationDetailCard(
                  title: 'وقوف خاطئ',
                  amount: '10,000',
                  date: '05 سبتمبر 2023, 09:15',
                  location: 'عدن، خور مكسر',
                  icon: Icons.directions_car_filled_outlined,
                ),
                _buildViolationDetailCard(
                  title: 'تجاوز الإشارة الحمراء',
                  amount: '20,000',
                  date: '22 أغسطس 2023, 18:45',
                  location: 'تعز، جولة المسبح',
                  icon: Icons.traffic_outlined,
                ),
              ],
            ),
          ),
        ),
      
      ),
    );
  }

  Widget _buildTotalSummaryCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
        border: const Border(right: BorderSide(color: Color(0xFF8B0000), width: 5)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.warning_amber_rounded, color: Colors.red, size: 18),
                      SizedBox(width: 5),
                      Text('3 مخالفات', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const Text('إجمالي المخالفات غير المدفوعة', style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text('45,000', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                SizedBox(width: 5),
                Text('ر.ي', style: TextStyle(fontSize: 18, color: Colors.black87)),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.payments_outlined, color: Colors.white),
                label: const Text('دفع الكل الآن', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B0000),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildViolationDetailCard({
    required String title,
    required String amount,
    required String date,
    required String location,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
        border: const Border(right: BorderSide(color: Color(0xFF8B0000), width: 4)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(amount, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF8B0000))),
                        const SizedBox(width: 4),
                        const Text('ر.ي', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            const Text('غير مدفوعة', style: TextStyle(color: Colors.red, fontSize: 12)),
                          ],
                        ),
                        const SizedBox(width: 12),
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade100,
                          child: Icon(icon, color: const Color(0xFF8B0000)),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FA),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      _buildInfoRow(Icons.calendar_today_outlined, date),
                      const SizedBox(height: 8),
                      _buildInfoRow(Icons.location_on_outlined, location),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Row(
              children: [
                Expanded(
                  child: Stack(
        clipBehavior:
            Clip.none, // للسماح للملصق بالخروج قليلاً عن الحواف إذا لزم الأمر
        children: [
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.grey.shade100,
                            side: BorderSide.none,
                          ),
                          
                          child: const Text('التفاصيل', style: TextStyle(color: Color(0xFF8B0000))),
                        ),
          ),
          Positioned(
            top: 5,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.9),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                'قريباً',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8B0000),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('دفع', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: const TextStyle(color: Colors.grey, fontSize: 13))),
      ],
    );
  }
}