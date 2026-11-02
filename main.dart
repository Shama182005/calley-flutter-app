import 'package:flutter/material.dart';

void main() => runApp(const CallleyApp());

const Color brandBlue = Color(0xFF0874D1);
const Color deepBlue = Color(0xFF063B63);
const Color pageBg = Color(0xFFF7F9FC);
const Color lineColor = Color(0xFFDDE3E9);

class CallleyApp extends StatelessWidget {
  const CallleyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Callley',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: pageBg,
        colorScheme: ColorScheme.fromSeed(seedColor: brandBlue),
        fontFamily: 'Roboto',
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          hintStyle: const TextStyle(color: Color(0xFF777F88), fontSize: 14),
          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: lineColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: lineColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: brandBlue, width: 1.4),
          ),
        ),
      ),
      home: const LanguageScreen(),
    );
  }
}

void showMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color(0xFF263746),
    ));
}

// Coddy-ready demo API stub. The playground supports a single main.dart file,
// but its sandbox does not reliably allow requests to external APIs.
// Replace this function with your real API calls when running locally.
Future<void> tryApi(BuildContext context, String path, {Map<String, dynamic>? body}) async {
  debugPrint('Demo API call: $path | body: $body');
  await Future<void>.delayed(const Duration(milliseconds: 150));
  if (context.mounted) {
    showMessage(context, 'Demo mode: $path action simulated.');
  }
}

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});
  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selected = 'English';
  final languages = const [
    ('English', 'Hi'),
    ('Hindi', 'नमस्ते'),
    ('Bengali', 'বাংলা'),
    ('Kannada', 'ನಮಸ್ಕಾರ'),
    ('Punjabi', 'ਸਤ ਸ੍ਰੀ ਅਕਾਲ'),
    ('Tamil', 'வணக்கம்'),
    ('Telugu', 'నమస్కారం'),
    ('French', 'Bonjour'),
    ('Spanish', 'Hola'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
              child: Column(
                children: [
                  const SizedBox(height: 6),
                  const Text('Choose Your Language',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 24),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: lineColor),
                      ),
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        itemCount: languages.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 2),
                        itemBuilder: (context, i) {
                          final item = languages[i];
                          return InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () => setState(() => selected = item.$1),
                            child: SizedBox(
                              height: 76,
                              child: Row(
                                children: [
                                  Expanded(child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(item.$1, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                                      const SizedBox(height: 3),
                                      Text(item.$2, style: const TextStyle(fontSize: 14, color: Colors.black54)),
                                    ],
                                  )),
                                  Radio<String>(
                                    value: item.$1,
                                    groupValue: selected,
                                    activeColor: const Color(0xFF171717),
                                    onChanged: (v) => setState(() => selected = v!),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  PrimaryButton(label: 'Select', onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (_) => const AuthScreen(),
                    ));
                  }),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const PrimaryButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    height: 54,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: brandBlue,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
    ),
  );
}

class BrandMark extends StatelessWidget {
  const BrandMark({super.key});
  @override
  Widget build(BuildContext context) => Column(
    children: [
      SizedBox(
        height: 44,
        child: Center(
          child: ShaderMask(
            shaderCallback: (r) => const LinearGradient(
              colors: [Color(0xFF00A7E8), Color(0xFF59B75A), Color(0xFFE83E72)],
            ).createShader(r),
            child: const Icon(Icons.all_inclusive_rounded, size: 48, color: Colors.white),
          ),
        ),
      ),
      const Text('CALLEY', style: TextStyle(fontSize: 22, letterSpacing: 2.0, color: Color(0xFF76B9D4), fontWeight: FontWeight.w300)),
      const Text('AUTOMATIC CALL DIALER', style: TextStyle(fontSize: 9, letterSpacing: .4, fontWeight: FontWeight.w600)),
    ],
  );
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSignUp = true;
  bool acceptedTerms = false;
  bool obscure = true;
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();

  @override
  void dispose() {
    name.dispose(); email.dispose(); password.dispose(); phone.dispose();
    super.dispose();
  }

