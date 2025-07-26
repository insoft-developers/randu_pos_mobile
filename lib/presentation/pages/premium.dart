import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../insoft/css/app_color.dart';
import '../../insoft/css/font_setting.dart';
import '../../insoft/css/jarak.dart';
import '../providers/cores/router/go_router_provider.dart';
import '../providers/main/user_data/user_data_provider.dart';

class Premium extends ConsumerStatefulWidget {
  // ignore: use_super_parameters
  const Premium({Key? key}) : super(key: key);

  @override
  ConsumerState<Premium> createState() => _PremiumState();
}

class _PremiumState extends ConsumerState<Premium> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              'Keluar Aplikasi...?',
              style: TextStyle(fontFamily: FontSetting.bold),
            ),
            content: const Text('Anda yakin ingin keluar dari Aplikasi...? ',
                style: TextStyle(fontFamily: FontSetting.reg)),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Tidak'),
              ),
              TextButton(
                onPressed: () async {
                  await ref.read(userDataProvider.notifier).logout();
                  ref.read(routerProvider).goNamed('login');
                },
                child: const Text('Ya'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            margin: const EdgeInsets.all(30),
            child: ListView(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              children: [
                Jarak(tinggi: 24),
                const Text('Profit Dulu Upgrade Kemudian',
                    style: TextStyle(
                        fontFamily: FontSetting.reg,
                        color: AppColor.mainColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                Jarak(tinggi: 30),
                const Text(
                    'Terima Kasih Telah Menjadi Pengguna Setia Aplikasi  Randu.',
                    style: TextStyle(
                        fontFamily: FontSetting.reg,
                        color: AppColor.mainColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                Jarak(tinggi: 10),
                Image.asset('assets/images/thank_you.png'),
                Jarak(tinggi: 30),
                const Text(
                    'Jika bisnis Anda belum menghasilkan profit (keuntungan) Anda dapat terus menggunakan aplikasi ini secara gratis tanpa biaya sepeser pun, tanpa ada batasan transaksi berapapun.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: FontSetting.reg,
                        color: AppColor.mainColor,
                        fontSize: 15,
                        fontWeight: FontWeight.normal)),
                Jarak(tinggi: 20),
                const Text(
                    'Namun, apabila bisnis Anda sudah menghasilkan keuntungan kami mengundang Anda untuk meng-upgrade ke versi premium dengan biaya hanya Rp819 per hari.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: FontSetting.reg,
                        color: AppColor.mainColor,
                        fontSize: 15,
                        fontWeight: FontWeight.normal)),
                Jarak(tinggi: 20),
                const Text(
                    'Jika Anda menjalankan bisnis nirlaba (yayasan, panti asuhan, atau organisasi) atau menggunakan Randu untuk keperluan pendidikan baik sebagai pengajar maupun siswa, silakan hubungi kami melalui menu ticketing untuk mendapatkan akses premium secara gratis.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: FontSetting.reg,
                        color: AppColor.mainColor,
                        fontSize: 15,
                        fontWeight: FontWeight.normal)),
                Jarak(tinggi: 20),
                const Text('Tim Randu, Sayangku Padamu Selalu.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: FontSetting.reg,
                        color: AppColor.mainColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                Jarak(tinggi: 30),
                ElevatedButton(
                    onPressed: () async {
                      await launchUrl(
                          Uri.parse('https://randu.co.id/chat/upgrade-premium'),
                          mode: LaunchMode.externalApplication);
                    },
                    child: const Text('UPGRADE PREMIUM SEKARANG'))
              ],
            )),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: const Text('Batal'),
      onPressed: () {
        Get.back();
      },
    );
    Widget continueButton = TextButton(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.green,
          ),
          child: const Text('Ya',
              style: TextStyle(
                color: Colors.white,
                fontFamily: FontSetting.reg,
              ))),
      onPressed: () async {
        await ref.read(userDataProvider.notifier).logout();
        ref.read(routerProvider).goNamed('login');
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text('Keluar Aplikasi',
          style: TextStyle(
            fontFamily: FontSetting.bold,
            color: Colors.green,
          )),
      content: const Text('Anda yakin ingin keluar dari aplikasi?',
          style: TextStyle(
            fontFamily: FontSetting.reg,
            fontSize: 15,
          )),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
