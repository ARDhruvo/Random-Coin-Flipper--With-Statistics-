import 'dart:math';

void main() {
  //flips coin
  Flip flip = Flip();
  flip.ocd();
}

class Flip extends CoinCalc {
  //Coin flip
  Flip() {
    //ramdom number of coins flipped
    int f = Random().nextInt(10);
    print("Number of coins flipped: $f");
    toss(f);
  }

  //Toss things
  void toss(int n) {
    //counter variable
    int heads = 0, tails = 0;
    for (int i = 0; i < n; i++) {
      //Gets the random value for flipping
      int value = rand();
      int s = i + 1;
      if (value % 2 == 0) {
        heads++;
        print("Flip $s: Heads");
      } else {
        tails++;
        print("Flip $s: Tails");
      }
    }
    ocd();
    stats(heads, tails, n);
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
      percCalc(h, f, "Tails");
    }
  }

  //Calculating statistics
  void percCalc(int face, flips, String faceName) {
    double percFace = (face / flips) * 100;
    double percRound = double.parse(percFace.toStringAsFixed(2));
    print("Most flipped side is $faceName");
    print("$faceName was flipped $percRound% of the time");
  }

  int rand() {
    int value = Random().nextInt(10);
    return value;
  }
}