  void submit() {
    if (email.text.trim().isEmpty || password.text.isEmpty ||
        (isSignUp && (name.text.trim().isEmpty || phone.text.trim().isEmpty))) {
      showMessage(context, 'Please complete all required fields.');
      return;
    }
    if (isSignUp && !acceptedTerms) {
      showMessage(context, 'Please accept the Terms and Conditions.');
      return;
    }
    tryApi(context, 'TODO_AUTH_${isSignUp ? 'SIGNUP' : 'LOGIN'}', body: isSignUp
      ? {'name': name.text.trim(), 'email': email.text.trim(), 'password': password.text, 'mobile': phone.text.trim(), 'country_code': '+91'}
      : {'email': email.text.trim(), 'password': password.text});
    if (isSignUp) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => OtpScreen(phone: phone.text.trim())));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const WelcomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(22),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 460),
              child: Container(
                padding: const EdgeInsets.fromLTRB(22, 26, 22, 22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: lineColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const BrandMark(),
                    const SizedBox(height: 28),
                    Text(isSignUp ? 'Welcome!' : 'Welcome',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 29, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 6),
                    Text(isSignUp ? 'Please register to continue' : 'Please sign-in to continue',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black54, fontSize: 14)),
                    const SizedBox(height: 22),
                    if (isSignUp) ...[
                      TextField(controller: name, textCapitalization: TextCapitalization.words,
                        decoration: const InputDecoration(hintText: 'Name', prefixIcon: Icon(Icons.person_outline))),
                      const SizedBox(height: 12),
                    ],
                    TextField(controller: email, keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(hintText: 'Email address', prefixIcon: Icon(Icons.mail_outline))),
                    const SizedBox(height: 12),
                    TextField(controller: password, obscureText: obscure,
                      decoration: InputDecoration(hintText: 'Password', prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(icon: Icon(obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                          onPressed: () => setState(() => obscure = !obscure)))),
                    if (!isSignUp)
                      Align(alignment: Alignment.centerRight, child: TextButton(
                        onPressed: () => showMessage(context, 'Forgot-password API route needs to be mapped.'),
                        child: const Text('Forgot Password?'))),
                    if (isSignUp) ...[
                      const SizedBox(height: 12),
                      TextField(controller: phone, keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(hintText: 'Mobile number', prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                          child: Text('🇮🇳  +91', style: TextStyle(fontSize: 14)),
                        ))),
                      const SizedBox(height: 10),
                      CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        controlAffinity: ListTileControlAffinity.leading,
                        value: acceptedTerms,
                        onChanged: (v) => setState(() => acceptedTerms = v ?? false),
                        title: const Text('I agree to the Terms and Conditions', style: TextStyle(fontSize: 13)),
                      ),
                    ],
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () => setState(() => isSignUp = !isSignUp),
                      child: Text(isSignUp ? 'Already have an account? Sign In' : "Don't have an account? Sign up"),
                    ),
                    const SizedBox(height: 8),
                    PrimaryButton(label: isSignUp ? 'Sign Up' : 'Sign In', onPressed: submit),
                    const SizedBox(height: 10),
                    OutlinedButton.icon(
                      onPressed: () => showMessage(context, 'Google sign-in requires OAuth configuration.'),
                      icon: const Icon(Icons.g_mobiledata, size: 28),
                      label: const Text('Continue with Google'),
                      style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OtpScreen extends StatefulWidget {
  final String phone;
  const OtpScreen({super.key, required this.phone});
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otp = List.generate(6, (_) => TextEditingController());
  @override
  void dispose() { for (final c in otp) { c.dispose(); } super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: pageBg, elevation: 0, leading: const BackButton()),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 460),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22), border: Border.all(color: lineColor)),
                child: Column(
                  children: [
                    const BrandMark(),
                    const SizedBox(height: 28),
                    const Text('Whatsapp OTP\nVerification', textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 14),
                    const Text('Please ensure that the email mentioned is valid as we have sent an OTP to your email.',
                      textAlign: TextAlign.center, style: TextStyle(color: Colors.black54, height: 1.45)),
                    const SizedBox(height: 24),
                    Row(
                      children: List.generate(6, (i) => Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: i == 5 ? 0 : 7),
                          child: TextField(
                            controller: otp[i],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            decoration: const InputDecoration(counterText: '', contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 2)),
                          ),
                        ),
                      )),
                    ),
                    const SizedBox(height: 18),
                    Text('+91 ${widget.phone}', style: const TextStyle(fontSize: 14)),
                    const SizedBox(height: 22),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text("Didn't receive OTP code? "),
                      TextButton(onPressed: () {
                        tryApi(context, 'TODO_AUTH_RESEND_OTP', body: {'mobile': widget.phone, 'country_code': '+91'});
                      }, child: const Text('Resend OTP')),
                    ]),
                    const SizedBox(height: 8),
                    PrimaryButton(label: 'Verify', onPressed: () {
                      final code = otp.map((c) => c.text).join();
                      if (code.length != 6) {
                        showMessage(context, 'Enter the 6-digit OTP.');
                        return;
                      }
                      tryApi(context, 'TODO_AUTH_VERIFY_OTP', body: {'mobile': widget.phone, 'country_code': '+91', 'otp': code});
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const WelcomeScreen()));
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: '',
      showMenu: false,
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const SizedBox(height: 12),
          const WelcomeBanner(),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: deepBlue, borderRadius: BorderRadius.circular(20)),
            child: const Text(
              'If you are here for the first time then ensure that you have uploaded the list to call from Calley Web Panel hosted on https://app.getcalley.com',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, height: 1.4, fontSize: 14),
            ),
          ),
          const SizedBox(height: 14),
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: const Color(0xFFE9F5F7),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: lineColor),
            ),
            child: const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.play_circle_fill, size: 50, color: Color(0xFFE34D37)),
              SizedBox(height: 8),
              Text('2 MINUTE', style: TextStyle(fontSize: 27, letterSpacing: 2, color: deepBlue)),
              Text('CHALLENGE', style: TextStyle(fontSize: 24, letterSpacing: 2, color: deepBlue)),
            ]),
          ),
          const SizedBox(height: 22),
          PrimaryButton(label: 'Start Calling Now', onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const DashboardScreen()));
          }),
          const SizedBox(height: 12),
          TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DashboardScreen())),
            child: const Text('Go to Dashboard')),
        ],
      ),
    );
  }
}

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({super.key});
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      gradient: const LinearGradient(colors: [Color(0xFF1187E5), Color(0xFF0864C7)]),
      borderRadius: BorderRadius.circular(18),
    ),
    child: const Row(children: [
      CircleAvatar(radius: 24, backgroundColor: Color(0xFFFFD56C), child: Icon(Icons.person, color: deepBlue, size: 30)),
      SizedBox(width: 14),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Hello Swati!', style: TextStyle(color: Colors.white, fontSize: 14)),
        SizedBox(height: 3),
        Text('Calley Personal', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
      ])),
    ]),
  );
}

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final bool showMenu;
  const AppScaffold({super.key, required this.title, required this.body, this.showMenu = true});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: pageBg,
      title: title.isEmpty ? const BrandMark() : Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
      centerTitle: title.isEmpty,
      actions: [
        if (showMenu)
          IconButton(onPressed: () => showModalBottomSheet(
            context: context, isScrollControlled: true, backgroundColor: Colors.transparent,
            builder: (_) => const ProfileMenu(),
          ), icon: const CircleAvatar(radius: 16, child: Icon(Icons.person, size: 20))),
        const SizedBox(width: 8),
      ],
    ),
    body: body,
    bottomNavigationBar: showMenu ? const BottomNav() : null,
  );
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) => AppScaffold(
    title: 'Dashboard',
    body: ListView(
      padding: const EdgeInsets.fromLTRB(18, 10, 18, 24),
      children: [
        const WelcomeBanner(),
        const SizedBox(height: 18),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(color: deepBlue, borderRadius: BorderRadius.circular(18)),
          child: const Text('LOAD NUMBER TO CALL', textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, letterSpacing: .5)),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: lineColor)),
          child: const Column(children: [
            Icon(Icons.support_agent, size: 118, color: Color(0xFF147DD1)),
            Text('Visit https://app.getcalley.com to upload numbers that you wish to call using Calley Mobile App.',
              textAlign: TextAlign.center, style: TextStyle(height: 1.5)),
          ]),
        ),
        const SizedBox(height: 16),
        PrimaryButton(label: 'Start Calling Now', onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TestListScreen()))),
        const SizedBox(height: 18),
        Row(children: [
          Expanded(child: _statCard('Pending', '28', const Color(0xFFF0A72D))),
          const SizedBox(width: 8),
          Expanded(child: _statCard('Done', '22', const Color(0xFF4BAF6B))),
          const SizedBox(width: 8),
          Expanded(child: _statCard('Schedule', '09', const Color(0xFF6576D8))),
        ]),
        const SizedBox(height: 20),
        OutlinedButton.icon(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen())),
          icon: const Icon(Icons.settings_outlined), label: const Text('Settings'),
        ),
      ],
    ),
  );
}

