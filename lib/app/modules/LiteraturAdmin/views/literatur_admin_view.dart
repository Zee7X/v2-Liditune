import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/literatur_admin_controller.dart';

class LiteraturAdminView extends GetView<LiteraturAdminController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Literatur'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_book),
            onPressed: () {
              Get.toNamed(Routes.ADD_LITERATUR);
            },
          ),
        ],
        backgroundColor: const Color(0xFF240B74),
        elevation: 0,
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
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
        child: RefreshIndicator(
          onRefresh: () async {
            await controller.uploadedLiteraturesStream;
          },
          child: StreamBuilder<List<UploadedLiterature>>(
            stream: controller.uploadedLiteraturesStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error fetching data');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No data available'));
              } else {
                final uploadedLiteratures = snapshot.data!;
                return ListView.builder(
                  itemCount: uploadedLiteratures.length,
                  itemBuilder: (context, index) {
                    final literature = uploadedLiteratures[index];
                    return ListTile(
                      title: Text(literature.title),
                      subtitle: Text(literature.name),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(literature.imageUrl),
                      ),
                      trailing: IconButton(
                        icon: literature.isPlaying
                            ? Icon(Icons.stop)
                            : Icon(Icons.play_arrow),
                        onPressed: () {
                          literature.isPlaying
                              ? literature.stopAudio()
                              : literature.playAudio();
                        },
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
