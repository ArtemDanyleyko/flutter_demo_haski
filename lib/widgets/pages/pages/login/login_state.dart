class LoginState {
  final bool isLoading;
  final String? error;
  final bool canLogin;

  const LoginState({
    this.isLoading = false,
    this.error,
    this.canLogin = false,
  });

  LoginState copyWith({
    bool? isLoading,
    String? error,
    bool? canLogin,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      canLogin: canLogin ?? this.canLogin,
    );
  }
}