Widget _statCard(String label, String value, Color color) => Container(
  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: lineColor)),
  child: Column(children: [
    Text(value, style: TextStyle(color: color, fontSize: 23, fontWeight: FontWeight.w700)),
    const SizedBox(height: 4),
    Text(label, style: const TextStyle(fontSize: 12)),
    const Text('Calls', style: TextStyle(fontSize: 11, color: Colors.black54)),
  ]),
);

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) => AppScaffold(
    title: 'Setting',
    body: ListView(
      padding: const EdgeInsets.all(18),
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF0753A8), Color(0xFF0C7FE0)]), borderRadius: BorderRadius.circular(16)),
          child: const Row(children: [
            CircleAvatar(backgroundColor: Color(0xFFFFD56C), child: Icon(Icons.person, color: deepBlue)),
            SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Hello Swati', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
              SizedBox(height: 4),
              Text('swati@example.com', style: TextStyle(color: Colors.white70, fontSize: 12)),
              Text('Personal Account', style: TextStyle(color: Colors.white70, fontSize: 12)),
            ])),
          ]),
        ),
        const SizedBox(height: 18),
        const _SectionLabel('PROFILE SETTINGS'),
        _settingTile(context, Icons.language, 'App Language', 'Select app language', () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LanguageScreen()))),
        _settingTile(context, Icons.lock_outline, 'Change Password', 'Update your password', () => showMessage(context, 'Change-password API route needs mapping.')),
        const SizedBox(height: 16),
        const _SectionLabel('CALLING LISTS'),
        _settingTile(context, Icons.list_alt, 'Select Calling List', 'Refresh your lists', () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TestListScreen()))),
        _settingTile(context, Icons.fact_check_outlined, 'Test List', 'View calling statistics', () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TestListScreen()))),
      ],
    ),
  );
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 8, left: 4),
    child: Text(text, style: const TextStyle(fontSize: 11, color: Colors.black54, letterSpacing: .7)),
  );
}

