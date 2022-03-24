import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ChardCharacterShimmer extends StatelessWidget {
  const ChardCharacterShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
      child: SizedBox(
        height: 200,
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                height: 200.0,
                margin: const EdgeInsets.only(left: 46.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B3F43),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 10.0),
                    ),
                  ],
                ),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(105.0, 16.0, 16.0, 16.0),
                  constraints: const BoxConstraints.expand(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _shimmer(
                        const SizedBox(
                          height: 30,
                          width: 60,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: <Widget>[
                          Container(
                            height: 12,
                            width: 12,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(width: 5),
                          _shimmer(
                            const SizedBox(
                              height: 20,
                              width: 60,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      _shimmer(
                        const SizedBox(
                          height: 30,
                          width: 60,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      _shimmer(
                        const SizedBox(
                          height: 15,
                          width: 60,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              alignment: FractionalOffset.centerLeft,
              child: _shimmer(
                const CircleAvatar(
                  radius: 60,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _shimmer(Widget child) => Shimmer.fromColors(
      child: child, baseColor: Colors.grey, highlightColor: Colors.white);
}
