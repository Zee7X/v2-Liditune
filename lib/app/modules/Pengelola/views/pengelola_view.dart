import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:literasi_digital_tuna_netra/app/routes/app_pages.dart';

import '../controllers/pengelola_controller.dart';

class PengelolaView extends GetView<PengelolaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Pengelola'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_2_outlined),
            onPressed: () {
              Get.toNamed(Routes.ADD_PENGELOLA);
            },
          ),
        ],
        backgroundColor: const Color(0xFF240B74),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF240B74),
              const Color(0xFF0A0B0D),
            ],
          ),
        ),
        child: Obx(
          () {
            if (controller.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (controller.pengelolaList.isEmpty) {
              return Center(
                child: Text('Tidak ada data pengelola'),
              );
            }

            return ListView.builder(
              itemCount: controller.pengelolaList.length,
              itemBuilder: (context, index) {
                Pengelola pengelola = controller.pengelolaList[index];
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: 337,
                    height: 149,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipOval(
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: pengelola.profileImg.isNotEmpty
                                  ? NetworkImage(pengelola.profileImg)
                                  : null,
                              child: pengelola.profileImg.isNotEmpty
                                  ? null
                                  : Text(
                                      pengelola.getInitials(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 32),
                                    ),
                              backgroundColor: Color(0XFFFF820E),
                            ),
                          ),
                        ),
                        Container(
                          height: Get.height / 8,
                          width: Get.width / 2.2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                pengelola.nama,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: pengelola.email,
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Text(pengelola.no),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(0XFF15D863),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                  onPressed: () async {
                                    final updatedPengelola =
                                        await getPengelolaData(
                                            pengelola.documentId);
                                    if (updatedPengelola != null) {
                                      Get.toNamed(
                                        Routes.EDIT_PROFILE,
                                        arguments: updatedPengelola,
                                      );
                                    } else {
                                      print('Tidak Ada Data');
                                    }
                                  },
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(0XFFFF3589),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.delete, color: Colors.white),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text('Konfirmasi Hapus'),
                                        content: Text(
                                            'Yakin ingin menghapus pengelola?'),
                                        actions: [
                                          TextButton(
                                            child: Text('Batal'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          TextButton(
                                            child: Text('Hapus'),
                                            onPressed: () {
                                              controller.deletePengelola(
                                                  pengelola.documentId);
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
