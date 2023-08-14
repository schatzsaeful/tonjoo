class AuthDto {
  int success;
  String token;
  int userId;

  AuthDto({
    this.success = 0,
    this.token = "",
    this.userId = 0,
  });
}
