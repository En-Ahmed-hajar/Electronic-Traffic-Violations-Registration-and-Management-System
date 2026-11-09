import 'package:flutter/material.dart';
import 'package:traffic_services/core/colors.dart';

class MyVehiclesPage extends StatelessWidget {
  const MyVehiclesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          backgroundColor: Colors.white,

          title:  Text(
            " مركباتي",
            style: TextStyle(
              color: Acolor.contenr,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "مركباتي",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                "إدارة مركباتك المسجلة والاستعلام عن المخالفات",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // زر إضافة مركبة جديدة
              const SizedBox(height: 25),

              // قائمة السيارات
              const VehicleCard(
                modelName: "تويوتا كامري",
                year: "٢٠٢٢",
                plateNumber: "١٢٣٤٥",
                plateLetter: "أ",
                hasViolations: false,
              ),
              const SizedBox(height: 15),
              const VehicleCard(
                modelName: "هيونداي إلنترا",
                year: "٢٠١٩",
                plateNumber: "٩٨٧٦٥",
                plateLetter: "ب",
                hasViolations: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VehicleCard extends StatelessWidget {
  final String modelName, year, plateNumber, plateLetter;
  final bool hasViolations;

  const VehicleCard({
    super.key,
    required this.modelName,
    required this.year,
    required this.plateNumber,
    required this.plateLetter,
    this.hasViolations = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: const Color.fromARGB(136, 0, 0, 0), blurRadius: 4)],
        border:  Border(right: BorderSide(color: Acolor.contenr, width: 5))
          
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (hasViolations)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.warning_amber_rounded,
                            color: Colors.red,
                            size: 16,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "مخالفات غير مسددة",
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  Text(
                    modelName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "الموديل: $year",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: Colors.blueGrey.shade50,
                child: const Icon(Icons.directions_car, color: Colors.blueGrey),
              ),
            ],
          ),
          const SizedBox(height: 15),

          // شكل لوحة السيارة
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Text(
                        plateNumber,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const VerticalDivider(color: Colors.blueGrey, thickness: 1),
                  Expanded(
                    child: Center(
                      child: Text(
                        plateLetter,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  const VerticalDivider(color: Colors.blueGrey, thickness: 1),
                  const Expanded(
                    child: Column(
                      children: [
                        Text("اليمن", style: TextStyle(fontSize: 10)),
                        Text("YEM", style: TextStyle(fontSize: 10)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 30),

          // الجزء السفلي من الكرت
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              hasViolations
                  ? Container()
                  : const Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                          size: 18,
                        ),

                        Text(
                          "لا توجد مخالفات نشطة",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
              hasViolations
                  ? TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back,
                        size: 18,
                        color: Acolor.contenr,
                      ),
                      label:  Text(
                        "التحقق من المخالفات",
                        style: TextStyle(color: Acolor.contenr),
                      ),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
