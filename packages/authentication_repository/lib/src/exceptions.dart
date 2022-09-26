class SignUpWithEmailAndPassFailure implements Exception {
  const SignUpWithEmailAndPassFailure([
    this.message = 'An unknown exception occured',
  ]);

  factory SignUpWithEmailAndPassFailure.fromCode(String code) {
    switch (code) {
      case 'invalid email':
        return const SignUpWithEmailAndPassFailure("Email not valid");
      case 'user-disabled':
        return const SignUpWithEmailAndPassFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const SignUpWithEmailAndPassFailure(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPassFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const SignUpWithEmailAndPassFailure(
          'Please enter a stronger password.',
        );
      default:
        return const SignUpWithEmailAndPassFailure();
    }
  }

  final String message;
}

class LogInWithEmailAndPassFailure implements Exception {
  /// {@macro log_in_with_email_and_password_failure}
  const LogInWithEmailAndPassFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithEmailAndPassFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInWithEmailAndPassFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const LogInWithEmailAndPassFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithEmailAndPassFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithEmailAndPassFailure(
          'Incorrect password, please try again.',
        );
      default:
        return const LogInWithEmailAndPassFailure();
    }
  }

  final String message;
}

class LogOutFailure implements Exception {}
