void main() {
  Human person = Human(
      name: "Noor", color: "white", isDead: false, length: 180, weight: 70);

  person.name = "Hala";

  print(person.name);
  person.printInforamtion();
  String status = person.getStatus();
  print(status);

  Employee accountant = Employee(
      workPosition: "account",
      name: "Sami",
      color: "white",
      weight: 80,
      isDead: true,
      length: 180);
  accountant.printer();
}

class Human {
  String name;
  String color;
  num length;
  num weight;
  bool isDead;

  Human(
      {required this.name,
      required this.color,
      required this.isDead,
      required this.length,
      required this.weight});

  printInforamtion() {
    print(this.name +
        " " +
        this.color +
        " " +
        this.isDead.toString() +
        " " +
        this.length.toString() +
        " " +
        this.weight.toString());
  }

  String getStatus() {
    if (this.isDead) {
      return "Sorry , That person is Dead";
    } else {
      return "Yes , That person is a Live";
    }
  }
}

class Employee extends Human {
  String workPosition;
  Employee(
      {required this.workPosition,
      required super.name,
      required super.color,
      required super.weight,
      required super.isDead,
      required super.length});

  printer() {
    super.printInforamtion();
    print(this.workPosition);
  }
}
