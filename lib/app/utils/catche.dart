class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure([this.message = 'Error Terdeteksi']);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            'Password yang digunakan sangat pendek');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure('Email Tidak Valid');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure('Email Sudah Digunakan');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
            'User Disable, Hubungi Admin');
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
