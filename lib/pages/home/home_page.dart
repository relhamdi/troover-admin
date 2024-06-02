import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troover_admin/providers/_providers.dart';
import 'package:troover_admin/utils/_utils.dart';
import 'package:troover_admin/widgets/_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  static const String routeName = '${Constants.baseRoute}home/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _clearUserSession(BuildContext context, AuthProvider userProvider) {
    userProvider.logout(context);
    print('User session cleared');
    Navigator.pushReplacementNamed(context, Constants.baseRoute);
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<AuthProvider>(context);
    final List<GenericProvider> providers = [
      Provider.of<UserProvider>(context),
      Provider.of<DomainProvider>(context),
      Provider.of<DemandProvider>(context),
      Provider.of<ApplyDemandProvider>(context),
      Provider.of<ResumeProvider>(context),
      Provider.of<SkillProvider>(context),
      Provider.of<InterestProvider>(context),
      Provider.of<ExperienceProvider>(context),
      Provider.of<DegreeProvider>(context),
      Provider.of<SubscriptionProvider>(context),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove back button
        title: Center(
          child: Text(
            'Admin Dashboard - ${userProvider.connectedUser?.email ?? ""}',
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => _clearUserSession(context, userProvider),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: providers.length,
        itemBuilder: (context, index) {
          return ProviderTile(provider: providers[index]);
        },
      ),
    );
  }
}
