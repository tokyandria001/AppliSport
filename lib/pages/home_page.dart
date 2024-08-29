import 'package:flutter/material.dart';
import 'package:sport/pages/entrainement.dart';
import 'package:sport/pages/calendrier.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required List data});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<List<String>> _trainingData = [];

  void _setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Center(
          child: Text(
            "MoveMaster",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: "Poppins",
            ),
          ),
        ),
      ),


      body: _currentIndex == 0 ? _buildHomePage() :
            _currentIndex == 1 ? TrainingForm(trainingData: _trainingData) : Entrainement(data: _trainingData),


      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(fontFamily: "Poppins"),
        unselectedLabelStyle: const TextStyle(fontFamily: "Poppins"),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.deepPurpleAccent,
        currentIndex: _currentIndex,
        onTap: _setCurrentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Planification'),
          BottomNavigationBarItem(icon: Icon(Icons.sports_handball_sharp), label: 'Entraînement(s)'),
        ],
        backgroundColor: Colors.black,
      ),

      backgroundColor: Colors.black,
    );
  }


  Widget _buildHomePage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset("assets/images/sprint.jpeg"),
          const Padding(padding: EdgeInsets.only(bottom: 20)),
          const Text(
            '"Prenez soin de votre corps, c`est le seul endroit où vous êtes obligés de vivre" - Jim Rohn',
            style: TextStyle(fontSize: 20, fontFamily: "Italic", color: Colors.white),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 20)),
          const Text(
            "Bienvenue sur MoveMaster, l'application où tu peux plannifier tes séances d'entraînements. Quelque soit ta discipline, il est important de maintenir ton corps en pleine forme, non seulement pour lui mais aussi pour ton MINDSET !",
            style: TextStyle(fontSize: 20, fontFamily: "Poppins", color: Colors.white),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 10)),

          Center(child: Image.asset('assets/images/cardio.jpeg'),),
          const Padding(padding: EdgeInsets.only(bottom: 10)),

          Center(child: Image.asset('assets/images/musculation.jpeg'),),
          const Padding(padding: EdgeInsets.only(bottom: 10)),

          Center(child: Image.asset('assets/images/box.webp'),),
          const Padding(padding: EdgeInsets.only(bottom: 20)),
        ],
      ),
    );
  }
}
