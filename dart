/*
class Person {
  String _name = "";
  int _age = 0;
  String desc = "";
  
  String get name => _name;
  int get age => _age;
  
  Person(this._name, this._age, {this.desc=''});

  void addOneYear() {
    _age++;
  }
}

void main() {
  var p = Person('이민욱', 24, desc: '사실은 임');
  
  

  print(p.age);
  print(p.name);

  p.addOneYear();
  print(p.age);
}
*/
/*
class Rectangle {
  num left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  num get right => left + width;
  set right(num value) => left = value - width;
  num get bottom => top + height;
  set bottom(num value) => top = value - height;
}

void main() {
  var r = Rectangle(5, 10, 15, 20);
  print([r.left, r.top, r.width, r.height]);
  print([r.right, r.bottom]);
  
  r.right = 15;
  r.bottom = 20;
  print([r.left, r.top, r.width, r.height]);
}
*/
/*
class Rectangle {
  num left, top;
  num right, bottom;
  
  Rectangle(this.left, this.top, this.right, this.bottom);
  
  num get width => right - left;
  set width(num value) => right = left + value;
  num get height => bottom - top;
  set height(num value) => bottom = top + value;
}

void main()
{
  var r = Rectangle(5, 10, 25, 35);
  print([r.left, r.top, r.right, r.bottom]);
  
  r.width = 10;
  r.height = 20;
}
*/
/*
class Hero {
  String name = '영웅';
  
  void run() {
    print('뛴다!');
  }
}

class SuperHero extends Hero {
  @override
  void run() {
    super.run();
    this.fly();
  }
  
  void fly() {
    print('난다!');
  }
}

void main()
{
  Hero normalHero = Hero();
  Hero superHero = SuperHero();
  
  print(normalHero.name);
  print(superHero.name);
  
  print('');
  
  normalHero.run();
  print('');
  superHero.run();
  
  List<Hero> heroes = [normalHero, superHero];
  heroes.forEach((hero) => hero.run());
  
  SuperHero hero = SuperHero();
  hero.run();
  hero.fly();
  print(hero.name);
}
*/
/*
abstract class Monster {
  void attack();
}

class Goblin implements Monster {
  @override
  void attack() => print('고블린 어택');
}

abstract class Flyable {
  void fly();
}

class Bat implements Monster {
  @override
  void attack() => print('할퀴기!');
  
  @override
  void fly() => print('난다!');
}

void main()
{
  Goblin m1 = Goblin();
  m1.attack();
  Bat m2 = Bat();
  m2.attack();
  m2.fly();
  
  print('');
  
  List<Monster> monsters = [m1, m2];
  monsters.forEach((m) {
    m.attack();
    
    if (m is Bat) {
      (m as Bat).fly();
    }
  });
}
*/
/*
enum LoginStatus { login, logout }
void main()
{
  LoginStatus status = LoginStatus.logout;
  print(status);
  
  switch (status) {
    case LoginStatus.login:
      print('로그인');
      break;
      
    case LoginStatus.logout:
      print('로그아웃');
      break;
  }
}
*/
/*
void main()
{
  var lottoNums = [5, 6, 11, 13, 17, 21];
  var countryMap = {'한국': '서울', '일본': '도쿄', '중국' : '북경'};
  var setNums = {1, 2, 3, 4, 5, 6};
  
  print(lottoNums[0]);
  print(countryMap['일본']);
  print(setNums.contains(5));
  
  lottoNums.add(45);
  print(lottoNums);
  
  countryMap['인도'] = '인디아';
  print(countryMap);
  
  setNums.add(6);
  print(setNums);
}
*/
void main()
{
  var lottoNums = [5, 6, 11, 13, 17, 21];
  
  lottoNums.forEach((num) {
    print(num);
  });
  
  lottoNums.forEach(print);
  
  var f = () => print('되네?');
  f();
}
