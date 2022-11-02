import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyAppsku(),
    );
  }
}

class MyAppsku extends StatefulWidget {
  const MyAppsku({Key? key}) : super(key: key);

  @override
  State<MyAppsku> createState() => _MyAppskuState();
}

class _MyAppskuState extends State<MyAppsku> {
  TextEditingController nota =new TextEditingController();
  TextEditingController Nama =new TextEditingController();
  TextEditingController jenis = new TextEditingController();
  TextEditingController date = new TextEditingController();
  TextEditingController jumlah = new TextEditingController();
  List<String> jenisPembeli = ["Biasa", "Pelanggan", "Pelanggan Istimewa"];
  int? _value = 1;
  bool _checkBoxVal = true;
  bool _lights = false;
  String nJenis = "Biasa";
  int? nilaiJenis;
  double _currentSliderValue = 20;

  void pilihKota(String value){ //menampilkan kota yang dipilih
    setState(() {
      nJenis = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('1462000282'),
        actions: <Widget>[
          IconButton(onPressed: (){}, icon:Icon(Icons.people)),
          IconButton(onPressed: (){}, icon: Icon(Icons.home))
        ],
        ),
      body: SingleChildScrollView(
        child: Form(
          
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'gambar/potoku.jpeg',
                  height: 200,
                  width: 200,
                ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('No Nota'),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 40),
                        width: 255,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width,
                          maxHeight: MediaQuery.of(context).size.height,
                          ),
                        child:Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: TextFormField(
                          
                          decoration: InputDecoration(
                            label: Text('Isi No Nota'),
                            border: OutlineInputBorder(borderRadius: new BorderRadius.circular(10))),  
                      ),
                        ),
                      ),
                      ],
                    ),
                  ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Nama Pembeli'),
                        ),
                        Container(
                        width: 255,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width,
                          maxHeight: MediaQuery.of(context).size.height,
                          ),
                        child:Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: TextFormField(
                          
                          decoration: InputDecoration(
                            label: Text('Isi Nama'),
                            border: OutlineInputBorder(borderRadius: new BorderRadius.circular(10))),  
                      ),
                        ),
                      ),
                      ],
                    ),
                  ),
                  //Dropdown button
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Jenis '),
                        
                        Container(
                           margin: EdgeInsets.only(left: 80),
                          child: DropdownButton(
                            
                            value: nJenis,
                            onChanged: (String ? value){
                            pilihKota(value??"");    //perubahaan saat kota di pilih
                            nilaiJenis = jenisPembeli.indexOf(value??""); //mengambil nilai index berdasarkan urutan list
                            },
                              items: jenisPembeli.map(
                              (String value){
                                return DropdownMenuItem( //tampilan isi data dropdown
                                  child: Text(value),
                                  value: value,
                                );
                              }
                            ).toList(),
                          ),
                        ),
                        
                      ],
                    ),
                  ), 

                  //Radio Button
                  Row(
                    children: [
                      Text('Jenis Bahan yang di beli '),
                       Checkbox(
                          activeColor: Colors.blue,
                          onChanged: (value) {
                          _checkBoxVal = value!;
                          setState(() {});
                        },
                         value: _checkBoxVal,
                       ),Text('Merica'),
                       Checkbox(
                          activeColor: Colors.blue,
                          onChanged: (value) {
                          _checkBoxVal = value!;
                          setState(() {});
                        },
                         value: _checkBoxVal,
                       ),Text('Lada'),
                    ],
                  ),   
                Row(
                  children: [
                    Text('Hari Libur'),
                     Radio(
                            value: 1,
                            groupValue: _value,
                            onChanged: (value) {
                              setState(() {
                                _value = value as int?;
                              });
                            },
                          ),
                          Radio(
                            value: 2,
                            groupValue:_value ,
                            onChanged: (value) {
                              setState(() {
                                _value = value as int?;
                              });
                            },
                          )
                  ],
                ),
                //Switch List Tile
                SwitchListTile(
                  title: const Text('Wifi'),
                  value: _lights,
                  onChanged: (bool value) {
                    setState(() {
                      _lights = value;
                    });
                  },
                  secondary: const Icon(Icons.wifi),
                ),

                //slider
                
                Slider(
                  value: _currentSliderValue,
                  max: 100,
                  divisions: 5,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}