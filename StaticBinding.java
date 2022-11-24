class Person {

  public void speak() {

    System.out.println("Person speaks");
  }
}

class Teacher extends Person {

  @Override
  public void speak() {
    // TODO Auto-generated method stub
    super.speak();
  }

}

public class StaticBinding {

  public static void main(String args[]) {

    // Reference is of Person type and object is Teacher type

    Person obj = new Teacher();

    obj.speak();

    // Reference and object both are of Person type.

    Person obj2 = new Person();

    obj2.speak();
  }
}
