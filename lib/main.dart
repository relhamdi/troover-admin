import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:troover_admin/config/app_router.dart';
import 'package:troover_admin/pages/_pages.dart';
import 'package:troover_admin/providers/_providers.dart';
import 'package:troover_admin/themes/theme.dart';
import 'package:troover_admin/utils/_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = AuthProvider();
    final UserProvider userProvider = UserProvider();
    final DomainProvider domainProvider = DomainProvider();
    final DemandProvider demandProvider = DemandProvider(
      userProvider: userProvider,
      domainProvider: domainProvider,
    );
    final ApplyDemandProvider applyDemandProvider = ApplyDemandProvider(
      userProvider: userProvider,
      demandProvider: demandProvider,
    );
    final ResumeProvider resumeProvider = ResumeProvider(
      userProvider: userProvider,
    );
    final SkillProvider skillProvider = SkillProvider(
      resumeProvider: resumeProvider,
    );
    final InterestProvider interestProvider = InterestProvider(
      resumeProvider: resumeProvider,
    );
    final ExperienceProvider experienceProvider = ExperienceProvider(
      resumeProvider: resumeProvider,
    );
    final DegreeProvider degreeProvider = DegreeProvider(
      resumeProvider: resumeProvider,
    );
    final SubscriptionProvider subscriptionProvider = SubscriptionProvider();
    final CompanyProvider companyProvider = CompanyProvider(
      userProvider: userProvider,
      subscriptionProvider: subscriptionProvider,
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => authProvider),
        ChangeNotifierProvider(create: (context) => userProvider),
        ChangeNotifierProvider(create: (context) => domainProvider),
        ChangeNotifierProvider(create: (context) => demandProvider),
        ChangeNotifierProvider(create: (context) => applyDemandProvider),
        ChangeNotifierProvider(create: (context) => resumeProvider),
        ChangeNotifierProvider(create: (context) => skillProvider),
        ChangeNotifierProvider(create: (context) => interestProvider),
        ChangeNotifierProvider(create: (context) => experienceProvider),
        ChangeNotifierProvider(create: (context) => degreeProvider),
        ChangeNotifierProvider(create: (context) => subscriptionProvider),
        ChangeNotifierProvider(create: (context) => companyProvider),
      ],
      child: MaterialApp(
        restorationScopeId: Constants.scopeID,
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        themeMode: ThemeMode.dark,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [
          Locale('en', ''), // English
          Locale('fr', ''), // French
        ],
        onGenerateTitle: (BuildContext context) =>
            AppLocalizations.of(context)!.appTitle,

        // Support for web url navigation and deep linking
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: LoginPage.routeName,
      ),
    );
  }
}
