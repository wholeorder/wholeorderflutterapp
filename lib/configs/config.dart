class Config {
  static const String apiUrl = "https://v2.proboutik.io/api/public/boutik-plus";
  /* endpoints */
  static const String villesApi = "/guest-request/get-cities";
  static const String tranchesAgesApi = "/guest-request/get-tranches";
  static const String situationMatrimonialeApi =
      "/guest-request/get-situations";
  static const String priseChargesApi = "/guest-request/get-charges";
  static const String professionApi = "/guest-request/get-professions";

  /* authentification */
  static const String authMobileApi = "/auth/mobile-number";
  static const String authCodeApi = "/auth/code-auto";
  static const String registerApi = "/registration/register-data";

  /* sign in */
  static const String signInApi = "/auth/sign-in";
  static const String signInModificationApi = "/registration/edition-data";

  /* requests */
  static const String soldeApi = "/request/get-solde";
  static const String transactionApi = "/request/get-transactions";

  /* budget */
  static const String definebudget = "/request/define-budget";
  static const String requestbudget = "/request/budget";
}
