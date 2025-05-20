class RegistrationState {}

class RegistrationInitialState extends RegistrationState {}

class RegistrationLoadingState extends RegistrationState {}

class RegistrationFailureState extends RegistrationState {
  final String errorMessage;
  RegistrationFailureState(this.errorMessage);
}

class UnderVerificationState extends RegistrationState {}

class VerifiedState extends RegistrationState {}

class UnverifiedState extends RegistrationState {}
