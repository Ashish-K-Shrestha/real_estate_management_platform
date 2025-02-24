import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Successful!'),
          backgroundColor: Color(0xFF00796B),
          duration: Duration(seconds: 2),
        ),
      );

      Future.delayed(const Duration(seconds: 1), () {
        // Replace with actual navigation
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Keep background clean
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo with gradient background
                Container(
                  height: 180,
                  width: 180,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF00796B), // Teal
                        Color(0xFF0288D1) // Blue
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset('assets/images/logo1.png'),
                  ),
                ),

                const SizedBox(height: 20),

                // Login title
                const Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00796B),
                  ),
                ),
                const SizedBox(height: 30),

                // Login Form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Email input
                      _buildInputField(
                        controller: _emailController,
                        label: 'Email',
                        icon: Icons.email,
                        isPassword: false,
                        validator: _validateEmail,
                      ),
                      const SizedBox(height: 15),

                      // Password input
                      _buildInputField(
                        controller: _passwordController,
                        label: 'Password',
                        icon: Icons.lock,
                        isPassword: true,
                        validator: _validatePassword,
                      ),
                      const SizedBox(height: 10),

                      // Forget Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(color: Color(0xFF0288D1)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Sign in button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _handleLogin,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00796B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: const Text(
                            'Sign in',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Or sign in with
                      const Text(
                        'Or sign in with',
                        style: TextStyle(color: Color(0xFF0288D1)),
                      ),
                      const SizedBox(height: 10),

                      // Social media buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSocialButton('Google', Colors.red, Icons.email),
                          const SizedBox(width: 10),
                          _buildSocialButton('Facebook',
                              const Color(0xFF0288D1), Icons.facebook),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Sign up
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don’t have an account? '),
                          GestureDetector(
                            onTap: () {
                              // Navigate to Sign Up
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Color(0xFF00796B),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Input field builder
  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required bool isPassword,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword ? !_isPasswordVisible : false,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        prefixIcon: Icon(icon, color: const Color(0xFF00796B)),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: const Color(0xFF0288D1),
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
            : null,
      ),
      validator: validator,
    );
  }

  // Social button builder
  Widget _buildSocialButton(String name, Color color, IconData icon) {
    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(
        backgroundColor: color,
        radius: 20,
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  // Validation Functions
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }
}
