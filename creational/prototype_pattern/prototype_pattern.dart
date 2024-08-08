// simply use copy with constructor

abstract class EmployeeProtype {
  EmployeeProtype clone();
}

class Employee extends EmployeeProtype {
  String name;
  String designation;
  List<String> tags;

  Employee(this.name, this.designation, this.tags);

  @override
  EmployeeProtype clone() {
    return Employee(name, designation, tags);
  }

  Employee copyWith(List<String> tags) {
    return Employee(name, designation, tags);
  }

  @override
  String toString() {
    return 'Employee{name: $name, designation: $designation}, tags: ${tags.asMap()}';
  }
}

void clientRun() {
  // probably different prototypes can provide differnt copy logic.
  // or we can do it in the base class itself.
  Employee employee = Employee('john', 'developer', ['A']);

  print(employee.toString());

  Employee employee2 = Employee('jenifer', employee.designation, employee.tags);

  employee2.tags.add('B');
  // employee2.name = 'Jenifer';
  print(employee2.toString());

  Employee employee3 = employee.clone() as Employee;
  employee3.name = 'jane';
  print(employee3.toString());
  print(employee.toString());
}

void main() {
  clientRun();
}
