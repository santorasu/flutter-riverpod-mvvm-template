import 'package:flutter/material.dart';
import 'package:flutter_app_structure/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constansts/color_manger.dart';
import '../../../core/route/route_name.dart';
import '../../../main.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.profile),
        centerTitle: true,
        actions: [
          Consumer(
            builder: (context, ref, child) {
              final locale = ref.watch(localeProvider);
              return TextButton(
                onPressed: () {
                  ref.read(localeProvider.notifier).toggleLocale();
                },
                child: Text(
                  locale.languageCode == 'en' ? 'BN' : 'EN',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () {
              // Navigate to edit profile
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    // Profile Avatar
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            ColorManager.primary,
                            ColorManager.primaryLight,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: ColorManager.primary.withValues(alpha: 0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: ColorManager.whiteColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.userName,
                      style: Theme.of(context).textTheme.headlineLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.userEmail,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: ColorManager.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(),

              // Profile Menu Items
              _buildMenuItem(
                context,
                icon: Icons.person_outline,
                title: l10n.editProfile,
                onTap: () {},
              ),
              _buildMenuItem(
                context,
                icon: Icons.notifications_outlined,
                title: l10n.notifications,
                onTap: () {},
              ),
              _buildMenuItem(
                context,
                icon: Icons.security_outlined,
                title: l10n.security,
                onTap: () {},
              ),
              _buildMenuItem(
                context,
                icon: Icons.help_outline,
                title: l10n.helpSupport,
                onTap: () {},
              ),
              _buildMenuItem(
                context,
                icon: Icons.info_outline,
                title: l10n.about,
                onTap: () {},
              ),

              const SizedBox(height: 16),
              const Divider(),

              // Logout Button
              _buildMenuItem(
                context,
                icon: Icons.logout,
                title: l10n.logout,
                isDestructive: true,
                onTap: () {
                  _showLogoutDialog(context);
                },
              ),
              const SizedBox(height: 24),

              // App Version
              Text(
                l10n.appVersion,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color:
              (isDestructive ? ColorManager.errorColor : ColorManager.primary)
                  .withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: isDestructive ? ColorManager.errorColor : ColorManager.primary,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: isDestructive ? ColorManager.errorColor : null,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: isDestructive
            ? ColorManager.errorColor
            : ColorManager.textSecondary,
      ),
      onTap: onTap,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.logout),
        content: Text(l10n.logoutConfirmation),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.errorColor,
            ),
            onPressed: () {
              Navigator.pop(context);
              // Perform logout and navigate to login
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteName.loginRoute,
                (route) => false,
              );
            },
            child: Text(l10n.logout),
          ),
        ],
      ),
    );
  }
}
