import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oktoast/oktoast.dart';

import '../../providers/cores/connectivity_service/check_connectivity_provider.dart';
import '../../providers/cores/connectivity_service/connectivity_service.dart';

// class ConnectivityPage extends ConsumerWidget {
//   const ConnectivityPage({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final connectivityStatusAsyncValue = ref.watch(connectivityStatusProvider);
//     return Scaffold(
//       body: connectivityStatusAsyncValue.when(
//         data: (status) {
//           if (status == ConnectivityStatus.online) {
//             return Center(child: Text('You are online'));
//           } else {
//             return Center(child: Text('You are offline'));
//           }
//         },
//         loading: () => CircularProgressIndicator(),
//         error: (error, stack) => Text('Error: $error'),
//       ),
//     );
//   }
// }

class ConnectivityPage extends ConsumerStatefulWidget {
  const ConnectivityPage({super.key});

  @override
  ConsumerState createState() => _ConnectivityPageState();
}

class _ConnectivityPageState extends ConsumerState<ConnectivityPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(checkConnectivityProvider.future).then((status) {
        if (status == ConnectivityStatus.offline) {
          showToast('No internet connection');
          context.go('/no_internet');
        } else {
          context.go('/main');
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Check Connectivity'),
      ),
    );
  }
}
