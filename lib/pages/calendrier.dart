import 'package:flutter/material.dart';
import 'package:sport/pages/entrainement.dart';

class TrainingForm extends StatefulWidget {
  final List<List<String>> trainingData;

  const TrainingForm({super.key, required this.trainingData});

  @override
  _TrainingFormState createState() => _TrainingFormState();
}

class _TrainingFormState extends State<TrainingForm> {
  final _formKey = GlobalKey<FormState>();
  String _selectedType = 'Musculation';
  DateTime? _selectedDate;
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/fond1.jpeg'), 
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _descriptionController,
                        decoration: InputDecoration(
                          labelText: 'Description de l\'entraînement',
                          labelStyle: const TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.8),
                        ),
                        style: const TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer une description';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),
                      DropdownButtonFormField<String>(
                        value: _selectedType,
                        decoration: InputDecoration(
                          labelText: 'Type d\'entraînement',
                          labelStyle: const TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.8),
                        ),
                        dropdownColor: Colors.grey[800],
                        style: const TextStyle(color: Colors.white),
                        items: <String>['Musculation', 'Cardio', 'Combat', 'Natation'].map((String type) {
                          return DropdownMenuItem<String>(
                            value: type,
                            child: Text(
                              type,
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedType = newValue!;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez sélectionner un type d\'entraînement';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              _selectedDate == null
                                  ? 'Aucune date sélectionnée'
                                  : 'Date : ${_selectedDate!.toLocal().toString().split(' ')[0]}',
                              style: const TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101),
                              );
                              if (pickedDate != null && pickedDate != _selectedDate) {
                                setState(() {
                                  _selectedDate = pickedDate;
                                });
                              }
                            },
                            child: const Text('Choisir la date', style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              final List<String> data = [
                                _descriptionController.text,
                                _selectedType,
                                _selectedDate?.toLocal().toString().split(' ')[0] ?? 'Non spécifiée',
                              ];

                              widget.trainingData.add(data);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Entrainement(data: widget.trainingData),
                                ),
                              );
                            }
                          },
                          child: const Text('Ajouter', style: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
