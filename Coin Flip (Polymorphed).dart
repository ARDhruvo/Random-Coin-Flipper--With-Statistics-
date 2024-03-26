/* 
 * @author Kashikizu
 * Initial Completion Date: 23/03/2024 (dd/mm/yyyy)
 * Branch Creation Date: 27/3/2024
 */

import 'dart:math';

void main() {
  //flips coin
  Coin flip = Coin();
  flip.ocd();
}

class Coin extends CoinCalc {
  int heads = 0, tails = 0; //Counter variables for stats
  //Coin flip
  Coin() {
    int f = Random().nextInt(10); //ramdom number of coins flipped
    print("Number of coins flipped: $f");
    toss(f);
  }

  //Toss things
  void toss(int n) {
    for (int i = 0; i < n; i++) {
      int s = i + 1; //Gets the random value for flipping
      flip("Heads", "Tails", s, result); //Modified polymorphable flip
    }
    ocd();
    stats(heads, tails, n);
  }

  void flip(String a, b, int s, void func(String a, int s)) {
    int res = rand() % 2;
    if (res == 0) {
      func(a, s);
      heads++;
    } else {
      func(b, s);
      tails++;
    }
  }

  void result(String face, int s) {
    print("Flip $s: $face");
  }

  void ocd() {
    print("");
  }
}

class CoinCalc {
  CoinCalc() {}

  //Checks and calls percentage
  void stats(int h, t, f) {
    if (h == t) {
      if (h == 0) {
        print("No coins were flipped");
      } else {
        print("Both faces were flipped 50% of the time");
      }
    } else if (h > t) {
      percCalc(h, f, "Heads");
    } else {
      percCalc(t, f, "Tails");
    }
  }

  //Calculating statistics
  void percCalc(int face, flips, String faceName) {
    double percFace = (face / flips) * 100;
    double percRound = double.parse(percFace.toStringAsFixed(2));
    print("Most flipped side is $faceName");
    print("$faceName was flipped $face times");
    print("$faceName was flipped $percRound% of the time");
  }

  int rand() {
    int value = Random().nextInt(6969);
    return value;
  }
}
