class Glob {
  //One instance, needs factory
  static Glob _instance;
  factory Glob() => _instance ??= new Glob._();
  Glob._();
  //

  String account = 'johanacct1';

  String getServerUrl() {
    return 'http://192.168.1.60';
  }

  String getAccountUrl() {
    return getServerUrl() + '/accounts/' + account;
  }
}
