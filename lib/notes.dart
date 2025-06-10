import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotesScreen extends StatefulWidget { // Cambiado de 'Note' a 'NotesScreen'
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState(); // Cambiado de '_NoteState' a '_NotesScreenState'
}

class _NotesScreenState extends State<NotesScreen> { // Cambiado de '_NoteState' a '_NotesScreenState'
  // Controladores para los nuevos campos de texto
  final TextEditingController _idSucursalesController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _ciudadController = TextEditingController();
  final TextEditingController _gerenteController = TextEditingController();
  final TextEditingController _horarioAtencionController = TextEditingController();

  @override
  void dispose() {
    // Es importante liberar los controladores cuando el widget se destruye
    _idSucursalesController.dispose();
    _nombreController.dispose();
    _direccionController.dispose();
    _telefonoController.dispose();
    _ciudadController.dispose();
    _gerenteController.dispose();
    _horarioAtencionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notas - Diego Rodriguez", // Puedes cambiar este título si prefieres "Gestión de Sucursales" o similar
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 68, 106, 141),
        elevation: 0,
      ),
      body: Column( // Eliminado SingleChildScrollView y Column directamente en el body
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding( // Añadido Padding alrededor de los elementos de entrada
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Gestión de Sucursales", // Cambiado de "My Notes" a algo más relevante
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 75, 103, 163),
                  ),
                ),
                const SizedBox(height: 30),

                // Campo para ID Sucursales
                TextField(
                  controller: _idSucursalesController,
                  keyboardType: TextInputType.number, // Sugerencia de teclado numérico
                  decoration: InputDecoration(
                    hintText: "ID Sucursales",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: const Color.fromARGB(255, 92, 114, 153), width: 2.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  ),
                ),
                const SizedBox(height: 20),

                // Campo para Nombre
                TextField(
                  controller: _nombreController,
                  decoration: InputDecoration(
                    hintText: "Nombre",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: const Color.fromARGB(255, 92, 114, 153), width: 2.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  ),
                ),
                const SizedBox(height: 20),

                // Campo para Dirección
                TextField(
                  controller: _direccionController,
                  decoration: InputDecoration(
                    hintText: "Dirección",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: const Color.fromARGB(255, 92, 114, 153), width: 2.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  ),
                ),
                const SizedBox(height: 20),

                // Campo para Teléfono
                TextField(
                  controller: _telefonoController,
                  keyboardType: TextInputType.phone, // Sugerencia de teclado telefónico
                  decoration: InputDecoration(
                    hintText: "Teléfono",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: const Color.fromARGB(255, 92, 114, 153), width: 2.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  ),
                ),
                const SizedBox(height: 20),

                // Campo para Ciudad
                TextField(
                  controller: _ciudadController,
                  decoration: InputDecoration(
                    hintText: "Ciudad",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: const Color.fromARGB(255, 92, 114, 153), width: 2.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  ),
                ),
                const SizedBox(height: 20),

                // Campo para Gerente
                TextField(
                  controller: _gerenteController,
                  decoration: InputDecoration(
                    hintText: "Gerente",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: const Color.fromARGB(255, 92, 114, 153), width: 2.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  ),
                ),
                const SizedBox(height: 20),

                // Campo para Horario de Atención
                TextField(
                  controller: _horarioAtencionController,
                  decoration: InputDecoration(
                    hintText: "Horario de Atención",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: const Color.fromARGB(255, 92, 114, 153), width: 2.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  ),
                ),
                const SizedBox(height: 40),

                ElevatedButton(
                  onPressed: () {
                    // Aquí puedes acceder a los valores de los campos:
                    String idSucursales = _idSucursalesController.text;
                    String nombre = _nombreController.text;
                    String direccion = _direccionController.text;
                    String telefono = _telefonoController.text;
                    String ciudad = _ciudadController.text;
                    String gerente = _gerenteController.text;
                    String horarioAtencion = _horarioAtencionController.text;

                    // Guardar los datos en Firestore
                    FirebaseFirestore.instance.collection('notes').add({
                      'ID_Sucursal': idSucursales.trim(),
                      'Nombre': nombre.trim(),
                      'Dirección': direccion.trim(),
                      'Teléfono': telefono.trim(),
                      'Ciudad': ciudad.trim(),
                      'Gerente': gerente.trim(),
                      'Horario de Atención': horarioAtencion.trim(),
                      'timestamp': FieldValue.serverTimestamp(), // Añadir un timestamp para ordenar
                    }).then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Datos de sucursal guardados con éxito')),
                      );
                      // Limpiar los controladores después de guardar
                      _idSucursalesController.clear();
                      _nombreController.clear();
                      _direccionController.clear();
                      _telefonoController.clear();
                      _ciudadController.clear();
                      _gerenteController.clear();
                      _horarioAtencionController.clear();
                    }).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error al guardar: $error')),
                      );
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 192, 216, 247),
                    foregroundColor: const Color.fromARGB(255, 62, 81, 122),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 3,
                  ),
                  child: const Text(
                    "Guardar Sucursal", // Texto del botón actualizado
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20), // Espacio entre el botón y la lista

          // StreamBuilder para mostrar las sucursales
          Expanded( // Envuelve ListView.builder en Expanded para que ocupe el espacio restante
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('notes').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No hay sucursales registradas.'));
                }

                // Si hay datos, construir la lista
                final notes = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    final note = notes[index];
                    final data = note.data() as Map<String, dynamic>;
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        title: Text(
                          data['Nombre'] ?? 'Sin Nombre',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ID Sucursal: ${data['ID_Sucursal'] ?? 'N/A'}'),
                            Text('Dirección: ${data['Dirección'] ?? 'N/A'}'),
                            Text('Teléfono: ${data['Teléfono'] ?? 'N/A'}'),
                            Text('Ciudad: ${data['Ciudad'] ?? 'N/A'}'),
                            Text('Gerente: ${data['Gerente'] ?? 'N/A'}'),
                            Text('Horario: ${data['Horario de Atención'] ?? 'N/A'}'),
                          ],
                        ),
                        // Puedes añadir acciones como editar o eliminar aquí
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.redAccent),
                          onPressed: () {
                            // Implementar lógica para eliminar la nota
                            FirebaseFirestore.instance.collection('notes').doc(note.id).delete().then((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Sucursal eliminada')),
                              );
                            }).catchError((error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Error al eliminar: $error')),
                              );
                            });
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
