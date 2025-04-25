// widgets/profile_header.dart
import 'package:flutter/material.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/const/constant.dart';
import '../../../../domain/entities/user_model.dart';
import '../../../widgets/core/loading/skeleton.dart';
import '../../../widgets/core/photo/image_dialog.dart';
import '../../../widgets/core/text/custom_text.dart';

class ProfileHeader extends StatelessWidget {
  final UserModel? user;
  final VoidCallback? onEditProfile;

  const ProfileHeader({
    super.key,
    required this.user,
    this.onEditProfile,
  });

  void showLogoDialog(BuildContext context, String imageUrl, String description) {
    showDialog(
      context: context,
      builder: (context) => ImageDialogContent(
        imageUrl: imageUrl,
        description: description,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            CustomColors.primaryColor,
            CustomColors.primaryColor.withValues(alpha: 0.8),
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Stack(
            alignment: Alignment.center,
            children: [
              // Profile Picture
              _buildProfilePicture(context, isTablet),
              // Edit Button
              if (onEditProfile != null)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: _buildEditButton(),
                ),
            ],
          ),
          const SizedBox(height: 16),
          // User Info
          _buildUserInfo(isTablet),
          const SizedBox(height: 20),
          // Stats Row
        ],
      ),
    );
  }

  Widget _buildProfilePicture(BuildContext context, bool isTablet) {
    return GestureDetector(
      onTap: () {
        showLogoDialog(context, user?.profilePicture ?? noImage, 'Foto Profil');
      },
      child: Hero(
        tag: 'profile-picture',
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 3,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: user == null
              ? _buildShimmerAvatar(isTablet)
              : CircleAvatar(
            radius: isTablet ? 60 : 45,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: isTablet ? 57 : 42,
              backgroundImage: NetworkImage(user?.profilePicture ?? noImage),
              onBackgroundImageError: (_, __) {
                // Handle error loading image
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerAvatar(bool isTablet) {
    return Skeleton(
      child: CircleAvatar(
        radius: isTablet ? 60 : 45,
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget _buildEditButton() {
    return Material(
      elevation: 4,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onEditProfile,
        customBorder: const CircleBorder(),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.edit,
            size: 20,
            color: CustomColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfo(bool isTablet) {
    return Column(
      children: [
        if (user == null)
          _buildShimmerText(isTablet)
        else ...[
          CustomText(
            user?.fullname ?? '',
            style: TextStyle(
              color: Colors.white,
              fontSize: isTablet ? 28 : 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          CustomText(
            user?.roleCode ?? '',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.9),
              fontSize: isTablet ? 18 : 16,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildShimmerText(bool isTablet) {
    return Skeleton(
      child: Column(
        children: [
          Container(
            width: 150,
            height: isTablet ? 28 : 22,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 100,
            height: isTablet ? 18 : 16,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }

}
