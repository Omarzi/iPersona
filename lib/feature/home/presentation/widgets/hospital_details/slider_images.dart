import 'package:carousel_slider/carousel_slider.dart';
import 'package:persona2/core/config/routes/app.dart';

class SliderImages extends StatefulWidget {
  const SliderImages({Key? key,required this.imagesList}) : super(key: key);
  final List<String> imagesList;
  @override
  State<SliderImages> createState() => _SliderImagesState();
}

class _SliderImagesState extends State<SliderImages> {
  // List<String> imagesList = [
  //   'https://www.mallofegypt.com/-/media/blogs/2019/october/moeg/family-feasts/butchersburger2.jpg?h=600&w=800&la=ar&hash=AD10CE76106D238D49239BAC33E9D6D77FEC8F08',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStp-gCzkEGXkPE-h1WCpRdhdAo7X9r6M1ZarbxUwYS6w_NLjWznGu6yJTt7RKBNRnFp-g&usqp=CAU',
  //   'https://www.limaza.com/wp-content/uploads/2018/03/%D8%A7%D9%84%D9%88%D8%AC%D8%A8%D8%A7%D8%AA-%D8%A7%D9%84%D8%B3%D8%B1%D9%8A%D8%B9%D8%A9.jpg',
  // ];

  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.w * 0.1),
      child: CarouselSlider(
        carouselController: controller,
        items: List.generate(widget.imagesList.length, (index) {
          String image = widget.imagesList[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: context.w * 0.08),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                image,
                width: 200,
                fit: BoxFit.fill,
              ),
            ),
          );
        }),
        options: CarouselOptions(
            height: 170,
            initialPage: 0,
            reverse: false,
            autoPlay: true,
            onPageChanged: (val, _) {
              setState(() {
                controller.jumpToPage(val);
              });
            }),
      ),
    );
  }
}
