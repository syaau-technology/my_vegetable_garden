import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constants.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        padding.left + 20,
        10,
        padding.right + 20,
        10,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        child: Container(
          width: double.infinity,
          color: kDefaultBackgroundColor,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Why a gardening App?',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      style: _normalStyle,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Eating healthy during COVID-19 pandemic. '),
                        TextSpan(
                            text:
                                'And growing your own food is healthier, cheaper, and easier than you think. '),
                        TextSpan(text: 'Just take a look at these articles. '),
                        TextSpan(children: links()),
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Developed by',
                    style: _titleStyle,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Bibhu Man Rajbhandari',
                    style: _nameStyle,
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Made with ❤️ in Nepal 🇳🇵',
                    style: _normalStyle,
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Flutter Community\n#Hack20',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.blue,
                        fontSize: 24),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle _normalStyle = TextStyle(color: Colors.black);
  TextStyle _titleStyle = TextStyle(fontStyle: FontStyle.italic, fontSize: 16);
  TextStyle _nameStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
  TextStyle _linkStyle = TextStyle(
    color: Colors.blue,
    decoration: TextDecoration.underline,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  );

  List<TextSpan> links() {
    var widgets = <TextSpan>[];
    for (int index = 0; index < referenceLinks.length; index++) {
      widgets.add(TextSpan(text: '\n\n${index + 1}. '));
      widgets.add(
        TextSpan(
          text: referenceLinks[index].title,
          style: _linkStyle,
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              final url = referenceLinks[index].url;
              if (await canLaunch(url)) {
                await launch(url, forceSafariVC: false);
              }
            },
        ),
      );
    }
    return widgets;
  }

  List<Link> referenceLinks = <Link>[
    Link(
      'Experts say there are benefits to gardening during the COVID-19 crisis',
      'https://www.1011now.com/content/news/Experts-say-there-are-benefits-to-gardening-during-the-COVID-19-crisis-569623101.html',
    ),
    Link(
      'Rooftop Gardening Thrives During Lockdown',
      'https://risingnepaldaily.com/main-news/rooftop-gardening-thrives-during-lockdown',
    ),
    Link(
      'The importance of gardening during COVID-19 pandemic',
      'https://www.morningagclips.com/the-importance-of-gardening-during-covid-19-pandemic/',
    ),
    Link(
      'Why gardening during a pandemic is so comforting',
      'https://www.marketwatch.com/story/this-earth-day-especially-remember-plants-are-non-judgmental-what-its-like-to-start-gardening-during-a-pandemic-2020-04-22',
    ),
    Link(
      'If you took to growing veggies in the coronavirus pandemic, then keep it up when lockdown ends',
      'https://theconversation.com/if-you-took-to-growing-veggies-in-the-coronavirus-pandemic-then-keep-it-up-when-lockdown-ends-135359',
    ),
    Link(
      'Growing a Vegetable Garden Might Be Just What You Need During the Coronavirus Crisis',
      'https://www.architecturaldigest.com/story/growing-vegetable-garden-during-coronavirus-crisis',
    ),
  ];
}

class Link {
  String title;
  String url;
  Link(this.title, this.url);
}
