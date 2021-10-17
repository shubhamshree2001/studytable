import 'dart:async';

import 'package:STUDYtable/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/subject-detail';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, double> dataPie = new Map();

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 10), (Timer t) => piechartdata());
    piechartdata();
    super.initState();
  }

  void piechartdata() {
    if (mounted) {
      setState(() {
        dataPie.addAll({
          'Read': _readtopics,
          'Tough': _toughtopics,
          'Unread': _unreadtopics,
          'Revised': _revisedtopics,
        });
      });
    }
  }

  List<Color> _colors = [
    Colors.green,
    Colors.red,
    Colors.black87,
    Colors.amber
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          //subject name
          'PHYSICS',
          style: GoogleFonts.lato(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 2,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xfff1edff),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.35,
                    margin:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(20.0, 10.0),
                          blurRadius: 20.0,
                        ),
                      ],
                    ),
                    child: PieChart(
                      dataMap: dataPie,
                      colorList: _colors,
                      animationDuration: Duration(milliseconds: 1500),
                      chartType: ChartType.disc,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  //exam date
                  'Mar 20, 2021',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                //subject name
                'PHYSICS',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Divider(
                  thickness: 2,
                ),
              ),
              Container(
                child: PhysicsListView(
                    // updateChart: piechartdata,
                    ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: FooterSection(),
                height: MediaQuery.of(context).size.height * 0.15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
  // MyHomePage subject = new MyHomePage();
  // final Function updateChart;
}

double _totaltopics = 119;
double _readtopics = 0;
double _toughtopics = 0;
double _revisedtopics = 0;
double _unreadtopics = _totaltopics - _readtopics;

class EntryItem extends StatefulWidget {
  EntryItem(this.entry);

  final Entry entry;

  @override
  _EntryItemState createState() => _EntryItemState();
}

class _EntryItemState extends State<EntryItem> {
  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty)
      return GestureDetector(
        onTap: () => showModalBottomSheet(
          context: context,
          builder: (_) {
            return GestureDetector(
              onTap: () {},
              child: Card(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.27,
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 10,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 10,
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _readtopics++;
                            _unreadtopics--;
                          });

                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Text(
                            'Read',
                            style: GoogleFonts.lato(
                              fontSize: 20,
                            ),
                          ),
                          height: MediaQuery.of(context).size.height * 0.08,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            // _readtopics++;
                            // _unreadtopics--;
                            _toughtopics++;
                          });
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Text(
                            'Tough',
                            style: GoogleFonts.lato(
                              fontSize: 20,
                            ),
                          ),
                          height: MediaQuery.of(context).size.height * 0.08,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            // _readtopics++;
                            // _unreadtopics--;
                            _revisedtopics++;
                          });
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Text(
                            'Revised',
                            style: GoogleFonts.lato(
                              fontSize: 20,
                            ),
                          ),
                          height: MediaQuery.of(context).size.height * 0.08,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // SubtopicStatus(),
              behavior: HitTestBehavior.opaque,
            );
          },
        ),
        child: ListTile(
          title: Row(
            children: <Widget>[
              Flexible(
                child: Text(
                  root.title,
                ),
              ),
            ],
          ),
        ),
      );

    return ExpansionTile(
      tilePadding: EdgeInsets.all(10),
      key: PageStorageKey<Entry>(root),
      title: Text(
        root.title,
        style: TextStyle(
          fontSize: 22,
        ),
      ),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(widget.entry);
  }
}

