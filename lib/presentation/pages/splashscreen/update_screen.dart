import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oktoast/oktoast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/const/colors.dart';
import '../../../core/const/constant.dart';
import '../../../core/misc/app_image.dart';
import 'utils.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Illustration section
              Container(
                decoration: BoxDecoration(
                  color: CustomColors.productBlue2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: getSvgImage('update_app'),
              ),

              const SizedBox(height: 40),

              // Update text section
              const Text(
                'Waktunya Memperbarui!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1D1D41),
                ),
              ),

              const SizedBox(height: 16),

              Text(
                'Kami telah menambahkan banyak fitur baru dan\nmemperbaiki beberapa bug untuk membuat\npengalaman Anda senyaman mungkin',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 40),

              // Update button
              ElevatedButton(
                onPressed: () async {
                  final Uri url = Uri.parse(linkStore);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  } else {
                    showToast('Tidak dapat membuka $url');
                    print('Tidak dapat membuka $url');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.primaryColor,
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'PERBARUI APLIKASI',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 16),
              TextButton(
                  onPressed: () async {
                    final route = await getRoute();
                    print(route);
                    if (context.mounted) {
                      context.go(route);
                    }
                  },
                  child: const Text('LEWATI',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
