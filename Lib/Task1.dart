// simple Clinic System
enum Specialization {General, Pediatric, Surgery }

abstract class Person
{
  String? name;
  int? age;
  static int countPerson=0;
  Person({required this.name, required this.age})
  {countPerson++;}
  void showDetails();
}

class Insurable{
  applyInsurance(){}
}

class Doctor extends Person{
  Specialization? specialization;
  Doctor({required super.name,required super.age,required this.specialization});
  @override
  void showDetails()
  {
   print('Dr Name:$name\nAge:$age\tSpecialization:${specialization?.name}'); 
  }
}

class Patient extends Person implements Insurable
{
  String? insuranceCompany;
  Patient({required super.name,required super.age,this.insuranceCompany});

  @override
  applyInsurance(){
    if(insuranceCompany==null)
    print('$name\thas no insurance');
    else
    print('$name\tthe insurance company is:$insuranceCompany');
  }
  @override
  void showDetails(){
     if(insuranceCompany==null)
     print('Patient Name:$name\nAge:$age\thas no insurance'); 
     else
    print('Patient Name:$name\nAge:$age\tthe insurance company is:$insuranceCompany'); 
  }
}

void main()
{
  List<Person> clintSystem=[
    Doctor(name:'Amr', age:25,specialization:Specialization.General),
    Doctor(name: 'kerilous', age: 28, specialization: Specialization.Surgery),
    Patient(name:'Omar', age:21),
    Patient(name: 'Khalid', age:24,insuranceCompany:"Allianz")
  ];
  for(var person in clintSystem){
    person.showDetails();
    print('-'*25);
  }
  print('number of person in clintSystem: ${Person.countPerson}\n');
}