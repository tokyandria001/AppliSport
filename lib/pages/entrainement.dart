import 'package:flutter/material.dart';

class Entrainement extends StatefulWidget {
  final List<List<String>> data;

  const Entrainement({super.key, required this.data});

  @override
  State<Entrainement> createState() => _EntrainementState();
}

class _EntrainementState extends State<Entrainement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/fond2.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              AppBar(
                title: const Text('Entraînements', style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.transparent,
                elevation: 0, 
              ),
              Expanded(
                child: widget.data.isEmpty
                    ? const Center(
                  child: Text(
                    "Aucun entraînement enregistré",
                    style: TextStyle(color: Colors.white, fontSize: 21, fontFamily: "Poppins"),
                  ),
                )
                    : ListView.builder(
                  itemCount: widget.data.length,
                  itemBuilder: (context, index) {
                    final training = widget.data[index];
                    return Dismissible(
                      key: Key(training[0] + index.toString()),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          widget.data.removeAt(index);
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Entraînement supprimé'),
                          ),
                        );
                      },
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      child: ListTile(
                        title: Text(
                          training[0],
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          'Type: ${training[1]} - Date: ${training[2]}',
                          style: const TextStyle(color: Colors.white70),
                        ),
                        tileColor: Colors.grey[800]?.withOpacity(0.8), 
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
