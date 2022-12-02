abstract class AppAssetInterface {
  abstract final String path;
}

enum AppAssetImage implements AppAssetInterface {
  city1('$_generalPath/cities/city1.jpg'),
  city2('$_generalPath/cities/city2.jpg'),
  city3('$_generalPath/cities/city3.jpg'),
  city4('$_generalPath/cities/city4.jpg'),
  city5('$_generalPath/cities/city5.webp'),
  city6('$_generalPath/cities/city6.jpg'),
  mountain1('$_generalPath/mountains/mountain1.webp'),
  mountain2('$_generalPath/mountains/mountain2.webp'),
  mountain3('$_generalPath/mountains/mountain3.jpg'),
  mountain4('$_generalPath/mountains/mountain4.jpg'),
  mountain5('$_generalPath/mountains/mountain5.jpg'),
  mountain6('$_generalPath/mountains/mountain6.jpeg');

  @override
  final String path;

  const AppAssetImage(this.path);

  static const _generalPath = 'assets/';
}
