import 'package:get/get.dart';
import 'package:truckksa/mudul/Section.dart';
import 'package:truckksa/mudul/fuala.dart';
import 'package:truckksa/mudul/paragraphs.dart';

class GetXData extends GetxController {
  Section data = Section.fromJson({});
  Paragraphs datap = Paragraphs.fromJson({});

  Future<void> getdata() async {
    getSection();
    datas();
    print(data.data.length);
  }
  getSection()
  async {
    data = await fuataCategories.allSection();
    update();
  }
  Future<void> datas()
  async {
    datap = await fuataCategories.getdata();
    update();
  }
}
