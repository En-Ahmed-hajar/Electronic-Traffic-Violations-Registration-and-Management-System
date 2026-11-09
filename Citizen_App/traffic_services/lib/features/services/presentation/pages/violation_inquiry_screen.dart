import 'package:flutter/material.dart';
import 'package:traffic_services/core/colors.dart';

class ViolationInquiryScreen extends StatefulWidget {
  const ViolationInquiryScreen({super.key});

  @override
  State<ViolationInquiryScreen> createState() => _ViolationInquiryScreenState();
}

class _ViolationInquiryScreenState extends State<ViolationInquiryScreen> {
  String selectedType = 'خصوصي';

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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Icon(Icons.shield_outlined, size: 50, color: Color(0xFF8B0000)),
              const SizedBox(height: 15),
              const Text(
                'استعلام عن المخالفات',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'الرجاء إدخال تفاصيل اللوحة المعدنية بدقة للتحقق من المخالفات المرورية المسجلة على المركبة.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
              ),
              const SizedBox(height: 30),
              
              // كرت النموذج
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
                  border: const Border(top: BorderSide(color: Color(0xFF8B0000), width: 4)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('نوع اللوحة', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    
                    // القائمة المنسدلة
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                                                      color:  selectedType=='خصوصي'? const Color.fromARGB(255, 0, 115, 209):selectedType=='أجرة'? const Color.fromARGB(255, 255, 191, 0):Colors.red,

                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedType,
                          isExpanded: true,
                          items: <String>['خصوصي', 'أجرة', 'تجاري']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedType = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    const Text('رقم اللوحة', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    
                    // حقل رقم اللوحة بتصميم خاص
                    Container(
                      decoration: BoxDecoration(
                                                      color:  selectedType=='خصوصي'? const Color.fromARGB(255, 0, 115, 209):selectedType=='أجرة'? const Color.fromARGB(255, 255, 191, 0):Colors.red,

                        border: Border.all(color: const Color(0xFF455A64), width: 1.5),
                      ),
                      child: Row(
                        children: [
                        
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: 10, color:  const Color(0xFF8B0000)),
                              decoration: InputDecoration(
                                hintText: 'رقم المحافظه',
                                hintStyle: const TextStyle(color: Color.fromARGB(69, 0, 0, 0), fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 10),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width /5,
                            child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                            decoration:  BoxDecoration(
                              color:  selectedType=='خصوصي'? const Color.fromARGB(255, 0, 115, 209):selectedType=='أجرة'? const Color.fromARGB(255, 255, 191, 0):Colors.red,
                              border: Border(right: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 1.5)),
                            ),
                              child: TextField(
                                textAlign: TextAlign.center,
                                maxLength: 2,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold,  color:  Colors.black),
                                decoration: InputDecoration(
                                  
                                  counterText: '',
                                  hintText: 'رقم المحافظه', 
                                  hintStyle: const TextStyle(color: Color.fromARGB(69, 0, 0, 0), fontSize: 12, fontWeight: FontWeight.bold),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                ),
                              ),
                            ),
                          ),
                        
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('أدخل الأرقام فقط من اليسار لليمين.', style: TextStyle(color: Colors.grey, fontSize: 11)),
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // زر البحث
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.search, color: Colors.white),
                        label: const Text('بحث عن المخالفات', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF8B0000),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      
      ),
    );
  }
}