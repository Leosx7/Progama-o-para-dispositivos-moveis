import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

void main() => runApp(const MeuAplicativo());

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'IFPI - Mapa e Geolocalização',
        theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
        home: const TelaMapa(),
      );
}

class TelaMapa extends StatefulWidget {
  const TelaMapa({super.key});

  @override
  State<TelaMapa> createState() => _TelaMapaState();
}

class _TelaMapaState extends State<TelaMapa> {
  final MapController _mapa = MapController();

  // Pontos aproximados: ajuste conforme necessidade.
  static const LatLng central = LatLng(-5.088811, -42.810970);
  static const LatLng zonaSul = LatLng(-5.10225453, -42.81401045);
  static const LatLng inicio = LatLng(-5.0955, -42.8125);

  LatLng? minhaPosicao;
  double? precisao;
  bool posicaoManual = false;
  bool ajustando = false;
  bool carregando = false;
  String mensagem = 'Vermelho: IFPI Central | Verde: IFPI Zona Sul';
  final List<LatLng> marcadores = [];

  Future<void> localizar() async {
    if (carregando) return;
    setState(() {
      carregando = true;
      mensagem = 'Buscando localização...';
    });
    try {
      if (!await Geolocator.isLocationServiceEnabled()) {
        throw Exception('Ative a localização no dispositivo.');
      }
      var permissao = await Geolocator.checkPermission();
      if (permissao == LocationPermission.denied) {
        permissao = await Geolocator.requestPermission();
      }
      if (permissao == LocationPermission.denied ||
          permissao == LocationPermission.deniedForever) {
        throw Exception('Permita a localização nas configurações do Chrome.');
      }

      final posicao = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 20),
        ),
      );
      if (!mounted) return;

      final ponto = LatLng(posicao.latitude, posicao.longitude);
      setState(() {
        minhaPosicao = ponto;
        precisao = posicao.accuracy;
        posicaoManual = false;
        ajustando = false;
        mensagem = 'Localização: ${posicao.latitude.toStringAsFixed(5)}, '
            '${posicao.longitude.toStringAsFixed(5)} | '
            'Precisão estimada: ±${posicao.accuracy.toStringAsFixed(0)} m';
      });
      _mapa.move(ponto, 16);
    } catch (erro) {
      if (!mounted) return;
      setState(() => mensagem = 'Erro ao localizar: $erro');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(mensagem)),
      );
    } finally {
      if (mounted) setState(() => carregando = false);
    }
  }

  void tocarMapa(TapPosition tap, LatLng ponto) {
    setState(() {
      if (ajustando) {
        minhaPosicao = ponto;
        precisao = null;
        posicaoManual = true;
        ajustando = false;
        mensagem = 'Posição ajustada manualmente (não é uma leitura GPS).';
      } else {
        marcadores.add(ponto);
        mensagem = 'Novo marcador adicionado';
      }
    });
  }

  @override
  void dispose() {
    _mapa.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('IFPI - Mapa e Geolocalização'),
          backgroundColor: Colors.indigo.shade100,
        ),
        body: Stack(
          children: [
            FlutterMap(
              mapController: _mapa,
              options: MapOptions(
                initialCenter: inicio,
                initialZoom: 13,
                onTap: tocarMapa,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'br.edu.ifpi.mapa',
                ),
                if (minhaPosicao != null &&
                    !posicaoManual &&
                    precisao != null)
                  CircleLayer(
                    circles: [
                      CircleMarker(
                        point: minhaPosicao!,
                        radius: precisao!,
                        useRadiusInMeter: true,
                        color: Colors.blue.withOpacity(0.12),
                        borderColor: Colors.blue,
                        borderStrokeWidth: 2,
                      ),
                    ],
                  ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: central,
                      width: 55,
                      height: 55,
                      child: const Tooltip(
                        message: 'IFPI Teresina Central',
                        child: Icon(Icons.location_pin,
                            color: Colors.red, size: 48),
                      ),
                    ),
                    Marker(
                      point: zonaSul,
                      width: 55,
                      height: 55,
                      child: const Tooltip(
                        message: 'IFPI Teresina Zona Sul',
                        child: Icon(Icons.location_pin,
                            color: Colors.green, size: 48),
                      ),
                    ),
                    for (final ponto in marcadores)
                      Marker(
                        point: ponto,
                        width: 50,
                        height: 50,
                        child: const Icon(Icons.location_pin,
                            color: Colors.orange, size: 44),
                      ),
                    if (minhaPosicao != null)
                      Marker(
                        point: minhaPosicao!,
                        width: 65,
                        height: 65,
                        child: Tooltip(
                          message: posicaoManual
                              ? 'Posição manual'
                              : 'Sua localização aproximada',
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue.shade600,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.white, width: 3),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            child: const Icon(Icons.navigation,
                                color: Colors.white, size: 38),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 10,
              left: 10,
              right: 75,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(ajustando
                      ? 'Toque no mapa para corrigir sua posição.'
                      : mensagem),
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Column(
                children: [
                  FloatingActionButton.small(
                    heroTag: 'localizacao',
                    tooltip: 'Minha localização',
                    onPressed: carregando ? null : localizar,
                    child: carregando
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2))
                        : const Icon(Icons.my_location),
                  ),
                  const SizedBox(height: 10),
                  FloatingActionButton.small(
                    heroTag: 'ajustar',
                    tooltip: 'Corrigir posição manualmente',
                    onPressed: () =>
                        setState(() => ajustando = !ajustando),
                    child: const Icon(Icons.edit_location_alt),
                  ),
                  const SizedBox(height: 10),
                  FloatingActionButton.small(
                    heroTag: 'central',
                    tooltip: 'IFPI Central',
                    onPressed: () => _mapa.move(central, 16),
                    child: const Icon(Icons.school, color: Colors.red),
                  ),
                  const SizedBox(height: 10),
                  FloatingActionButton.small(
                    heroTag: 'zonasul',
                    tooltip: 'IFPI Zona Sul',
                    onPressed: () => _mapa.move(zonaSul, 16),
                    child: const Icon(Icons.school, color: Colors.green),
                  ),
                  const SizedBox(height: 10),
                  FloatingActionButton.small(
                    heroTag: 'inicio',
                    tooltip: 'Voltar para Teresina',
                    onPressed: () => _mapa.move(inicio, 13),
                    child: const Icon(Icons.home),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: Container(
                color: Colors.white.withOpacity(0.85),
                padding: const EdgeInsets.all(5),
                child: const Text(
                  '© OpenStreetMap contributors',
                  style: TextStyle(fontSize: 11, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      );
}
