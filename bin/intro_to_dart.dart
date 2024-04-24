// ignore_for_file: public_member_api_docs, sort_constructors_first

// Future<String> data = "Hello";

Future<String> getData(Function onTap) async {
  await Future.delayed(Duration(seconds: 10));
  onTap("E-t");
  return 'Hello';
}

void main() async {
  Squere first = Squere(demision: 15);
  Squere second = first;

  Function printer = (String name) => print(name);
  print(printer.toString());

  Future<String> temp = getData(printer);

  // printer('E-T');

  if (first == second) {
    print("Yes");
  } else {
    print("No");
  }
  print(await temp);
  // Squere firstSquere = Squere(demision: 20);
  // firstSquere.draw();
  // // Circle firstCircle = Squere(demision: 2);
  // Shape shape = Squere(demision: 20);

  // // firstCircle.draw();
  // print(shape);
  // shape.draw();

  // ? The rest of Example
  // echo(creature: Cat());
  // Traingle traingl = TraingleWith90Angel(edge1: 10, edge2: 15);
  // print(traingl.toString());
}

abstract class Shape {
  draw();

  printer() {
    print("");
  }
}

class Traingle extends Shape {
  int edge1;
  int edge2;
  int angle;

  Traingle({
    required this.edge1,
    required this.edge2,
    required this.angle,
  });

  @override
  draw() {
    print("I am a Traingle");
  }

  // @override
  // String toString() {
  //   return 'Traingle(edge1: $edge1, edge2: $edge2, angle: $angle)';
  // }
}

class TraingleWith90Angel extends Traingle {
  TraingleWith90Angel(
      {required super.edge1, required super.edge2, super.angle = 90});

  @override
  draw() {
    print("I am a TRaingle with 90 Angle");
  }
}

class Squere extends Shape {
  int demision;

  Squere({required this.demision});

  @override
  draw() {
    print("I am a Squere");
  }

  @override
  bool operator ==(covariant Squere other) {
    if (identical(this, other)) return true;

    return other.demision == demision;
  }

  @override
  int get hashCode => demision.hashCode;
}

class Circle extends Shape {
  int radius;
  Circle({required this.radius});

  @override
  draw() {
    print("I am a Circle");
  }
}
// ? Example to See the benefit of Abstract
// abstract class Animal {}

// class Cat extends Animal {}

// class Dog extends Animal {}

// class Horse extends Animal {}

// echo({required Animal creature}) {
//   if (creature.runtimeType == Dog) {
//     print("this is a dog");
//   } else if (creature.runtimeType == Cat) {
//     print("this is a cat");
//   } else {
//     print("this is a Horse");
//   }
// }

abstract class A {
  hello() {
    print("object");
  }

  world();
}

class B extends A {
  @override
  hello() {
    print("dsajdkljas;d");
  }

  @override
  world() {
    print("world");
  }
}
