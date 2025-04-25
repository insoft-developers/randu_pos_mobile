import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oktoast/oktoast.dart';

import '../../providers/cores/connectivity_service/check_connectivity_provider.dart';
import '../../providers/cores/connectivity_service/connectivity_service.dart';

class NoInternetPage extends StatelessWidget {
  final VoidCallback onRetry;

  const NoInternetPage({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('No Internet Connection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.signal_wifi_off,
              size: 100,
              color: Colors.red,
            ),
            const SizedBox(height: 20),
            const Text(
              'No Internet Connection',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Please check your internet connection and try again.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Consumer(builder: (context, ref, child) {
              return ElevatedButton(
                onPressed: () {
                  ref.read(checkConnectivityProvider.future).then((status) {
                    if (status == ConnectivityStatus.offline) {
                      showToast('No internet connection');
                    } else {
                      showToast('Your internet connection is working');
                      context.go('/main');
                    }
                  });
                },
                child: const Text('Retry'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
