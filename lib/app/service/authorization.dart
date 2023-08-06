


class RegistrationW{
  /// Email / Phone
  /// Confirm
  /// Data User write and save
}
class LoginW{
  /// Login
  /// Logout
  /// Confirm
  /// Reset password
  /// Two factor authentication
}


//// Type Authentication


class AnonimusW implements RegistrationW, LoginW {}

class Email implements RegistrationW, LoginW {}

class Phone implements RegistrationW, LoginW {}

class Google implements RegistrationW, LoginW {}