class PhysicsListView extends StatelessWidget {
  final List<Entry> data = <Entry>[
    Entry(
      '1. Electric Charges and Fields',
      <Entry>[
        Entry(
          'Electric Charges',
        ),
        Entry('Conservation of Charge'),
        Entry('Coulomb\'s law-force between two-point charges'),
        Entry('Forces between multiple charges'),
        Entry('Superposition principle and continuous charge distribution'),
        Entry('Electric Field'),
        Entry('Electric field due to a point charge'),
        Entry('Electric field lines'),
        Entry('Electric diplole'),
        Entry('Electric field due to a dipole'),
        Entry('Torque on a dipole in uniform electric field'),
        Entry('Electric Flux'),
        Entry(
            'Statement of gauss\'s theorem and its applications to find field due to infinetly long straight wire'),
        Entry('Unifromly Charged infinite plane sheet'),
      ],
    ),
    Entry(
      '2. Electrostatic Potential and Capacitance',
      <Entry>[
        Entry('Electric potential'),
        Entry('Poetntial Difference'),
        Entry('Electric potential due to a point charge'),
        Entry('A dipole and system of charges'),
        Entry('Equipotential Surfaces'),
        Entry(
            'Electrical potential energy of a system of two point charges and of electrical dipole in an electrostatic field'),
        Entry('Conductors and insulators'),
        Entry('Free charges and bound charges inside a conductor'),
        Entry('Dielectrics and electric polarisation'),
        Entry('Capacitors and capacitance'),
        Entry('Combination of capacitors in series and in parallel'),
        Entry(
            'Capacitance of a parallel plate capacitor with and without dielectric medium between the plates'),
        Entry('Energy Stored in a capacitor')
      ],
    ),
    Entry(
      '3. Current Electricity',
      <Entry>[
        Entry('Electric current'),
        Entry('Flow of electric charges in a metallic conductor'),
        Entry(
          'Drift Velocity',
        ),
        Entry('Mobility and their relation with electric current'),
        Entry('Ohm\'s Law'),
        Entry('Electrical Resistance'),
        Entry('V-I characterstics (Linear and non-linear)'),
        Entry('Electrical energy and power'),
        Entry('Electrical Resistivity and conductivity'),
        Entry('Temprature dependence and resistance'),
        Entry('Internal resistance of a cell'),
        Entry('Potential difference and emf of a cell'),
        Entry('Potential Difference and emf of a cell'),
        Entry('Combination of cells in series and parallel'),
        Entry('Kirchoff\'s laws and simple applications'),
        Entry('Wheatstone Bridge'),
        Entry('Metre Bridge(qualitative ideas only)'),
        Entry(
            'Potentiometer - principle and its applications to measure potential difference and for comparing EMF of two cells; measurement of internal resistance of a cell(qualitative ideas only)'),
        Entry(
            'Measurement of internal resistance of a cell(qualitative ideas only)'),
      ],
    ),
    Entry(
      '4. Moving Charges and Magnetism',
      <Entry>[
        Entry('Concept of magnetic field'),
        Entry('Oersted\'s Experiment'),
        Entry(
            'Biot - Savart law and its application to current carrying circular loop'),
        Entry(
            'Ampere\'s law and its applications to infinitely long straight wire'),
        Entry('Straight and toroidal solenoids(for qualitative traetment)'),
        Entry(
            'Force on a moving charge in uniform magnetic and electric fields'),
        Entry(
            'Force on a current-carrying conductor in a uniform magnetic field'),
        Entry(
            'Force between two parallel current-carrying conductors - definition of ampere'),
        Entry('torque experienced by a current loop in unifrom magnetic field'),
        Entry(
            'Moving coil galvanometer - its current sensitivity and conversion to ammeter and voltmeter'),
      ],
    ),
    Entry(
      '5. Magnetism and Matter',
      <Entry>[
        Entry(
            'Current loop as a magnetic dipole and its magnetic dipole moment'),
        Entry('Magnetic dipole moment of a revolving electron'),
        Entry('Bar magnet as an equivalent solenoid'),
        Entry('Magnetic field Lines'),
        Entry('Earth\'s magnetic field and magnetic elements'),
      ],
    ),
    Entry(
      '6. Electromagnetic Induction',
      <Entry>[
        Entry('Electromagnetic Induction'),
        Entry('Faraday\'s Laws'),
        Entry('Induced EMF and current'),
        Entry('Len\'s Law'),
        Entry('Eddy Currents'),
        Entry('Self and mutual induction'),
      ],
    ),
    Entry(
      '7. Alternating Current',
      <Entry>[
        Entry('Alternating Currents'),
        Entry('Peak and RMS value of alternating current/voltage'),
        Entry('Reactance and Impedence'),
        Entry('LC oscillations (qualitative treatment only)'),
        Entry('LCR Series Circuit'),
        Entry('Resonance'),
        Entry('Power in AC circuits'),
        Entry('AC generator and transformer'),
      ],
    ),
    Entry(
      '8. Electromagnetic Waves',
      <Entry>[
        Entry(
            'Electromagnetic waves, their characteristics, their Transverse nature (qualitative ideas only)'),
        Entry(
            'Electromagnetic spectrum (radio waves, microwaves, infrared, visible, ultraviolet, X-rays, gamma rays) including elementary facts about their uses'),
      ],
    ),
    Entry(
      '9. Ray Optics and Optical Instruments',
      <Entry>[
        Entry('Reflection of Light'),
        Entry('Total internal reflection and its applications'),
        Entry('Optical Fibers'),
        Entry('Reflection at spherical surfaces'),
        Entry('Lenses'),
        Entry('Thin lens formula'),
        Entry('Lensmaker\'s Formula'),
        Entry('Magnification'),
        Entry('Power of a lens'),
        Entry('Combination of thin lenses in contact'),
        Entry('Refraction of light through a prism'),
        Entry(
            'Optical instruments: Microscopes and astronomical telescopes (reflecting and refracting) and their magnifying powers'),
      ],
    ),
    Entry(
      '10. Wave Optics',
      <Entry>[
        Entry('Wave front and Hugyen\'s principle'),
        Entry(
            'Reflection and refraction of plane wave at a plane surface using wave fronts'),
        Entry(
            'Proof of laws of reflection and refraction using Huygen\'s principle'),
        Entry('Interference'),
        Entry(
            'Young\'s double slit experiment and expression for fringe width'),
        Entry('Coherent sources and sustained interference of light'),
        Entry('Diffraction due to a single slit'),
        Entry('Width of central maximum')
      ],
    ),
    Entry(
      '11. Dual Nature of Radiation and Matter',
      <Entry>[
        Entry('Dual nature of radiation'),
        Entry('Photoelectric effect'),
        Entry('Hertz and Lenard\'s observations'),
        Entry('Einstein\'s photoelectric equation-particle nature of light'),
        Entry('Experimental study of photoelectric effect'),
        Entry('Matter waves- wave nature of particles'),
        Entry('de-Broglie relation'),
      ],
    ),
    Entry(
      '12. Atoms',
      <Entry>[
        Entry('Alpha-particle scattering experiment'),
        Entry('Rutherford\'s model of atom'),
        Entry('Bohr Model'),
        Entry('Energy levels'),
        Entry('Hydrogen Spectrum'),
      ],
    ),
    Entry(
      '13. Nuclei',
      <Entry>[
        Entry('Composition and size of nucleus'),
        Entry('Mass-energy Relation'),
        Entry('Mass defect'),
        Entry('Nuclear Fission'),
        Entry('Nuclear Fusion'),
      ],
    ),
    Entry(
      '14. Semiconductor Electronics: Materials, Devices and Simple Circuits',
      <Entry>[
        Entry('Energy bands in conductors'),
        Entry('Semiconductors and insulators (qualitative ideas only)'),
        Entry(
            'Semiconductor diode - I-V characteristics in forward and reverse bias'),
        Entry('Diode as a rectifier'),
        Entry(
            'Special purpose p-n junction diodes: LED, photodiode, solar cell'),
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) =>
              EntryItem(data[index]),
          itemCount: data.length,
        ),
      ),
    );
  }
}
