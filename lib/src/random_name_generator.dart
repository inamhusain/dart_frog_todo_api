import 'dart:math';

///Class of RandomNameGenerator.
class RandomNameGenerator {
  final List<String> _namesList = [
    'Obadiah Reeves',
    'Todd Cantrell',
    'Hale Haynes',
    'Vince Hoyles',
    'Wayne Banks',
    'Dane Kain',
    'Russ Elliott',
    'Camille Hodgson',
    'Johnny Palmer',
    'Tony Haynes'
  ];

  ///getter List<String> of all random names
  List<String> get nameList => _namesList;

  ///get random name
  String getName() {
    final _randomNumber = Random().nextInt(_namesList.length);
    return _namesList[_randomNumber];
  }
}
