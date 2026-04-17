import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const SupreApp());
}

class SupreApp extends StatelessWidget {
  const SupreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supre',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF28D16),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFEEF0F4),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF1C2546),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Color(0xFF1C2546),
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Gilroy',
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF28D16),
            foregroundColor: const Color(0xFF1C2546),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFF28D16), width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
        cardTheme: CardTheme(
          elevation: 0,
          color: Colors.white,
          shadowColor: Colors.black.withOpacity(0.08),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  final List<Map<String, String>> _faqs = [
    {
      'question': '¿Cómo realizo el pago de mi cuota?',
      'answer': 'Para pagar tu cuota, ingresa a la pantalla de inicio y selecciona el crédito que deseas pagar. Luego, presiona el botón "Pagar cuota actual" y selecciona tu método de pago preferido (PSE o tarjeta).',
    },
    {
      'question': '¿Cuáles son los métodos de pago disponibles?',
      'answer': 'Actualmente aceptamos pagos a través de PSE (Pagos Seguros en Línea) con tu banco colombiano, y pagos con tarjeta de crédito y débito.',
    },
    {
      'question': '¿Puedo pagar varias cuotas a la vez?',
      'answer': 'Sí, puedes pagar varias cuotas por adelantado. En la pantalla de detalle del crédito, selecciona las cuotas que deseas pagar y procede con el pago.',
    },
    {
      'question': '¿Qué pasa si pago después de la fecha de vencimiento?',
      'answer': 'Si pagas después de la fecha de vencimiento, se aplicarán intereses de mora según las condiciones de tu crédito. Te recomendamos pagar antes de la fecha límite para evitar cargos adicionales.',
    },
    {
      'question': '¿Cómo descargo mi comprobante de pago?',
      'answer': 'Ingresa al historial de pagos y selecciona el pago del cual deseas el comprobante. Encontrarás un botón de descarga para obtener tu comprobante en formato PDF.',
    },
    {
      'question': '¿Puedo cambiar mi fecha de pago?',
      'answer': 'Para modificar tu fecha de pago, comunícate con nuestro equipo de atención al cliente a través de los canales de contacto disponibles en la aplicación.',
    },
    {
      'question': '¿Qué hago si tengo un problema con mi pago?',
      'answer': 'Si experimentas algún problema con tu pago, comunícate con nuestro equipo de soporte a través del correo soporte@supre.co o llama a nuestra línea de atención.',
    },
    {
      'question': '¿Está mi información segura?',
      'answer': 'Sí, en Supre usamos los más altos estándares de seguridad para proteger tu información personal y financiera. Todos los pagos son procesados de forma segura.',
    },
  ];

  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Centro de ayuda'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF1C2546),
                  const Color(0xFF1C2546).withAlpha(230),
                ],
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(26),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.help_outline,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  '¿Cómo podemos ayudarte?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Encuentra respuestas a las preguntas más frecuentes',
                  style: TextStyle(
                    color: Colors.white.withAlpha(204),
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
            child: Row(
              children: [
                const Text(
                  'Preguntas frecuentes',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  '${_faqs.length} preguntas',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _faqs.length,
              itemBuilder: (context, index) {
                final faq = _faqs[index];
                final isExpanded = _expandedIndex == index;
                
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 8),
                  child: InkWell(
                    onTap: () => setState(() {
                      _expandedIndex = isExpanded ? null : index;
                    }),
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  faq['question']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              AnimatedRotation(
                                turns: isExpanded ? 0.5 : 0,
                                duration: const Duration(milliseconds: 200),
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                          if (isExpanded) ...[
                            const SizedBox(height: 12),
                            Container(
                              width: double.infinity,
                              height: 1,
                              color: Colors.grey.shade200,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              faq['answer']!,
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 13,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(13),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                const Text(
                  '¿No encontraste lo que buscabas?',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Comunícate con nuestro equipo de soporte',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.email_outlined, size: 18),
                        label: const Text('Correo'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF1C2546),
                          side: const BorderSide(color: Color(0xFF1C2546)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.phone_outlined, size: 18),
                        label: const Text('Llamar'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca de'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFF28D16),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.two_wheeler,
                color: Colors.white,
                size: 50,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Supre',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C2546),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green.withAlpha(26),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Versión 1.0.0',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(13),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.two_wheeler,
                    color: Color(0xFFF28D16),
                    size: 40,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Financiera especializada en motos',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C2546),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Facilitamos el sueño de tener tu propia moto con planes de financiamiento flexibles y accesibles en Colombia.',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 13,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildInfoSection(
              'Información de la app',
              [
                _buildInfoRow(Icons.apps_outlined, 'Versión', '1.0.0'),
                _buildInfoRow(Icons.calendar_today_outlined, 'Última actualización', 'Marzo 2026'),
                _buildInfoRow(Icons.code_outlined, 'Desarrollador', 'Supre Tech'),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoSection(
              'Contacto',
              [
                _buildInfoRow(Icons.language_outlined, 'Sitio web', 'www.supre.co'),
                _buildInfoRow(Icons.email_outlined, 'Correo', 'soporte@supre.co'),
                _buildInfoRow(Icons.phone_outlined, 'Teléfono', '01 8000 123 456'),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoSection(
              'Legal',
              [
                _buildInfoRow(Icons.description_outlined, 'Términos y condiciones', 'Ver más'),
                _buildInfoRow(Icons.privacy_tip_outlined, 'Política de privacidad', 'Ver más'),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              '© 2026 Supre. Todos los derechos reservados.',
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Hecho con ❤️ en Colombia 🇨🇴',
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 11,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(13),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1C2546),
            ),
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey.shade500),
          const SizedBox(width: 12),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 13,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              Color(0xFF1C2546),
              Color(0xFF1C2546),
              Color(0xFF2D3A6B),
              Color(0xFFB8622A),
            ],
            stops: [0.0, 0.6, 0.85, 1.0],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Image(
                    image: AssetImage('assets/Logo fondo oscuro.png'),
                    height: 64,
                  ),
                ),
                const SizedBox(height: 40),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 60,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5,
                      height: 1.1,
                    ),
                    children: const [
                      TextSpan(text: 'Crecer ', style: TextStyle(color: Color(0xFFF28D16))),
                      TextSpan(text: 'para ayudar a ', style: TextStyle(color: Colors.white)),
                      TextSpan(text: 'crecer', style: TextStyle(color: Color(0xFFF28D16))),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 72,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF28D16),
                      foregroundColor: const Color(0xFF1C2546),
                      elevation: 10,
                      shadowColor: const Color(0xFFF28D16).withOpacity(0.6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  height: 72,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegisterScreen()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.white.withOpacity(0.15),
                      side: BorderSide(color: Colors.white.withOpacity(0.6), width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Crear mi cuenta',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFF28D16)),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const WelcomeScreen()),
            );
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    'assets/Logo fondo claro.png',
                    height: 71,
                  ),
                ),
                const SizedBox(height: 48),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Correo o identificación',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa tu correo o identificación';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: const Color(0xFFF28D16),
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa tu contraseña';
                    }
                    if (value.length < 4) {
                      return 'La contraseña debe tener al menos 4 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                      );
                    },
                    child: const Text(
                      '¿Olvidaste tu contraseña?',
                      style: TextStyle(color: Color(0xFFF28D16)),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text('Iniciar sesión'),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('¿Aún no tienes cuenta? '),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterScreen()),
                        );
                      },
                      child: const Text(
                        'Crea una aquí',
                        style: TextStyle(
                          color: Color(0xFFF28D16),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum ToastType { success, error, warning, info }

void showToast(BuildContext context, String message, {ToastType type = ToastType.info}) {
  final colors = {
    ToastType.success: const Color(0xFF2E7D32),
    ToastType.error:   const Color(0xFFC62828),
    ToastType.warning: const Color(0xFFF28D16),
    ToastType.info:    const Color(0xFF1565C0),
  };
  final icons = {
    ToastType.success: Icons.check_circle_outline,
    ToastType.error:   Icons.error_outline,
    ToastType.warning: Icons.warning_amber_rounded,
    ToastType.info:    Icons.info_outline,
  };
  final overlay = Overlay.of(context);
  late OverlayEntry entry;
  entry = OverlayEntry(
    builder: (ctx) => Positioned(
      top: MediaQuery.of(ctx).viewPadding.top + 16,
      left: 16,
      right: 16,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: colors[type],
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4)),
            ],
          ),
          child: Row(
            children: [
              Icon(icons[type], color: Colors.white, size: 22),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () { if (entry.mounted) entry.remove(); },
                child: const Icon(Icons.close, color: Colors.white, size: 18),
              ),
            ],
          ),
        ),
      ),
    ),
  );
  overlay.insert(entry);
  Future.delayed(const Duration(seconds: 3), () {
    if (entry.mounted) entry.remove();
  });
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int _currentStep = 0;
  final int _totalSteps = 4;

  // Step 1
  final _step1Key = GlobalKey<FormState>();
  String _selectedDocumentType = 'CC';
  final _documentNumberController = TextEditingController();

  // Step 2
  final _step2Key = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _secondNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _secondLastNameController = TextEditingController();

  // Step 3
  final _step3Key = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  // Step 4
  final _step4Key = GlobalKey<FormState>();
  String _otpMethod = 'correo';
  final _otpContactController = TextEditingController();
  final _otpCodeController = TextEditingController();
  bool _otpSent = false;
  bool _acceptTerms = false;

  @override
  void dispose() {
    _documentNumberController.dispose();
    _firstNameController.dispose();
    _secondNameController.dispose();
    _lastNameController.dispose();
    _secondLastNameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _otpContactController.dispose();
    _otpCodeController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep == 0) {
      if (!_step1Key.currentState!.validate()) return;
    }
    if (_currentStep == 1) {
      if (!_step2Key.currentState!.validate()) return;
    }
    if (_currentStep == 2) {
      if (!_step3Key.currentState!.validate()) return;
    }
    if (_currentStep < _totalSteps - 1) {
      setState(() => _currentStep++);
    }
  }

  void _prevStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    } else {
      Navigator.pop(context);
    }
  }

  void _finish() {
    if (!_step4Key.currentState!.validate()) return;
    if (_otpCodeController.text != '123456') {
      showToast(context, 'Código incorrecto. Usa 123456 por ahora.', type: ToastType.error);
      return;
    }
    if (!_acceptTerms) {
      showToast(context, 'Debes aceptar los términos y condiciones para continuar.', type: ToastType.warning);
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const DashboardScreen()),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFF28D16), width: 2),
      ),
      floatingLabelStyle: const TextStyle(color: Color(0xFFF28D16)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFF28D16)),
          onPressed: _prevStep,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Progress bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Paso ${_currentStep + 1} de $_totalSteps',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: List.generate(_totalSteps, (i) {
                      return Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: i < _totalSteps - 1 ? 6 : 0),
                          height: 4,
                          decoration: BoxDecoration(
                            color: i <= _currentStep
                                ? const Color(0xFFF28D16)
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: _buildCurrentStep(),
              ),
            ),
            // Bottom buttons
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 28),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _currentStep == _totalSteps - 1
                          ? (_otpSent && _acceptTerms ? _finish : null)
                          : (_currentStep == 1 ? _nextStep : _nextStep),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF28D16),
                        foregroundColor: Colors.white,
                        elevation: 4,
                        shadowColor: const Color(0xFFF28D16).withOpacity(0.4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(
                        _currentStep == _totalSteps - 1
                            ? 'Crear mi cuenta'
                            : 'Continuar',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentStep() {
    switch (_currentStep) {
      case 0:
        return _buildStep1();
      case 1:
        return _buildStep2();
      case 2:
        return _buildStep3();
      case 3:
        return _buildStep4();
      default:
        return const SizedBox();
    }
  }

  Widget _buildStep1() {
    return Form(
      key: _step1Key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tu documento',
            style: TextStyle(
              fontFamily: 'Gilroy',
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Color(0xFFF28D16),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Ingresa tu tipo y número de documento.',
            style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: DropdownButtonFormField<String>(
              value: _selectedDocumentType,
              decoration: _inputDecoration('Tipo de documento'),
              items: const ['CC', 'CE', 'NIT', 'PASAPORTE']
                  .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                  .toList(),
              onChanged: (value) => setState(() => _selectedDocumentType = value!),
            ),
          ),
          TextFormField(
            controller: _documentNumberController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: _inputDecoration('Número de documento'),
            validator: (value) {
              if (value == null || value.isEmpty) return 'Este campo es requerido';
              if (!RegExp(r'^\d+$').hasMatch(value)) return 'Solo se permiten números';
              if (value.length < 6) return 'Mínimo 6 dígitos';
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStep2() {
    return Form(
      key: _step2Key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tus nombres',
            style: TextStyle(
              fontFamily: 'Gilroy',
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Color(0xFFF28D16),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'El segundo nombre y segundo apellido son opcionales.',
            style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: TextFormField(
              controller: _firstNameController,
              decoration: _inputDecoration('Primer nombre *'),
              validator: (value) =>
                  value == null || value.trim().isEmpty ? 'El primer nombre es requerido' : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: TextFormField(
              controller: _secondNameController,
              decoration: _inputDecoration('Segundo nombre'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: TextFormField(
              controller: _lastNameController,
              decoration: _inputDecoration('Primer apellido *'),
              validator: (value) =>
                  value == null || value.trim().isEmpty ? 'El primer apellido es requerido' : null,
            ),
          ),
          TextFormField(
            controller: _secondLastNameController,
            decoration: _inputDecoration('Segundo apellido'),
          ),
        ],
      ),
    );
  }

  Widget _buildStep3() {
    return Form(
      key: _step3Key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Crea tu contraseña',
            style: TextStyle(
              fontFamily: 'Gilroy',
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Color(0xFFF28D16),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Usa al menos 6 caracteres.',
            style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: TextFormField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: _inputDecoration('Contraseña').copyWith(
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0xFFF28D16),
                  ),
                  onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Este campo es requerido';
                if (value.length < 6) return 'Mínimo 6 caracteres';
                return null;
              },
            ),
          ),
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: _obscureConfirmPassword,
            decoration: _inputDecoration('Repetir contraseña').copyWith(
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                  color: const Color(0xFFF28D16),
                ),
                onPressed: () =>
                    setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) return 'Este campo es requerido';
              if (value != _passwordController.text) return 'Las contraseñas no coinciden';
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStep4() {
    return Form(
      key: _step4Key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Verifica tu identidad',
            style: TextStyle(
              fontFamily: 'Gilroy',
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Color(0xFFF28D16),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Te enviaremos un código para confirmar tu cuenta.',
            style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 28),
          // Method selector
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() {
                    _otpMethod = 'correo';
                    _otpContactController.clear();
                    _otpSent = false;
                  }),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: _otpMethod == 'correo'
                          ? const Color(0xFFF28D16)
                          : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _otpMethod == 'correo'
                            ? const Color(0xFFF28D16)
                            : Colors.grey.shade300,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Correo',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: _otpMethod == 'correo' ? Colors.white : Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() {
                    _otpMethod = 'celular';
                    _otpContactController.clear();
                    _otpSent = false;
                  }),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: _otpMethod == 'celular'
                          ? const Color(0xFFF28D16)
                          : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _otpMethod == 'celular'
                            ? const Color(0xFFF28D16)
                            : Colors.grey.shade300,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Celular',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: _otpMethod == 'celular' ? Colors.white : Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  controller: _otpContactController,
                  keyboardType: _otpMethod == 'correo'
                      ? TextInputType.emailAddress
                      : TextInputType.phone,
                  inputFormatters: _otpMethod == 'celular'
                      ? [FilteringTextInputFormatter.digitsOnly]
                      : null,
                  decoration: _inputDecoration(
                    _otpMethod == 'correo' ? 'Correo electrónico' : 'Número de celular',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Este campo es requerido';
                    if (_otpMethod == 'correo') {
                      if (!RegExp(r'^[\w\.\-]+@[\w\-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                        return 'Ingresa un correo válido';
                      }
                    } else {
                      if (!RegExp(r'^\d{7,15}$').hasMatch(value)) {
                        return 'Ingresa un número de celular válido';
                      }
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    if (_otpContactController.text.isEmpty) return;
                    setState(() => _otpSent = true);
                    showToast(context, 'Código enviado a ${_otpContactController.text}', type: ToastType.success);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1C2546),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  child: const Text(
                    'Enviar',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          if (_otpSent) ...[
            const SizedBox(height: 20),
            TextFormField(
              controller: _otpCodeController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: _inputDecoration('Código de verificación'),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Ingresa el código recibido';
                if (!RegExp(r'^\d+$').hasMatch(value)) return 'El código solo debe contener números';
                return null;
              },
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  showToast(context, 'Código reenviado', type: ToastType.success);
                },
                child: const Text(
                  '¿No recibiste el código? Reenviar',
                  style: TextStyle(color: Color(0xFFF28D16)),
                ),
              ),
            ),
          ],
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  value: _acceptTerms,
                  activeColor: const Color(0xFFF28D16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  onChanged: (value) => setState(() => _acceptTerms = value!),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _acceptTerms = !_acceptTerms),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 13, color: Colors.grey.shade600, height: 1.4),
                      children: const [
                        TextSpan(text: 'Estoy de acuerdo con los '),
                        TextSpan(
                          text: 'Términos y condiciones',
                          style: TextStyle(color: Color(0xFFF28D16), fontWeight: FontWeight.w600),
                        ),
                        TextSpan(text: ' y la '),
                        TextSpan(
                          text: 'Política de privacidad',
                          style: TextStyle(color: Color(0xFFF28D16), fontWeight: FontWeight.w600),
                        ),
                        TextSpan(text: '.'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailFormKey = GlobalKey<FormState>();
  final _codeFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();
  
  final _emailController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  
  final List<TextEditingController> _otpControllers = List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _otpFocusNodes = List.generate(6, (_) => FocusNode());
  
  bool _isLoading = false;
  int _step = 1;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;
  int _resendTimer = 0;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 6; i++) {
      _otpControllers[i].addListener(() => _onOtpChanged(i));
    }
  }

  void _onOtpChanged(int index) {
    if (_otpControllers[index].text.isNotEmpty && index < 5) {
      _otpFocusNodes[index + 1].requestFocus();
    }
    setState(() {});
  }

  String get _fullCode => _otpControllers.map((c) => c.text).join();

  @override
  void dispose() {
    _emailController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _otpFocusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  Future<void> _sendCode() async {
    if (!_emailFormKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() {
        _isLoading = false;
        _step = 2;
        _resendTimer = 60;
      });
      _startResendTimer();
    }
  }

  void _startResendTimer() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted && _resendTimer > 0) {
        setState(() {
          _resendTimer--;
        });
        return true;
      }
      return false;
    });
  }

  Future<void> _verifyCode() async {
    if (_fullCode.length != 6) {
      showToast(context, 'Por favor ingresa el código de 6 dígitos', type: ToastType.error);
      return;
    }

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() {
        _isLoading = false;
        _step = 3;
      });
    }
  }

  Future<void> _resetPassword() async {
    if (!_passwordFormKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() {
        _isLoading = false;
        _step = 4;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar contraseña'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: _buildStep(),
        ),
      ),
    );
  }

  Widget _buildStep() {
    switch (_step) {
      case 1:
        return _buildEmailStep();
      case 2:
        return _buildCodeStep();
      case 3:
        return _buildNewPasswordStep();
      case 4:
        return _buildSuccessStep();
      default:
        return _buildEmailStep();
    }
  }

  Widget _buildEmailStep() {
    return Form(
      key: _emailFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFFF28D16).withAlpha(26),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.lock_reset,
              size: 40,
              color: Color(0xFFF28D16),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '¿Olvidaste tu contraseña?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Escribe tu correo electrónico con el cual ingresaste en nuestro sistema y te enviaremos un código para que cambies la contraseña.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade600,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Correo electrónico',
              prefixIcon: Icon(Icons.email_outlined, color: Color(0xFFF28D16)),
              hintText: 'tucorreo@ejemplo.com',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa tu correo';
              }
              if (!value.contains('@') || !value.contains('.')) {
                return 'Ingresa un correo válido';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _isLoading ? null : _sendCode,
            child: _isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Text(
                    'Enviar código',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('¿Recordaste tu contraseña? '),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Regresar al inicio'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.help_outline, color: Colors.blue.shade700, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '¿Necesitas más ayuda? Contacta al equipo de soporte.',
                    style: TextStyle(
                      color: Colors.blue.shade700,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCodeStep() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFFF28D16).withAlpha(26),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.sms,
              size: 40,
              color: Color(0xFFF28D16),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Ingresa tu código de verificación',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1C2546),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Por favor ingresa el código de 6 dígitos que hemos enviado a tu correo electrónico.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade600,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              _emailController.text.isEmpty ? 'correocliente@email.com' : _emailController.text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF306EE8),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(6, (index) {
              return Container(
                width: 48,
                height: 56,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _otpControllers[index].text.isNotEmpty 
                        ? const Color(0xFF306EE8) 
                        : const Color(0xFFE2E8F0),
                    width: 2,
                  ),
                ),
                child: TextField(
                  controller: _otpControllers[index],
                  focusNode: _otpFocusNodes[index],
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1C2546),
                  ),
                  decoration: const InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  onChanged: (value) {
                    if (value.isNotEmpty && index < 5) {
                      _otpFocusNodes[index + 1].requestFocus();
                    } else if (value.isEmpty && index > 0) {
                      _otpFocusNodes[index - 1].requestFocus();
                    }
                    setState(() {});
                  },
                ),
              );
            }),
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 56,
            child: ElevatedButton(
              onPressed: _isLoading ? null : _verifyCode,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF59E0B),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: _isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      'Confirmar código',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: _resendTimer > 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.access_time, size: 18, color: Color(0xFF94A3B8)),
                      const SizedBox(width: 8),
                      Text(
                        'Reenviar código en ${_resendTimer}s',
                        style: const TextStyle(color: Color(0xFF94A3B8)),
                      ),
                    ],
                  )
                : TextButton.icon(
                    onPressed: () {
                      setState(() {
                        _resendTimer = 60;
                      });
                      _startResendTimer();
                      showToast(context, 'Código reenviado', type: ToastType.success);
                    },
                    icon: const Icon(Icons.refresh, color: Color(0xFF306EE8)),
                    label: const Text(
                      'Reenviar código',
                      style: TextStyle(
                        color: Color(0xFF306EE8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewPasswordStep() {
    return Form(
      key: _passwordFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFFF28D16).withAlpha(26),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_circle,
              size: 40,
              color: Color(0xFFF28D16),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Nueva contraseña',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Crea una nueva contraseña para tu cuenta.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade600,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          TextFormField(
            controller: _newPasswordController,
            obscureText: _obscureNewPassword,
            decoration: InputDecoration(
              labelText: 'Nueva contraseña',
              prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFFF28D16)),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureNewPassword ? Icons.visibility_off : Icons.visibility,
                  color: const Color(0xFFF28D16),
                ),
                onPressed: () {
                  setState(() {
                    _obscureNewPassword = !_obscureNewPassword;
                  });
                },
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa una contraseña';
              }
              if (value.length < 6) {
                return 'La contraseña debe tener al menos 6 caracteres';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: _obscureConfirmPassword,
            decoration: InputDecoration(
              labelText: 'Confirmar contraseña',
              prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFFF28D16)),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                  color: const Color(0xFFF28D16),
                ),
                onPressed: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor confirma tu contraseña';
              }
              if (value != _newPasswordController.text) {
                return 'Las contraseñas no coinciden';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _isLoading ? null : _resetPassword,
            child: _isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Text(
                    'Guardar nueva contraseña',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessStep() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 40),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0xFFF28D16).withAlpha(26),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check_circle,
            size: 60,
            color: Color(0xFFF28D16),
          ),
        ),
        const SizedBox(height: 32),
        const Text(
          '¡Contraseña actualizada!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Tu contraseña ha sido cambiada exitosamente.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Ya puedes iniciar sesión con tu nueva contraseña.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade500,
          ),
        ),
        const SizedBox(height: 48),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
            child: const Text(
              'Ir al inicio',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  final List<NotificationItem> _notifications = NotificationService.getMockNotifications();

  List<Widget> get _screens => [
    const HomeContent(),
    const CreditsListScreen(),
    const PaymentScreen(),
    const ProfileScreen(),
  ];

  int get unreadCount => _notifications.where((n) => !n.isRead).length;

  void _markAllAsRead() {
    setState(() {
      for (var notification in _notifications) {
        notification.isRead = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: AppBottomNav(
        selectedIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
      ),
    );
  }
}

class _AppNavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  const _AppNavItem({required this.icon, required this.activeIcon, required this.label});
}

class AppBottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const AppBottomNav({super.key, required this.selectedIndex, required this.onTap});

  static const _items = [
    _AppNavItem(icon: Icons.home_outlined, activeIcon: Icons.home_rounded, label: 'Inicio'),
    _AppNavItem(icon: Icons.credit_card_outlined, activeIcon: Icons.credit_card, label: 'Mis créditos'),
    _AppNavItem(icon: Icons.payments_outlined, activeIcon: Icons.payments_rounded, label: 'Pagar'),
    _AppNavItem(icon: Icons.person_outline_rounded, activeIcon: Icons.person_rounded, label: 'Perfil'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.10), blurRadius: 24, offset: const Offset(0, -6)),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_items.length, (i) {
              final item = _items[i];
              final isActive = i == selectedIndex;
              return GestureDetector(
                onTap: () => onTap(i),
                behavior: HitTestBehavior.opaque,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.symmetric(horizontal: isActive ? 20 : 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: isActive ? const Color(0xFFF28D16) : Colors.transparent,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isActive ? item.activeIcon : item.icon,
                        color: isActive ? Colors.white : Colors.grey.shade400,
                        size: 24,
                      ),
                      if (isActive) ...[
                        const SizedBox(width: 8),
                        Text(
                          item.label,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int _currentPage = 0;
  final List<CreditData> _credits = CreditService.getCredits();
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '¡Hola, Andrés!',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '¡Qué bueno volver a verte en Supre!',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
                _NotificationBell(),
              ],
            ),
            const SizedBox(height: 24),
            _buildPaymentCarousel(context),
            const SizedBox(height: 24),
            Text(
              'Servicios',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildCreditSummary(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentCarousel(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 290,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _credits.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return _buildPaymentCard(context, _credits[index]);
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _credits.length,
            (index) => GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: _currentPage == index ? 24 : 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? const Color(0xFFF28D16)
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentCard(BuildContext context, CreditData credit) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: credit.isOverdue
            ? Border.all(color: Colors.red.shade400, width: 1.5)
            : Border.all(color: Colors.grey.shade200, width: 1),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 16, offset: const Offset(0, 4)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Factura + estado
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF28D16).withAlpha(26),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    credit.invoice,
                    style: const TextStyle(
                      color: Color(0xFFF28D16),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                    color: credit.isOverdue ? Colors.red : credit.statusBgColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    credit.displayStatus,
                    style: TextStyle(
                      color: credit.isOverdue ? Colors.white : credit.statusColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Etiqueta de monto
            Text(
              credit.isOverdue ? 'Valor vencido' : 'A pagar en esta cuota:',
              style: TextStyle(
                color: credit.isOverdue ? Colors.red : Colors.grey.shade500,
                fontSize: 12,
                fontWeight: credit.isOverdue ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              CreditService.formatFullCurrency(credit.quotaAmount),
              style: TextStyle(
                color: credit.isOverdue ? Colors.red : const Color(0xFF1C2546),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // Cuota actual + fecha límite
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Vas en la cuota ${credit.currentQuota} de ${credit.totalQuotas}',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
                Text(
                  'Límite: ${credit.nextDueDate}',
                  style: TextStyle(
                    color: credit.isOverdue ? Colors.red : Colors.grey.shade600,
                    fontSize: 12,
                    fontWeight: credit.isOverdue ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ],
            ),
            if (credit.isOverdue) ...[
              const SizedBox(height: 6),
              Row(
                children: [
                  Icon(Icons.warning_amber_rounded, color: Colors.red.shade600, size: 13),
                  const SizedBox(width: 4),
                  Text(
                    '${credit.daysLeft.abs()} ${credit.daysLeft.abs() == 1 ? 'día' : 'días'} vencido${credit.daysLeft.abs() == 1 ? '' : 's'} · Paga para evitar más intereses',
                    style: TextStyle(color: Colors.red.shade600, fontSize: 11, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
            const Spacer(),
            // CTA principal
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: credit.isOverdue ? Colors.red : const Color(0xFFF28D16),
                  foregroundColor: credit.isOverdue ? Colors.white : const Color(0xFF1C2546),
                  elevation: 4,
                  shadowColor: (credit.isOverdue ? Colors.red : const Color(0xFFF28D16)).withOpacity(0.4),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(preselectedCredit: credit),
                    ),
                  );
                },
                child: Text(credit.isOverdue ? 'Pagar ahora' : 'Pagar ahora'),
              ),
            ),
            const SizedBox(height: 6),
            // Enlace secundario
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreditDetailScreen(
                        creditId: credit.id,
                        status: credit.status,
                        statusColor: credit.statusColor,
                        statusBgColor: credit.statusBgColor,
                      ),
                    ),
                  );
                },
                child: Text(
                  'Ver detalles',
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreditSummary(BuildContext context) {
    return Card(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreditsScreenWithNav()),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF306EE8).withAlpha(26),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.account_balance_wallet,
                  color: Color(0xFF306EE8),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mis créditos',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Gestiona tus pagos',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Color(0xFF94A3B8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotificationBell extends StatefulWidget {
  @override
  State<_NotificationBell> createState() => _NotificationBellState();
}

class _NotificationBellState extends State<_NotificationBell> {
  final List<NotificationItem> _notifications = NotificationService.getMockNotifications();

  int get unreadCount => _notifications.where((n) => !n.isRead).length;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NotificationsScreen(notifications: _notifications),
          ),
        );
      },
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: const Color(0xFFF28D16).withAlpha(26),
          shape: BoxShape.circle,
        ),
        child: Stack(
          children: [
            const Center(
              child: Icon(
                Icons.notifications_outlined,
                size: 24,
                color: Color(0xFFF28D16),
              ),
            ),
            if (unreadCount > 0)
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    '$unreadCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class PaymentScreen extends StatefulWidget {
  final CreditData? preselectedCredit;

  const PaymentScreen({super.key, this.preselectedCredit});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _selectedOption = 0;
  final _customAmountController = TextEditingController();
  late CreditData _selectedCredit;
  List<CreditData> _credits = [];

  @override
  void initState() {
    super.initState();
    _credits = CreditService.getCredits();
    if (widget.preselectedCredit != null) {
      _selectedCredit = _credits.firstWhere(
        (c) => c.id == widget.preselectedCredit!.id,
        orElse: () => _credits.first,
      );
    } else {
      _selectedCredit = _credits.first;
    }
  }

  List<Map<String, dynamic>> get _paymentOptions {
    return [
      {
        'title': 'Paga la cuota de este mes',
        'amount': _selectedCredit.quotaAmount,
        'subtitle': 'Cuota actual',
      },
      {
        'title': 'Paga las cuotas vencidas',
        'amount': _selectedCredit.status == 'Vencido' ? _selectedCredit.quotaAmount : 0,
        'subtitle': 'Mora acumulada',
      },
      {
        'title': 'Paga todo el crédito',
        'amount': _selectedCredit.remainingAmount,
        'subtitle': 'Liquidar crédito',
      },
    ];
  }

  String get _selectedAmount {
    final option = _paymentOptions[_selectedOption];
    final amount = option['amount'] as double;
    return CreditService.formatFullCurrency(amount);
  }

  @override
  void dispose() {
    _customAmountController.dispose();
    super.dispose();
  }

  void _selectOption(int index) {
    setState(() {
      _selectedOption = index;
    });
  }

  Widget _buildSelectedCreditCard() {
    final credit = _selectedCredit;
    final List<Color> gradientColors = credit.isOverdue
        ? [Colors.red.shade600, Colors.red.shade400]
        : credit.status == 'Al día'
            ? [const Color(0xFF22C55E), const Color(0xFF4ADE80)]
            : [const Color(0xFFF59E0B), const Color(0xFFFBBF24)];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: credit.isOverdue ? Border.all(color: Colors.red.shade400, width: 1.5) : null,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 16, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                credit.name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1C2546)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: credit.isOverdue ? Colors.red : credit.statusBgColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  credit.displayStatus,
                  style: TextStyle(
                    color: credit.isOverdue ? Colors.white : credit.statusColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${(credit.progressPercentage * 100).round()}%',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: credit.statusColor),
              ),
              Text(
                'Vas en la cuota ${credit.currentQuota} de ${credit.totalQuotas}',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                Container(height: 12, decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8))),
                FractionallySizedBox(
                  widthFactor: credit.progressPercentage,
                  child: Container(
                    height: 12,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: gradientColors),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        credit.isOverdue ? 'Valor vencido' : 'A pagar en esta cuota:',
                        style: TextStyle(fontSize: 11, color: credit.isOverdue ? Colors.red : Colors.grey.shade600, fontWeight: credit.isOverdue ? FontWeight.w600 : FontWeight.normal),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        CreditService.formatFullCurrency(credit.quotaAmount),
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: credit.isOverdue ? Colors.red : const Color(0xFF1C2546)),
                      ),
                    ],
                  ),
                ),
                Container(width: 1, height: 40, color: Colors.grey.shade300),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Fecha límite', style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
                      const SizedBox(height: 4),
                      Text(
                        credit.nextDueDate,
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: credit.isOverdue ? Colors.red : const Color(0xFF1C2546)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFF28D16)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Realizar pago',
          style: TextStyle(
            color: Color(0xFF1C2546),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selecciona el crédito',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C2546),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<CreditData>(
                  value: _selectedCredit,
                  isExpanded: true,
                  items: _credits.map((credit) {
                    return DropdownMenuItem<CreditData>(
                      value: credit,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(credit.name),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: credit.statusBgColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              credit.status,
                              style: TextStyle(
                                color: credit.statusColor,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (credit) {
                    if (credit != null) {
                      setState(() {
                        _selectedCredit = credit;
                        _selectedOption = 0;
                      });
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildSelectedCreditCard(),
            const SizedBox(height: 24),
            const Text(
              'Selecciona el monto a pagar',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C2546),
              ),
            ),
            const SizedBox(height: 16),
            ...List.generate(_paymentOptions.length, (index) {
              final option = _paymentOptions[index];
              final isSelected = _selectedOption == index;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: GestureDetector(
                  onTap: () => _selectOption(index),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected 
                            ? const Color(0xFFF28D16) 
                            : const Color(0xFFE2E8F0),
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected 
                                  ? const Color(0xFFF28D16) 
                                  : const Color(0xFF94A3B8),
                              width: 2,
                            ),
                          ),
                          child: isSelected
                              ? Center(
                                  child: Container(
                                    width: 12,
                                    height: 12,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFF28D16),
                                    ),
                                  ),
                                )
                              : null,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                option['title'],
                                style: TextStyle(
                                  fontWeight: isSelected 
                                      ? FontWeight.bold 
                                      : FontWeight.w500,
                                  fontSize: 16,
                                  color: isSelected 
                                      ? const Color(0xFF1C2546) 
                                      : Colors.black87,
                                ),
                              ),
                              Text(
                                option['subtitle'],
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          CreditService.formatFullCurrency(option['amount'] as double),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: isSelected 
                                ? const Color(0xFFF28D16) 
                                : const Color(0xFF1C2546),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: () => _selectOption(3),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: _selectedOption == 3 
                          ? const Color(0xFFF28D16) 
                          : const Color(0xFFE2E8F0),
                      width: _selectedOption == 3 ? 2 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: _selectedOption == 3 
                                ? const Color(0xFFF28D16) 
                                : const Color(0xFF94A3B8),
                            width: 2,
                          ),
                        ),
                        child: _selectedOption == 3
                            ? Center(
                                child: Container(
                                  width: 12,
                                  height: 12,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFF28D16),
                                  ),
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Text(
                          'Otro valor',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (_selectedOption == 3) ...[
              const SizedBox(height: 8),
              Text(
                'Ingresa un valor de \$1 a ${CreditService.formatFullCurrency(_selectedCredit.remainingAmount)}',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _customAmountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Ingresa el valor',
                  prefixText: '\$ ',
                  prefixStyle: const TextStyle(
                    color: Color(0xFF1C2546),
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xFFF28D16),
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF28D16),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PaymentMethodScreen(amount: '\$350.000')),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shield_outlined, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Pagar ahora',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.verified_user_outlined,
                  size: 16,
                  color: Color(0xFF94A3B8),
                ),
                SizedBox(width: 8),
                Text(
                  'Pago seguro procesado por ',
                  style: TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Supre Secure',
                  style: TextStyle(
                    color: Color(0xFF306EE8),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodScreen extends StatelessWidget {
  final String amount;
  
  const PaymentMethodScreen({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFF28D16)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '¿Cómo quieres pagar?',
          style: TextStyle(
            color: Color(0xFF1C2546),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: const Color(0xFFF3F4F6),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Valor a pagar',
                      style: TextStyle(
                        color: Color(0xFF575756),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      amount,
                      style: const TextStyle(
                        color: Color(0xFF1C2546),
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Método de pago',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C2546),
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PSEScreen(amount: '\$350.000')),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                      ),
                      child: const Center(
                        child: Image(
                          image: AssetImage('assets/logo-pse.webp'),
                          width: 50,
                          height: 30,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Paga con PSE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Pago con cuenta bancaria',
                            style: TextStyle(
                              color: Color(0xFF575756),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: Color(0xFF94A3B8),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PSEScreen extends StatefulWidget {
  final String amount;
  
  const PSEScreen({super.key, required this.amount});

  @override
  State<PSEScreen> createState() => _PSEScreenState();
}

class _PSEScreenState extends State<PSEScreen> {
  String _selectedDocumentType = 'CC';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFF28D16)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Pagar con PSE',
          style: TextStyle(
            color: Color(0xFF1C2546),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: const Color(0xFFF3F4F6),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Valor a pagar',
                      style: TextStyle(
                        color: Color(0xFF575756),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      widget.amount,
                      style: const TextStyle(
                        color: Color(0xFF1C2546),
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Tipo de documento',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xFF1C2546),
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedDocumentType,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
              items: const [
                DropdownMenuItem(value: 'CC', child: Text('Cédula de ciudadanía')),
                DropdownMenuItem(value: 'CE', child: Text('Cédula de extranjería')),
                DropdownMenuItem(value: 'NIT', child: Text('NIT')),
                DropdownMenuItem(value: 'PASAPORTE', child: Text('Pasaporte')),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedDocumentType = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Número de documento',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xFF1C2546),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Ingresa tu número de documento',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Banco',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xFF1C2546),
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: null,
              decoration: InputDecoration(
                hintText: 'Selecciona',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
              items: const [
                DropdownMenuItem(value: 'banco1', child: Text('Banco de Bogotá')),
                DropdownMenuItem(value: 'banco2', child: Text('Bancolombia')),
                DropdownMenuItem(value: 'banco3', child: Text('Davivienda')),
                DropdownMenuItem(value: 'banco4', child: Text('Banco de Colombia')),
                DropdownMenuItem(value: 'banco5', child: Text('BBVA')),
              ],
              onChanged: (value) {},
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF28D16),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const PaymentSuccessScreen(amount: '\$350.000')),
                  );
                },
                child: const Text(
                  'Ir a PSE',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentSuccessScreen extends StatelessWidget {
  final String amount;
  
  const PaymentSuccessScreen({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF10B981),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  size: 80,
                  color: Color(0xFF10B981),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                '¡Pago exitoso!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Tu pago de $amount ha sido procesado correctamente.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Recibirás un comprobante en tu correo electrónico.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF10B981),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: const Text(
                    'Volver al inicio',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentErrorScreen(amount: amount),
                    ),
                  );
                },
                child: const Text(
                  'Ver pantalla de error (prototipo)',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationService {
  static List<NotificationItem> getMockNotifications() {
    final now = DateTime.now();
    return [
      NotificationItem(
        id: '1',
        title: '¡Cuota próxima a vencer!',
        body: 'La cuota MCSCR-7821-Q9 de tu crédito Creditek #67890 vence en 9 días. El valor a pagar es \$180.000. No dejes pasar la fecha.',
        date: now.subtract(const Duration(hours: 2)),
        type: NotificationType.paymentReminder,
        creditId: '67890',
        isRead: false,
      ),
      NotificationItem(
        id: '2',
        title: 'Cuota vencida',
        body: 'La cuota MCSCR-3216-Q7 de tu crédito Creditek #12345 lleva 2 días vencida. El valor pendiente es \$350.000. Regulariza tu cuenta cuanto antes.',
        date: now.subtract(const Duration(days: 1)),
        type: NotificationType.paymentDue,
        creditId: '12345',
        isRead: false,
      ),
      NotificationItem(
        id: '3',
        title: '¡Pago recibido!',
        body: 'Recibimos tu pago de \$350.000 por la cuota MCSCR-3216-Q6 del crédito Creditek #12345. ¡Gracias por tu puntualidad!',
        date: now.subtract(const Duration(days: 5)),
        type: NotificationType.paymentConfirmed,
        creditId: '12345',
        receiptInvoice: 'MCSCR-3216-Q6',
        receiptAmount: '\$350.000',
        receiptCreditName: 'Creditek #12345',
        isRead: true,
      ),
      NotificationItem(
        id: '4',
        title: 'Recordatorio de pago',
        body: 'Recuerda que la cuota MCSCR-7821-Q9 de tu crédito Creditek #67890 vence pronto. Valor: \$180.000. Paga a tiempo y evita intereses.',
        date: now.subtract(const Duration(days: 7)),
        type: NotificationType.paymentReminder,
        creditId: '67890',
        isRead: true,
      ),
      NotificationItem(
        id: '5',
        title: 'Bienvenido a Supre',
        body: 'Gracias por confiar en nosotros. Desde aquí puedes gestionar todos tus créditos y realizar tus pagos fácilmente.',
        date: now.subtract(const Duration(days: 30)),
        type: NotificationType.welcome,
        isRead: true,
      ),
    ];
  }
}

class NotificationItem {
  final String id;
  final String title;
  final String body;
  final DateTime date;
  final NotificationType type;
  final String? creditId;
  final String? receiptInvoice;
  final String? receiptAmount;
  final String? receiptCreditName;
  bool isRead;

  NotificationItem({
    required this.id,
    required this.title,
    required this.body,
    required this.date,
    required this.type,
    this.creditId,
    this.receiptInvoice,
    this.receiptAmount,
    this.receiptCreditName,
    this.isRead = false,
  });

  IconData get icon {
    switch (type) {
      case NotificationType.paymentReminder:
        return Icons.schedule;
      case NotificationType.paymentDue:
        return Icons.warning_amber;
      case NotificationType.paymentConfirmed:
        return Icons.check_circle;
      case NotificationType.welcome:
        return Icons.celebration;
    }
  }

  Color get iconColor {
    switch (type) {
      case NotificationType.paymentReminder:
        return Colors.orange;
      case NotificationType.paymentDue:
        return Colors.red;
      case NotificationType.paymentConfirmed:
        return Colors.green;
      case NotificationType.welcome:
        return Colors.blue;
    }
  }
}

class QuotaData {
  final int number;
  final double amount;
  final String dueDate;
  final String status;
  final Color statusColor;
  final Color statusBgColor;
  final String invoice;
  final double lateInterest;
  final double earlyPayDiscount;
  final double collectionFee;
  final int lateInterestDays;

  QuotaData({
    required this.number,
    required this.amount,
    required this.dueDate,
    required this.status,
    required this.statusColor,
    required this.statusBgColor,
    required this.invoice,
    this.lateInterest = 0,
    this.earlyPayDiscount = 0,
    this.collectionFee = 0,
    this.lateInterestDays = 0,
  });
}

class CreditData {
  final String id;
  final String name;
  final String status;
  final Color statusColor;
  final Color statusBgColor;
  final double totalAmount;
  final double paidAmount;
  final int totalQuotas;
  final int paidQuotas;
  final int currentQuota;
  final double quotaAmount;
  final String nextDueDate;
  final int daysLeft;
  final String startDate;
  final String endDate;
  final String interestRate;
  final int paymentDay;
  final List<QuotaData> quotas;

  CreditData({
    required this.id,
    required this.name,
    required this.status,
    required this.statusColor,
    required this.statusBgColor,
    required this.totalAmount,
    required this.paidAmount,
    required this.totalQuotas,
    required this.paidQuotas,
    required this.currentQuota,
    required this.quotaAmount,
    required this.nextDueDate,
    required this.daysLeft,
    required this.startDate,
    required this.endDate,
    required this.interestRate,
    required this.paymentDay,
    required this.quotas,
  });

  String get invoice => quotas.isNotEmpty ? quotas.first.invoice : 'N/A';
  double get remainingAmount => totalAmount - paidAmount;
  double get progressPercentage => paidAmount / totalAmount;
  int get remainingQuotas => totalQuotas - paidQuotas;
  bool get isOverdue => status == 'Vencido';
  String get displayStatus {
    switch (status) {
      case 'Vencido': return '¡Págalo hoy!';
      case 'Por pagar': return 'Paga pronto';
      default: return status;
    }
  }
}

class CreditService {
  static List<QuotaData> _generateQuotas({
    required int fromQuota,
    required int toQuota,
    required double amount,
    required int paymentDay,
    required String prefix,
    required String startDate,
    required String creditStatus,
  }) {
    final months = ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'];
    final List<QuotaData> quotas = [];
    
    DateTime currentDate;
    try {
      final parts = startDate.split(' ');
      final monthIndex = months.indexOf(parts[0]) + 1;
      final year = int.parse(parts[2]);
      currentDate = DateTime(year, monthIndex, paymentDay);
    } catch (e) {
      currentDate = DateTime.now();
    }

    Color labelColor;
    if (creditStatus == 'Vencido') {
      labelColor = Colors.red;
    } else if (creditStatus == 'Al día') {
      labelColor = Colors.green;
    } else {
      labelColor = const Color(0xFFF59E0B);
    }

    for (int i = fromQuota; i <= toQuota; i++) {
      final dueDate = DateTime(currentDate.year, currentDate.month + (i - fromQuota), paymentDay);
      final monthName = months[dueDate.month - 1];
      final dueDateStr = '$paymentDay $monthName ${dueDate.year}';
      
      String status;
      Color statusColor;
      Color statusBgColor;
      double lateInterest = 0;
      int lateInterestDays = 0;

      if (i < fromQuota) {
        status = 'Pagado';
        statusColor = Colors.green;
        statusBgColor = Colors.green.withAlpha(26);
      } else if (i == fromQuota) {
        if (creditStatus == 'Vencido' && dueDate.isBefore(DateTime.now())) {
          status = 'Pendiente de pago';
          statusColor = Colors.red;
          statusBgColor = Colors.red.withAlpha(26);
          lateInterest = amount * 0.025;
          lateInterestDays = DateTime.now().difference(dueDate).inDays;
        } else if (creditStatus == 'Al día') {
          status = 'Al día';
          statusColor = Colors.green;
          statusBgColor = Colors.green.withAlpha(26);
        } else {
          status = 'Por pagar';
          statusColor = const Color(0xFFF59E0B);
          statusBgColor = const Color(0xFFFEF3C7);
        }
      } else {
        status = 'Próxima';
        statusColor = Colors.grey;
        statusBgColor = Colors.grey.withAlpha(26);
      }

      quotas.add(QuotaData(
        number: i,
        amount: amount,
        dueDate: dueDateStr,
        status: status,
        statusColor: statusColor,
        statusBgColor: statusBgColor,
        invoice: '$prefix-Q$i',
        lateInterest: lateInterest,
        lateInterestDays: lateInterestDays,
      ));
    }

    return quotas;
  }

  static List<CreditData> getCredits() {
    return [
      CreditData(
        id: '12345',
        name: 'Creditek #12345',
        status: 'Vencido',
        statusColor: Colors.red,
        statusBgColor: Colors.red.withAlpha(26),
        totalAmount: 4500000,
        paidAmount: 2100000,
        totalQuotas: 24,
        paidQuotas: 6,
        currentQuota: 7,
        quotaAmount: 350000,
        nextDueDate: '15 Mar 2026',
        daysLeft: -2,
        startDate: '15 Sep 2025',
        endDate: '15 Sep 2027',
        interestRate: '2.5% mensual',
        paymentDay: 15,
        quotas: _generateQuotas(
          fromQuota: 7,
          toQuota: 24,
          amount: 350000,
          paymentDay: 15,
          prefix: 'MCSCR-3216',
          startDate: '15 Sep 2025',
          creditStatus: 'Vencido',
        ),
      ),
      CreditData(
        id: '67890',
        name: 'Creditek #67890',
        status: 'Por pagar',
        statusColor: const Color(0xFFF59E0B),
        statusBgColor: const Color(0xFFFEF3C7),
        totalAmount: 2160000,
        paidAmount: 1440000,
        totalQuotas: 12,
        paidQuotas: 8,
        currentQuota: 9,
        quotaAmount: 180000,
        nextDueDate: '20 Mar 2026',
        daysLeft: 9,
        startDate: '20 Oct 2025',
        endDate: '20 Oct 2026',
        interestRate: '2.5% mensual',
        paymentDay: 20,
        quotas: _generateQuotas(
          fromQuota: 9,
          toQuota: 12,
          amount: 180000,
          paymentDay: 20,
          prefix: 'MCSCR-7821',
          startDate: '20 Oct 2025',
          creditStatus: 'Por pagar',
        ),
      ),
      CreditData(
        id: '54321',
        name: 'Credimoto #54321',
        status: 'Al día',
        statusColor: Colors.green,
        statusBgColor: Colors.green.withAlpha(26),
        totalAmount: 9000000,
        paidAmount: 6750000,
        totalQuotas: 36,
        paidQuotas: 27,
        currentQuota: 28,
        quotaAmount: 250000,
        nextDueDate: '25 Mar 2026',
        daysLeft: 14,
        startDate: '25 Jun 2025',
        endDate: '25 Jun 2028',
        interestRate: '2.5% mensual',
        paymentDay: 25,
        quotas: _generateQuotas(
          fromQuota: 28,
          toQuota: 36,
          amount: 250000,
          paymentDay: 25,
          prefix: 'MCMT-1102',
          startDate: '25 Jun 2025',
          creditStatus: 'Al día',
        ),
      ),
    ];
  }

  static String formatCurrency(double amount) {
    if (amount >= 1000000) {
      return '\$${(amount / 1000000).toStringAsFixed(1)}M';
    } else if (amount >= 1000) {
      return '\$${(amount / 1000).toStringAsFixed(0)}K';
    }
    return '\$$amount';
  }

  static String formatFullCurrency(double amount) {
    return '\$${amount.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    )}';
  }
}

class PaymentErrorScreen extends StatelessWidget {
  final String amount;
  
  const PaymentErrorScreen({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDC2626),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  size: 80,
                  color: Color(0xFFDC2626),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                '¡Pago fallido!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Tu pago de $amount no pudo ser procesado.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Por favor intenta de nuevo o contacta a soporte.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFFDC2626),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: const Text(
                    'Intentar de nuevo',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: const Text(
                    'Volver al inicio',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

enum NotificationType {
  paymentReminder,
  paymentDue,
  paymentConfirmed,
  welcome,
}

class NotificationsScreen extends StatefulWidget {
  final List<NotificationItem> notifications;

  const NotificationsScreen({super.key, required this.notifications});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late List<NotificationItem> _notifications;

  @override
  void initState() {
    super.initState();
    _notifications = widget.notifications;
  }

  int get unreadCount => _notifications.where((n) => !n.isRead).length;

  void _markAllAsRead() {
    setState(() {
      for (var notification in _notifications) {
        notification.isRead = true;
      }
    });
    showToast(context, 'Todas las notificaciones marcadas como leídas', type: ToastType.success);
  }

  void _markAsRead(String id) {
    setState(() {
      final index = _notifications.indexWhere((n) => n.id == id);
      if (index != -1) {
        _notifications[index].isRead = true;
      }
    });
  }

  void _deleteNotification(String id) {
    setState(() {
      _notifications.removeWhere((n) => n.id == id);
    });
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inMinutes < 60) {
      return 'Hace ${difference.inMinutes} min';
    } else if (difference.inHours < 24) {
      return 'Hace ${difference.inHours} horas';
    } else if (difference.inDays < 7) {
      return 'Hace ${difference.inDays} días';
    } else {
      return DateFormat('dd MMM yyyy').format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaciones'),
        actions: [
          if (unreadCount > 0)
            TextButton(
              onPressed: _markAllAsRead,
              child: const Text('Marcar todo leído'),
            ),
        ],
      ),
      body: _notifications.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                final notification = _notifications[index];
                return _NotificationTile(
                  notification: notification,
                  formattedDate: _formatDate(notification.date),
                  onTap: () {
                    _markAsRead(notification.id);
                    _showNotificationDetail(notification);
                  },
                  onDismiss: () => _deleteNotification(notification.id),
                );
              },
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_off_outlined,
            size: 80,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 16),
          Text(
            'No tienes notificaciones',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Te avisaremos cuando tengas\nnovedades sobre tus créditos',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }

  void _showNotificationDetail(NotificationItem notification) {
    final nav = Navigator.of(context);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (modalContext) => _NotificationDetail(
        notification: notification,
        onClose: () => Navigator.pop(modalContext),
        onNavigate: () {
          Navigator.pop(modalContext);
          nav.pop();
          final credits = CreditService.getCredits();
          if (notification.type == NotificationType.paymentDue ||
              notification.type == NotificationType.paymentReminder) {
            final preselected = notification.creditId != null
                ? credits.firstWhere((c) => c.id == notification.creditId,
                    orElse: () => credits.first)
                : credits.first;
            nav.push(MaterialPageRoute(
                builder: (_) => PaymentScreen(preselectedCredit: preselected)));
          } else if (notification.type == NotificationType.paymentConfirmed) {
            nav.push(MaterialPageRoute(
              builder: (_) => PaymentReceiptScreen(notification: notification),
            ));
          }
        },
        onDownload: () {
          Navigator.pop(modalContext);
          showToast(context, 'Comprobante enviado a tu correo registrado', type: ToastType.success);
        },
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final NotificationItem notification;
  final String formattedDate;
  final VoidCallback onTap;
  final VoidCallback onDismiss;

  const _NotificationTile({
    required this.notification,
    required this.formattedDate,
    required this.onTap,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(notification.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onDismissed: (_) => onDismiss(),
      child: Container(
        color: notification.isRead ? Colors.transparent : const Color(0xFFE3F2FD),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: notification.iconColor.withAlpha(26),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              notification.icon,
              color: notification.iconColor,
            ),
          ),
          title: Text(
            notification.title,
            style: TextStyle(
              fontWeight: notification.isRead ? FontWeight.normal : FontWeight.bold,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                notification.body,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                formattedDate,
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          trailing: IconButton(
            icon: Icon(Icons.close, size: 18, color: Colors.grey.shade400),
            onPressed: onDismiss,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}

class _NotificationDetail extends StatelessWidget {
  final NotificationItem notification;
  final VoidCallback onClose;
  final VoidCallback? onNavigate;
  final VoidCallback? onDownload;

  const _NotificationDetail({
    required this.notification,
    required this.onClose,
    this.onNavigate,
    this.onDownload,
  });

  String get _ctaLabel {
    switch (notification.type) {
      case NotificationType.paymentDue:
      case NotificationType.paymentReminder:
        return 'Ir a pagar';
      case NotificationType.paymentConfirmed:
        return 'Ver detalle del pago';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: notification.iconColor.withAlpha(26),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  notification.icon,
                  color: notification.iconColor,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _formatDate(notification.date),
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.close, color: Colors.grey.shade400),
                onPressed: onClose,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            notification.body,
            style: const TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 24),
          if (_ctaLabel.isNotEmpty)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onNavigate,
                child: Text(_ctaLabel),
              ),
            ),
          if (notification.type == NotificationType.paymentConfirmed) ...[
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: onDownload,
                icon: const Icon(Icons.download_outlined, size: 18),
                label: const Text('Descargar comprobante'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF1C2546),
                  side: const BorderSide(color: Color(0xFF1C2546)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd MMMM yyyy, hh:mm a').format(date);
  }
}

class PaymentReceiptScreen extends StatelessWidget {
  final NotificationItem notification;

  const PaymentReceiptScreen({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    final date = DateFormat('dd MMMM yyyy, hh:mm a').format(notification.date);
    final invoice = notification.receiptInvoice ?? '—';
    final amount = notification.receiptAmount ?? '—';
    final creditName = notification.receiptCreditName ?? '—';

    return Scaffold(
      appBar: AppBar(title: const Text('Comprobante de pago')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.green.withAlpha(26),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check_circle_rounded, color: Colors.green, size: 48),
            ),
            const SizedBox(height: 16),
            const Text(
              '¡Pago exitoso!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              date,
              style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
            ),
            const SizedBox(height: 32),
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _receiptRow('Crédito', creditName),
                    const Divider(height: 24),
                    _receiptRow('Factura / Cuota', invoice),
                    const Divider(height: 24),
                    _receiptRow('Valor pagado', amount,
                        valueStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        )),
                    const Divider(height: 24),
                    _receiptRow('Estado', 'Pagado',
                        valueStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {
                  showToast(context, 'Comprobante enviado a tu correo registrado',
                      type: ToastType.success);
                },
                icon: const Icon(Icons.download_outlined),
                label: const Text('Descargar comprobante',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF1C2546),
                  side: const BorderSide(color: Color(0xFF1C2546)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Volver'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _receiptRow(String label, String value, {TextStyle? valueStyle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: Colors.grey.shade600, fontSize: 14)),
        Text(value, style: valueStyle ?? const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
      ],
    );
  }
}

class CreditsListScreen extends StatelessWidget {
  const CreditsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final credits = CreditService.getCredits();
    final totalMonthly = credits.fold<double>(0, (sum, c) => sum + c.quotaAmount);
    final hasOverdue = credits.any((c) => c.isOverdue);
    final overdueCount = credits.where((c) => c.isOverdue).length;
    final minDaysLeft = credits
        .where((c) => !c.isOverdue)
        .fold<int?>(null, (min, c) => min == null || c.daysLeft < min ? c.daysLeft : min);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text('Mis créditos'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Header resumen global
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: Row(
              children: [
                _buildMetric(
                  label: 'Créditos activos',
                  value: '${credits.length}',
                  icon: Icons.credit_card,
                  color: const Color(0xFF1C2546),
                ),
                const SizedBox(width: 1),
                _buildMetric(
                  label: 'Cuota total del mes',
                  value: CreditService.formatFullCurrency(totalMonthly),
                  icon: Icons.payments_outlined,
                  color: const Color(0xFFF28D16),
                ),
                const SizedBox(width: 1),
                _buildMetric(
                  label: hasOverdue ? 'Vencidos' : 'Próximo vencimiento',
                  value: hasOverdue
                      ? '$overdueCount ${overdueCount == 1 ? 'crédito' : 'créditos'}'
                      : minDaysLeft == null
                          ? 'Al día'
                          : minDaysLeft == 0
                              ? 'Hoy'
                              : 'En $minDaysLeft ${minDaysLeft == 1 ? 'día' : 'días'}',
                  icon: hasOverdue ? Icons.warning_amber_rounded : Icons.event_outlined,
                  color: hasOverdue ? Colors.red : minDaysLeft != null && minDaysLeft <= 5 ? const Color(0xFFF59E0B) : Colors.green,
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: credits.length,
              itemBuilder: (context, index) => _buildCreditCard(context, credits[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetric({required String label, required String value, required IconData icon, required Color color}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.07),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(height: 4),
            Text(value, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 14)),
            Text(label, style: TextStyle(color: Colors.grey.shade600, fontSize: 10)),
          ],
        ),
      ),
    );
  }

  Widget _buildCreditCard(BuildContext context, CreditData credit) {
    final List<Color> gradientColors = credit.isOverdue
        ? [Colors.red.shade600, Colors.red.shade400]
        : credit.status == 'Al día'
            ? [const Color(0xFF22C55E), const Color(0xFF4ADE80)]
            : [const Color(0xFFF59E0B), const Color(0xFFFBBF24)];

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: credit.isOverdue
            ? Border.all(color: Colors.red.shade400, width: 1.5)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreditDetailScreen(
                creditId: credit.id,
                status: credit.status,
                statusColor: credit.statusColor,
                statusBgColor: credit.statusBgColor,
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nombre + badge
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    credit.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1C2546)),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      color: credit.isOverdue ? Colors.red : credit.statusBgColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      credit.displayStatus,
                      style: TextStyle(
                        color: credit.isOverdue ? Colors.white : credit.statusColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Porcentaje + cuotas
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${(credit.progressPercentage * 100).round()}%',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: credit.statusColor,
                    ),
                  ),
                  Text(
                    'Vas en la cuota ${credit.currentQuota} de ${credit.totalQuotas}',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Barra con gradiente
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  children: [
                    Container(
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: credit.progressPercentage,
                      child: Container(
                        height: 12,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: gradientColors),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Sección de métricas (mismo estilo que Progreso del crédito)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            credit.isOverdue ? 'Valor vencido' : 'Próxima cuota',
                            style: TextStyle(
                              fontSize: 11,
                              color: credit.isOverdue ? Colors.red : Colors.grey.shade600,
                              fontWeight: credit.isOverdue ? FontWeight.w600 : FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            CreditService.formatFullCurrency(credit.quotaAmount),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: credit.isOverdue ? Colors.red : const Color(0xFF1C2546),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(width: 1, height: 40, color: Colors.grey.shade300),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fecha límite',
                            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            credit.nextDueDate,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: credit.isOverdue ? Colors.red : const Color(0xFF1C2546),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              if (credit.isOverdue) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.red.shade200),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.warning_amber_rounded, color: Colors.red.shade700, size: 16),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '${credit.daysLeft.abs()} ${credit.daysLeft.abs() == 1 ? 'día' : 'días'} vencido${credit.daysLeft.abs() == 1 ? '' : 's'} · Paga para evitar más intereses',
                          style: TextStyle(color: Colors.red.shade700, fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
              // Botón pagar
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: credit.isOverdue ? Colors.red : const Color(0xFFF28D16),
                    foregroundColor: credit.isOverdue ? Colors.white : const Color(0xFF1C2546),
                    elevation: 2,
                    shadowColor: (credit.isOverdue ? Colors.red : const Color(0xFFF28D16)).withOpacity(0.4),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentScreen(preselectedCredit: credit),
                      ),
                    );
                  },
                  child: Text(credit.isOverdue ? 'Pagar ahora' : 'Pagar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CreditsScreenWithNav extends StatefulWidget {
  const CreditsScreenWithNav({super.key});

  @override
  State<CreditsScreenWithNav> createState() => _CreditsScreenWithNavState();
}

class _CreditsScreenWithNavState extends State<CreditsScreenWithNav> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          HomeContent(),
          CreditsListScreen(),
          PaymentScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: AppBottomNav(
        selectedIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('¿Cerrar sesión?'),
        content: const Text('¿Estás seguro de que deseas cerrar sesión?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Cerrar sesión'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFFF28D16),
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Andrés González',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'andres@email.com',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 32),
            _buildMenuItem(
              context, 
              Icons.notifications_outlined, 
              'Notificaciones',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationsScreen(
                      notifications: NotificationService.getMockNotifications(),
                    ),
                  ),
                );
              },
            ),
            _buildMenuItem(
              context, 
              Icons.help_outline, 
              'Ayuda',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HelpCenterScreen(),
                  ),
                );
              },
            ),
            _buildMenuItem(
              context, 
              Icons.info_outline, 
              'Acerca de',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutScreen(),
                  ),
                );
              },
            ),
            const Divider(height: 32),
            _buildMenuItem(
              context, 
              Icons.logout, 
              'Cerrar sesión', 
              isDestructive: true,
              onTap: () => _showLogoutDialog(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, 
    IconData icon, 
    String title, {
    bool isDestructive = false,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isDestructive ? Colors.red : Colors.grey.shade700,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isDestructive ? Colors.red : Colors.black87,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: Colors.grey.shade400,
      ),
      onTap: onTap,
    );
  }
}

class CreditDetailScreen extends StatefulWidget {
  final String creditId;
  final String status;
  final Color statusColor;
  final Color statusBgColor;

  const CreditDetailScreen({
    super.key,
    required this.creditId,
    required this.status,
    required this.statusColor,
    required this.statusBgColor,
  });

  @override
  State<CreditDetailScreen> createState() => _CreditDetailScreenState();
}

class _CreditDetailScreenState extends State<CreditDetailScreen> {
  int _expandedPaymentIndex = 0;
  bool _detailsExpanded = false;
  late CreditData _credit;

  @override
  void initState() {
    super.initState();
    final credits = CreditService.getCredits();
    _credit = credits.firstWhere(
      (c) => c.id == widget.creditId,
      orElse: () => credits.first,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text(_credit.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_credit.isOverdue) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.red.shade200),
                ),
                child: Row(
                  children: [
                    Icon(Icons.warning_amber_rounded, color: Colors.red.shade700, size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Este crédito tiene ${_credit.daysLeft.abs()} ${_credit.daysLeft.abs() == 1 ? 'día' : 'días'} vencido${_credit.daysLeft.abs() == 1 ? '' : 's'}. Realiza tu pago para evitar intereses adicionales.',
                        style: TextStyle(color: Colors.red.shade700, fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
            _buildMainCard(),
            const SizedBox(height: 16),
            _buildPayButton(),
            const SizedBox(height: 24),
            _buildProgressSection(),
            const SizedBox(height: 20),
            _buildDetailsSection(),
            const SizedBox(height: 20),
            _buildPaymentsSection(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildMainCard() {
    final invoice = _credit.quotas.isNotEmpty ? _credit.quotas.first.invoice : 'Sin referencia';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: _credit.isOverdue
            ? Border.all(color: Colors.red.shade400, width: 1.5)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nombre + badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _credit.name,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1C2546)),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      invoice,
                      style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: _credit.isOverdue ? Colors.red : _credit.statusBgColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _credit.displayStatus,
                  style: TextStyle(
                    color: _credit.isOverdue ? Colors.white : _credit.statusColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Métricas: cuota + fecha
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _credit.isOverdue ? 'Valor vencido' : 'A pagar en esta cuota:',
                        style: TextStyle(
                          fontSize: 11,
                          color: _credit.isOverdue ? Colors.red : Colors.grey.shade600,
                          fontWeight: _credit.isOverdue ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        CreditService.formatFullCurrency(_credit.quotaAmount),
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: _credit.isOverdue ? Colors.red : const Color(0xFF1C2546),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(width: 1, height: 40, color: Colors.grey.shade300),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Fecha límite', style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
                      const SizedBox(height: 4),
                      Text(
                        _credit.nextDueDate,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: _credit.isOverdue ? Colors.red : const Color(0xFF1C2546),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressSection() {
    final progress = _credit.progressPercentage;
    final percentText = '${(progress * 100).round()}%';
    final List<Color> gradientColors = _credit.isOverdue
        ? [Colors.red.shade600, Colors.red.shade400]
        : _credit.status == 'Al día'
            ? [const Color(0xFF22C55E), const Color(0xFF4ADE80)]
            : [const Color(0xFFF59E0B), const Color(0xFFFBBF24)];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Progreso del crédito',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      percentText,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: _credit.statusColor,
                      ),
                    ),
                    Text(
                      'Vas en la cuota ${_credit.currentQuota} de ${_credit.totalQuotas}',
                      style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    children: [
                      Container(
                        height: 12,
                        decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8)),
                      ),
                      FractionallySizedBox(
                        widthFactor: progress,
                        child: Container(
                          height: 12,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: gradientColors),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total pagado', style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
                            const SizedBox(height: 4),
                            Text(
                              CreditService.formatFullCurrency(_credit.paidAmount),
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _credit.statusColor),
                            ),
                          ],
                        ),
                      ),
                      Container(width: 1, height: 40, color: Colors.grey.shade300),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Saldo por pagar', style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
                            const SizedBox(height: 4),
                            Text(
                              CreditService.formatFullCurrency(_credit.remainingAmount),
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1C2546)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Total del crédito: ${CreditService.formatFullCurrency(_credit.totalAmount)}',
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF1C2546)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => setState(() => _detailsExpanded = !_detailsExpanded),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Detalles del crédito',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                _detailsExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        if (_detailsExpanded) ...[
          const SizedBox(height: 12),
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildDetailRow('Valor total del crédito', CreditService.formatFullCurrency(_credit.totalAmount)),
                  const Divider(height: 16),
                  _buildDetailRow('Cantidad de cuotas', '${_credit.totalQuotas} cuotas'),
                  const Divider(height: 16),
                  _buildDetailRow('Día de pago', 'Día ${_credit.paymentDay} de cada mes'),
                  const Divider(height: 16),
                  _buildDetailRow('Fecha de inicio', _credit.startDate),
                  const Divider(height: 16),
                  _buildDetailRow('Fecha de vencimiento', _credit.endDate),
                  const Divider(height: 16),
                  _buildDetailRow('Tasa de interés', _credit.interestRate),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }

  List<Map<String, dynamic>> _getUpcomingPayments() {
    return _credit.quotas.map((quota) {
      return {
        'number': quota.number,
        'amount': CreditService.formatFullCurrency(quota.amount),
        'dueDate': quota.dueDate,
        'status': quota.status,
        'statusColor': quota.statusColor,
        'statusBgColor': quota.statusBgColor,
        'invoice': quota.invoice,
        'totalCredit': CreditService.formatFullCurrency(_credit.totalAmount),
        'remainingBalance': CreditService.formatFullCurrency(_credit.remainingAmount),
        'lateInterest': CreditService.formatFullCurrency(quota.lateInterest),
        'earlyPayDiscount': CreditService.formatFullCurrency(quota.earlyPayDiscount),
        'collectionFee': CreditService.formatFullCurrency(quota.collectionFee),
        'lateInterestDays': quota.lateInterestDays,
        'pendingQuotes': _credit.remainingQuotas,
        'interestRate': _credit.interestRate,
      };
    }).toList();
  }

  Widget _buildPaymentsSection() {
    final payments = _getUpcomingPayments();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Próximos pagos',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...List.generate(payments.length, (index) {
          final payment = payments[index];
          final isExpanded = _expandedPaymentIndex == index;
          final isNext = index == 0;
          
          String creditStatusLabel;
          Color creditStatusColor;
          Color creditStatusBgColor;
          
          if (_credit.status == 'Al día') {
            creditStatusLabel = 'Al día';
            creditStatusColor = Colors.green;
            creditStatusBgColor = Colors.green.withAlpha(26);
          } else if (_credit.status == 'Vencido') {
            creditStatusLabel = 'Pendiente de pago';
            creditStatusColor = Colors.red;
            creditStatusBgColor = Colors.red.withAlpha(26);
          } else {
            creditStatusLabel = 'Por pagar';
            creditStatusColor = const Color(0xFFF59E0B);
            creditStatusBgColor = const Color(0xFFFEF3C7);
          }

          final isGray = !isNext;
          final grayColor = Colors.grey.shade400;
          final grayBgColor = Colors.grey.shade200;

          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Card(
              color: Colors.white,
              child: Column(
                children: [
                  InkWell(
                    onTap: () => setState(() {
                      _expandedPaymentIndex = isExpanded ? -1 : index;
                    }),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            width: 4,
                            height: 50,
                            decoration: BoxDecoration(
                              color: isGray ? grayColor : creditStatusColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Cuota ${payment['number']}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: isGray ? Colors.grey : Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isGray ? grayBgColor : creditStatusBgColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        isGray ? 'Pendiente' : creditStatusLabel,
                                        style: TextStyle(
                                          color: isGray ? grayColor : creditStatusColor,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Fecha límite: ${payment['dueDate']}',
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            payment['amount'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: isGray ? Colors.grey : Colors.black,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (isExpanded) ...[
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey.shade200,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildPaymentDetailRow('Valor de la cuota', payment['amount']),
                          if ((payment['lateInterest'] as String).isNotEmpty && (payment['lateInterest'] as String) != '\$0') ...[
                            const Divider(height: 16),
                            _buildPaymentDetailRow('Interés de mora', payment['lateInterest']),
                            const Divider(height: 16),
                            _buildPaymentDetailRow('Días de interés de mora', '${payment['lateInterestDays']} días'),
                          ],
                          const Divider(height: 16),
                          _buildPaymentDetailRow('Descuento por pronto pago', payment['earlyPayDiscount']),
                          const Divider(height: 16),
                          _buildPaymentDetailRow('Gasto de cobranza', payment['collectionFee']),
                          if (isNext) ...[
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PaymentScreen(preselectedCredit: _credit),
                                    ),
                                  );
                                },
                                child: const Text('Pagar esta cuota', style: TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildPayButton() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentScreen(preselectedCredit: _credit),
                ),
              );
            },
            child: const Text(
              'Pagar cuota actual',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentHistoryScreen(),
                ),
              );
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF1C2546),
              side: const BorderSide(color: Color(0xFF1C2546)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Ver historial de pagos',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildPaymentDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
      ],
    );
  }
}

class PaymentHistoryScreen extends StatelessWidget {
  const PaymentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de pagos'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 8,
        itemBuilder: (context, index) {
          return _buildPaymentItem(context, index);
        },
      ),
    );
  }

  Widget _buildPaymentItem(BuildContext context, int index) {
    final payments = [
      {
        'quota': 'Cuota 8',
        'invoice': 'MCSCR-3216-Q8',
        'date': '15 Feb 2026',
        'time': '14:32:05',
        'amount': '\$350.000',
        'status': 'Pagado',
        'method': 'PSE - Bancolombia',
        'totalCredit': '\$4.500.000',
        'remainingBalance': '\$5.600.000',
        'pendingQuotas': '16',
        'paidQuotas': '8',
        'interestRate': '2.5% mensual',
      },
      {
        'quota': 'Cuota 7',
        'invoice': 'MCSCR-3216-Q7',
        'date': '15 Ene 2026',
        'time': '10:15:22',
        'amount': '\$350.000',
        'status': 'Pagado',
        'method': 'PSE - Bancolombia',
        'totalCredit': '\$4.500.000',
        'remainingBalance': '\$5.950.000',
        'pendingQuotas': '17',
        'paidQuotas': '7',
        'interestRate': '2.5% mensual',
      },
      {
        'quota': 'Cuota 6',
        'invoice': 'MCSCR-3216-Q6',
        'date': '15 Dic 2025',
        'time': '09:45:11',
        'amount': '\$350.000',
        'status': 'Pagado',
        'method': 'PSE - Bancolombia',
        'totalCredit': '\$4.500.000',
        'remainingBalance': '\$6.300.000',
        'pendingQuotas': '18',
        'paidQuotas': '6',
        'interestRate': '2.5% mensual',
      },
      {
        'quota': 'Cuota 5',
        'invoice': 'MCSCR-3216-Q5',
        'date': '15 Nov 2025',
        'time': '16:20:33',
        'amount': '\$350.000',
        'status': 'Pagado',
        'method': 'PSE - Bancolombia',
        'totalCredit': '\$4.500.000',
        'remainingBalance': '\$6.650.000',
        'pendingQuotas': '19',
        'paidQuotas': '5',
        'interestRate': '2.5% mensual',
      },
      {
        'quota': 'Cuota 4',
        'invoice': 'MCSCR-3216-Q4',
        'date': '15 Oct 2025',
        'time': '11:08:45',
        'amount': '\$350.000',
        'status': 'Pagado',
        'method': 'PSE - Bancolombia',
        'totalCredit': '\$4.500.000',
        'remainingBalance': '\$7.000.000',
        'pendingQuotas': '20',
        'paidQuotas': '4',
        'interestRate': '2.5% mensual',
      },
      {
        'quota': 'Cuota 3',
        'invoice': 'MCSCR-3216-Q3',
        'date': '15 Sep 2025',
        'time': '13:55:02',
        'amount': '\$350.000',
        'status': 'Pagado',
        'method': 'PSE - Davivienda',
        'totalCredit': '\$4.500.000',
        'remainingBalance': '\$7.350.000',
        'pendingQuotas': '21',
        'paidQuotas': '3',
        'interestRate': '2.5% mensual',
      },
      {
        'quota': 'Cuota 2',
        'invoice': 'MCSCR-3216-Q2',
        'date': '15 Ago 2025',
        'time': '08:30:17',
        'amount': '\$350.000',
        'status': 'Pagado',
        'method': 'PSE - Davivienda',
        'totalCredit': '\$4.500.000',
        'remainingBalance': '\$7.700.000',
        'pendingQuotas': '22',
        'paidQuotas': '2',
        'interestRate': '2.5% mensual',
      },
      {
        'quota': 'Cuota 1',
        'invoice': 'MCSCR-3216-Q1',
        'date': '15 Jul 2025',
        'time': '15:42:09',
        'amount': '\$350.000',
        'status': 'Pagado',
        'method': 'PSE - Bancolombia',
        'totalCredit': '\$4.500.000',
        'remainingBalance': '\$8.050.000',
        'pendingQuotas': '23',
        'paidQuotas': '1',
        'interestRate': '2.5% mensual',
      },
    ];
    final payment = payments[index];

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => _showPaymentDetail(context, payment),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.withAlpha(26),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.check_circle, color: Colors.green),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      payment['quota']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      payment['date']!,
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    payment['amount']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    payment['status']!,
                    style: const TextStyle(color: Colors.green, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPaymentDetail(BuildContext context, Map<String, String> payment) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.75,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Detalle del pago',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.green.withAlpha(26),
                        borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.check_circle, color: Colors.green, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          payment['status']!,
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF28D16).withAlpha(26),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      payment['quota']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1C2546),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      payment['amount']!,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF28D16),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  children: [
                    _buildDetailRow('Factura', payment['invoice']!),
                    const Divider(height: 20),
                    _buildDetailRow('Fecha de pago', payment['date']!),
                    const Divider(height: 20),
                    _buildDetailRow('Hora', payment['time']!),
                    const Divider(height: 20),
                    _buildDetailRow('Método de pago', payment['method']!),
                    const Divider(height: 20),
                    _buildDetailRow('Total del crédito', payment['totalCredit']!),
                    const Divider(height: 20),
                    _buildDetailRow('Saldo restante', payment['remainingBalance']!),
                    const Divider(height: 20),
                    _buildDetailRow('Cuotas pagadas', payment['paidQuotas']!),
                    const Divider(height: 20),
                    _buildDetailRow('Cuotas pendientes', payment['pendingQuotas']!),
                    const Divider(height: 20),
                    _buildDetailRow('Tasa de interés', payment['interestRate']!),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red.withAlpha(26),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.picture_as_pdf, color: Colors.red, size: 28),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Comprobante de pago',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${payment['invoice']}.pdf',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showToast(context, 'Descargando ${payment['invoice']}.pdf', type: ToastType.info);
                      },
                      icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1C2546),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.download,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    ),
  );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey.shade600, fontSize: 14)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        ],
      ),
    );
  }
}