Widget _settingTile(BuildContext context, IconData icon, String title, String subtitle, VoidCallback onTap) =>
  Card(
    color: Colors.white,
    elevation: 0,
    margin: const EdgeInsets.only(bottom: 2),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: const BorderSide(color: lineColor)),
    child: ListTile(
      leading: Icon(icon, color: deepBlue),
      title: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    ),
  );

class TestListScreen extends StatelessWidget {
  const TestListScreen({super.key});
  @override
  Widget build(BuildContext context) => AppScaffold(
    title: 'Test List',
    body: ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const Text('50 CALLS', textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, color: brandBlue, fontWeight: FontWeight.w700)),
        const SizedBox(height: 20),
        Container(
          height: 210,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: lineColor)),
          child: const Center(child: SizedBox(
            width: 150, height: 150,
            child: CircularProgressIndicator(
              value: .72, strokeWidth: 24,
              backgroundColor: Color(0xFFF0A72D),
              color: brandBlue,
            ),
          )),
        ),
        const SizedBox(height: 18),
        Row(children: [
          Expanded(child: _statCard('Pending', '28', const Color(0xFFF0A72D))),
          const SizedBox(width: 8),
          Expanded(child: _statCard('Done', '22', const Color(0xFF4BAF6B))),
          const SizedBox(width: 8),
          Expanded(child: _statCard('Schedule', '09', const Color(0xFF6576D8))),
        ]),
        const SizedBox(height: 20),
        PrimaryButton(label: 'Start Calling Now', onPressed: () => showMessage(context, 'Calling requires the calling-list API and phone permissions.')),
        const SizedBox(height: 16),
        _settingTile(context, Icons.refresh, 'Refresh Test List', 'Reload call data', () {
          tryApi(context, 'TODO_CALLING_LISTS');
        }),
      ],
    ),
  );
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});
  @override
  Widget build(BuildContext context) => SafeArea(
    child: Container(
      margin: const EdgeInsets.fromLTRB(12, 80, 12, 12),
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: brandBlue, borderRadius: BorderRadius.circular(14)),
            child: const Row(children: [
              CircleAvatar(backgroundColor: Color(0xFFFFD56C), child: Icon(Icons.person, color: deepBlue)),
              SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Swati · Personal', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                Text('swati@example.com', style: TextStyle(color: Colors.white70, fontSize: 12)),
              ])),
            ]),
          ),
          const SizedBox(height: 10),
          _menuTile(context, Icons.school_outlined, 'Getting Started', () => Navigator.pop(context)),
          _menuTile(context, Icons.sync, 'Sync Data', () { Navigator.pop(context); showMessage(context, 'Sync API route needs mapping.'); }),
          _menuTile(context, Icons.sports_esports_outlined, 'Gamification', () => Navigator.pop(context)),
          _menuTile(context, Icons.headset_mic_outlined, 'Send Logs', () => Navigator.pop(context)),
          _menuTile(context, Icons.settings_outlined, 'Settings', () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen()));
          }),
          _menuTile(context, Icons.help_outline, 'Help?', () => Navigator.pop(context)),
          _menuTile(context, Icons.person_off_outlined, 'Cancel Subscription', () => Navigator.pop(context)),
          const Divider(),
          const Padding(
            padding: EdgeInsets.only(left: 12, top: 4, bottom: 4),
            child: Text('APP INFO', style: TextStyle(fontSize: 11, color: Colors.black54, letterSpacing: .7)),
          ),
          _menuTile(context, Icons.info_outline, 'About Us', () => Navigator.pop(context)),
          _menuTile(context, Icons.privacy_tip_outlined, 'Privacy Policy', () => Navigator.pop(context)),
          _menuTile(context, Icons.numbers, 'Version 1.0.52', () => Navigator.pop(context)),
          _menuTile(context, Icons.share_outlined, 'Share App', () => Navigator.pop(context)),
          _menuTile(context, Icons.logout, 'Logout', () {
            Navigator.pop(context);
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const LanguageScreen()), (_) => false);
          }),
        ],
      ),
    ),
  );
}

