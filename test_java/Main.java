
class Main {
  public static void main(String[] args) {
    System.out.println("Hello world!");
  }

  int addTwoNumbers(int a, int b) {
    return a + b;
  }

  List<Person> addPersonToList(Person person, List<Person> list) {
    list.add(person);
    return list;
  }

  Person createPerson(String name, int age) {
    return new Person(name, age);
  }

  void printPerson(Person person) {
    System.out.println(person.getName() + " is " + person.getAge() + " years old.");
  }

  void findPersonByName(String name, List<Person> list) {
    for (Person person : list) {
      if (person.getName().equals(name)) {
        return person;
      }
    }
    return null;
  }


}


