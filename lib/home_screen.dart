import 'package:UTS_DENI/nota_screen.dart';
import 'package:UTS_DENI/product_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<Product> produkList = [];
List<Product> produkyangDibeli = [];

class _HomeScreenState extends State<HomeScreen> {
  int harga = 0;

  void dummyProduct() {
    produkList.add(Product(
        nama: 'RTX 4090TI MSI',
        deskripsi: "VGA MSI RTX 4090TI Libas Segala Game Resolusi 4K FHD ",
        harga: 35000000,
        gambar: 'rtx.jpg'));
    produkList.add(Product(
        nama: "Motherboard NZXT Z790",
        deskripsi: "Motherboard Seri High End Dari NZXT",
        harga: 8000000,
        gambar: 'motherboard.jpg'));
    produkList.add(Product(
        nama: "Intel I9 141900K",
        deskripsi: "Processor Intel Gen Terbaru ",
        harga: 20000000,
        gambar: 'intel.jpg'));
    produkList.add(Product(
        nama: "RAM XPG DDR5 32GB",
        deskripsi: "RAM XPG DDR5 7200/MTs",
        harga: 8500000,
        gambar: 'ram.jpg'));
    produkList.add(Product(
        nama: "PSU Thermaltake 1200W 80+ Platinum",
        deskripsi: "PSU Seri HIGH END Dari Thermaltake ",
        harga: 7900000,
        gambar: 'psu.jpg'));
    produkList.add(Product(
        nama: "SSD NVMe Samsung EVO 980 Gen 4 1TB",
        deskripsi: "SSD SAMSUNG EVO 980 Gen 4 Terbaru",
        harga: 7600000,
        gambar: 'ssd.jpg'));
  }

  void totalHarga() {
    harga = 0;
    for (int i = 0; i < produkyangDibeli.length; i++) {
      harga += produkyangDibeli[i].harga;
    }
  }

  Widget kontenList(
      String nama, String desc, int harga, String img, int index) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          GestureDetector(
              onTap: () {
                produkyangDibeli.add(produkList[index]);
                totalHarga();
                setState(() {});
              },
              child: Container(
                width: 100,
                height: 100,
                child: Image.asset(
                  'assets/img/$img',
                  fit: BoxFit.fill,
                ),
              )),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        title: Text('Detail Product'),
                        content: Container(
                            height: 300,
                            child: Column(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  child: Image.asset(
                                    'assets/img/$img',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  nama,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Rp ${harga.toString()}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  desc,
                                  maxLines: 5,
                                )
                              ],
                            )));
                  });
            },
            child: Text(
              nama,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
            ),
          ),
          Text(
            'Rp ${harga.toString()}',
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (produkList.isEmpty) {
      dummyProduct();
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 113, 16, 158),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Layanan Kontak'),
                          content: Container(
                              height: 500,
                              child: Text('Hubungi Nomor : 085293490296')),
                        );
                      });
                },
                icon: Icon(
                  Icons.contact_emergency,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Layanan Pesan'),
                          content: Container(
                              height: 500,
                              child: Text('Pesan pada email kami')),
                        );
                      });
                },
                icon: Icon(
                  Icons.chat,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Layanan Lokasi Kami'),
                          content: Container(
                              height: 500,
                              child: Text('Lokasi Kami di Kota Semarang')),
                        );
                      });
                },
                icon: Icon(
                  Icons.location_on,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Layanan Pengaturan Akun'),
                          content: Container(
                              height: 500, child: Text('Setting Akun Profile')),
                        );
                      });
                },
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Ubah Password'),
                          content: Container(
                              height: 500, child: Text('Ubah Password Anda')),
                        );
                      });
                },
                icon: Icon(
                  Icons.password,
                  color: Colors.white,
                ))
          ],
          title: Text(
            'Produk',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
          ),
        ),
        body: SafeArea(
            child: Container(
          height: 0.95 * MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 600,
                  child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, crossAxisSpacing: 5),
                      children: List.generate(
                          produkList.length,
                          (index) => kontenList(
                              produkList[index].nama,
                              produkList[index].deskripsi,
                              produkList[index].harga,
                              produkList[index].gambar!,
                              index))),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Detail Product Transaksi'),
                                    content: Container(
                                        height: 500,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: List.generate(
                                                produkyangDibeli.length,
                                                (index) => ListTile(
                                                      trailing: IconButton(
                                                          onPressed: () {
                                                            produkyangDibeli
                                                                .removeAt(
                                                                    index);
                                                            Navigator.pop(
                                                                context);
                                                            totalHarga();
                                                            setState(() {});
                                                          },
                                                          icon: Icon(
                                                              Icons.close)),
                                                      title: Text(
                                                          produkyangDibeli[
                                                                  index]
                                                              .nama),
                                                      subtitle: Text(
                                                          produkyangDibeli[
                                                                  index]
                                                              .harga
                                                              .toString()),
                                                    )),
                                          ),
                                        )),
                                  );
                                });
                          },
                          icon: Icon(
                            Icons.list,
                            size: 35,
                            color: Colors.green[900],
                          )),
                      SizedBox(
                        width: 120,
                        child: Column(
                          children: [
                            Text('Total'),
                            SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Payment();
                                }));
                              },
                              child: Text(
                                'Rp ${harga.toString()}',
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Payment();
                            }));
                          },
                          icon: Icon(
                            Icons.money,
                            size: 35,
                            color: Colors.green[900],
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
