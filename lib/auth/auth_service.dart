import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  //sign in
  Future<AuthResponse> signInWithEmailPassword(
    String email,
    String password,
  ) async {
    //sign in korar jonno request
    return await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  //sign up
  Future<AuthResponse> signUpWithEmailPassword(
    String email,
    String password,
  ) async {
    return await _supabase.auth.signUp(email: email, password: password);
  }

  //sign out
  Future<void> singOut() async {
    return await _supabase.auth.signOut();
  }

  String? getCurrentUserEmail() {
    final session = _supabase.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }
}
