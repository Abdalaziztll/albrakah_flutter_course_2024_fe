void main(List<String> args) {


  Set product = {30,20,50};
  product.add(3);
  print(product);


  Map<String, Map> nestedMap = {
    "address": {
      "street": "Kulas Light",
      "suite": "Apt. 556",
      "city": "Gwenborough",
      "zipcode": "92998-3874",
      "geo": {
        "lat": "-37.3159",
        "lng": "81.1496",
      }
    },
  };
  print(nestedMap['address']!['geo']['lng']);
  print(nestedMap.values.elementAt(0).values.elementAt(4).values.elementAt(1));

  int counter = 0;
  print(counter);

  List<num> names = [30, 2.5, -3.6];
  names.add(40);
  names.shuffle();
  print(names);

  Map<String, num> marks = {"Math 3": 60, "Physics": 100, "E": 90};
  print(marks.keys.elementAt(0));
  print(marks.values.elementAt(2));

  List<Map<String, num>> MapOnList = [
    {
      "Hello": 40,
      "There": 90,
      "Facebook": 70,
    },
    {
      "Now": 80,
      "A": 100,
      "Dayes": 30,
    }
  ];

  print(MapOnList.elementAt(0).keys.elementAt(2));
  print(MapOnList.elementAt(1)['A']);
  var temp = 37;
  // const age;
  // age = 20;

  final age;
  age = 20;
  var result = addValues(30, secondNumber: 30, thirdNumber: 50);
  print(result);
}

int addValues(int firstNumber,
    {int secondNumber = 0, required int thirdNumber}) {
  int offsetNumber = 30;
  return firstNumber + secondNumber + thirdNumber + offsetNumber;
}
