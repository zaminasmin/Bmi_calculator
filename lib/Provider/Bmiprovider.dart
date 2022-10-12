 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BmiProvider with ChangeNotifier{
    int weight=50;
    int age=30;
    int hight=180;
    late double bmi;
    bool gender=false;

    bool get getgender{
        return gender;
    }
    male(){
        gender=true;
        notifyListeners();
    }
    female(){
        gender=false;
        notifyListeners();
    }
    int get gethight_{
        return hight;
    }


    int get getweight{
        return weight;
    }
    int get getage{
        return age;
    }
    addage(){
        age++;
        notifyListeners();
    }
    minage(){
        age--;
        notifyListeners();
    }
    addweight(){
        weight++;
        notifyListeners();
    }
    minweight(){
        weight--;
        notifyListeners();
    }
}