Widget _menuTile(BuildContext context, IconData icon, String label, VoidCallback onTap) => ListTile(
  dense: true,
  leading: Icon(icon, size: 21, color: const Color(0xFF35495A)),
  title: Text(label, style: const TextStyle(fontSize: 14)),
  onTap: onTap,
);

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});
  @override
  Widget build(BuildContext context) => BottomAppBar(
    color: Colors.white,
    elevation: 8,
    child: SizedBox(
      height: 52,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        IconButton(tooltip: 'Home', onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const DashboardScreen())), icon: const Icon(Icons.home_outlined)),
        IconButton(tooltip: 'Test list', onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TestListScreen())), icon: const Icon(Icons.fact_check_outlined)),
        Container(
          width: 48, height: 42,
          decoration: BoxDecoration(color: brandBlue, borderRadius: BorderRadius.circular(14)),
          child: IconButton(tooltip: 'Start calling', onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TestListScreen())), icon: const Icon(Icons.send_rounded, color: Colors.white)),
        ),
        IconButton(tooltip: 'Settings', onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen())), icon: const Icon(Icons.settings_outlined)),
        IconButton(tooltip: 'Profile', onPressed: () => showModalBottomSheet(context: context, isScrollControlled: true, backgroundColor: Colors.transparent, builder: (_) => const ProfileMenu()), icon: const Icon(Icons.person_outline)),
      ]),
    ),
  );
}
