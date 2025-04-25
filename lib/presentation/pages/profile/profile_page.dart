// profile_page.dart
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import '../../../domain/entities/user_model.dart';
import 'widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Hive.box<UserModel>('userBox').get('userBox');
    final isTablet = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const ProfileAppBar(),
      body: isTablet ? _buildTabletLayout(context, user) : _buildMobileLayout(context, user),
    );
  }

  Widget _buildMobileLayout(BuildContext context, UserModel? user) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileHeader(user: user),
          const SizedBox(height: 20),
          ProfileAccountInfoSection(user: user),
          const SizedBox(height: 20),
          ProfileSettingsInfoSection(user: user),
        ],
      ),
    );
  }

  Widget _buildTabletLayout(BuildContext context, UserModel? user) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            ProfileHeader(user: user),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ProfileAccountInfoSection(user: user),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ProfileSettingsInfoSection(user: user),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
