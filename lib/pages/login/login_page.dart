import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:troover_admin/pages/_pages.dart';
import 'package:troover_admin/providers/_providers.dart';
import 'package:troover_admin/utils/_utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String routeName = '${Constants.baseRoute}login/';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    AuthProvider userProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // Logo
            Image.asset(
              'assets/images/logo/logo.png',
              width: 250,
              height: 250,
            ),
            const SizedBox(height: 20),

            // Email and Password Form
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    focusNode: _focusNode,
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.labelEmail,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.labelPassword,
                    ),
                    obscureText: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Connection Button
            ElevatedButton(
              onPressed: () async {
                String email = emailController.text.trim();
                String password = passwordController.text.trim();
                if (email.isEmpty || password.isEmpty) {
                  return;
                }

                try {
                  await userProvider.login(email, password);
                  if (userProvider.token != null) {
                    // Login successful
                    await userProvider.setUserSession(userProvider.token!);

                    // Check authorizations
                    if (userProvider.connectedUser!.userType != 'ADMIN') {
                      Toast.show('Insufficient rights', duration: 3);
                      userProvider.logout(context);
                    } else {
                      Navigator.pushNamed(context, HomePage.routeName);
                    }
                  }
                } catch (e) {
                  // Login failed
                  Toast.show(
                    AppLocalizations.of(context)!.errorIncorrectCredentials,
                    duration: 2,
                  );
                }
              },
              child: Text(AppLocalizations.of(context)!.titleAccountLogin),
            ),
          ],
        ),
      ),
    );
  }
}
