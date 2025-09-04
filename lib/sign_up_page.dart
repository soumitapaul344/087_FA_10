import 'package:flutter/material.dart';
import 'package:sign_in_up/auth/auth_service.dart';
import 'sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassController = TextEditingController();
  final authService = AuthService();

  void signUp() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPassController.text;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Passwords don't match!")));
      return;
    }

    try {
      await authService.signUpWithEmailPassword(email, password);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Registration Successful")),
        );
        Navigator.pop(context); // back to SignIn page
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Registration Failed: $e")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset("images/picture.jpg", fit: BoxFit.cover),
          ),
          Column(
            children: [
              const Spacer(flex: 1),
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Text(
                            "Create Account",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Email
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),

                          // Password
                          TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),

                          // Confirm Password
                          TextField(
                            controller: _confirmPassController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Confirm Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),

                          // Sign Up Button
                          SizedBox(
                            width: 200,
                            height: 45,
                            child: ElevatedButton(
                              onPressed: signUp,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),

                          // SignIn connection
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account? "),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold,
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
