import 'package:flutter/material.dart';
import 'package:test_goers_app/data/models/starwars_species_response_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:test_goers_app/shared/styles.dart';
import 'package:test_goers_app/utils/constants.dart';

class DetailSpeciesPage extends StatelessWidget {
  const DetailSpeciesPage({super.key, required this.species});
  static const String routeName = '/detail-species';
  final Species species;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: urlPlaceholder,
              width: double.infinity,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Container(
              margin: const EdgeInsets.only(top: 48 + 8),
              child: DraggableScrollableSheet(
                builder: (context, scrollController) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: kRichBlack,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    padding: const EdgeInsets.only(
                      left: 16,
                      top: 16,
                      right: 16,
                    ),
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  species.name!,
                                  style:
                                      kHeading6.copyWith(color: kPrimaryColor),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                infoSpecies(
                                  'Classification',
                                  Text(
                                    species.classification!,
                                    style: kSubtitle.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                infoSpecies(
                                  'Designation',
                                  Text(
                                    species.designation!,
                                    style: kSubtitle.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                infoSpecies(
                                  'Average Height',
                                  Text(
                                    species.averageHeight!,
                                    style: kSubtitle.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                infoSpecies(
                                  'Skin Color',
                                  Text(
                                    species.skinColors!,
                                    style: kSubtitle.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                infoSpecies(
                                  'Hair Color',
                                  Text(
                                    species.hairColors!,
                                    style: kSubtitle.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                infoSpecies(
                                  'Eye Color',
                                  Text(
                                    species.eyeColors!,
                                    style: kSubtitle.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                infoSpecies(
                                  'Average Height',
                                  Text(
                                    species.averageHeight!,
                                    style: kSubtitle.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                infoSpecies(
                                  'Homeworld',
                                  Text(
                                    species.homeworld!,
                                    style: kSubtitle.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                infoSpecies(
                                  'Language',
                                  Text(
                                    species.language!,
                                    style: kSubtitle.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                infoSpecies(
                                  'Film',
                                  Column(
                                    children: species.films!
                                        .map(
                                          (film) => Text(
                                            film,
                                            style: kSubtitle.copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                infoSpecies(
                                  'People',
                                  Column(
                                    children: species.people!
                                        .map(
                                          (film) => Text(
                                            film,
                                            style: kSubtitle.copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                infoSpecies(
                                  'Created',
                                  Text(
                                    species.created.toString().substring(0, 10),
                                    style: kSubtitle.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                infoSpecies(
                                  'Edited',
                                  Text(
                                    species.edited.toString().substring(0, 10),
                                    style: kSubtitle.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                infoSpecies(
                                  'Url',
                                  Text(
                                    species.url!,
                                    style: kSubtitle.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            color: Colors.white,
                            height: 4,
                            width: 48,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                minChildSize: 0.25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: kRichBlack,
                foregroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget infoSpecies(String title, Widget child) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: kHeading6.copyWith(color: kPrimaryColor),
          ),
          child
        ],
      ),
    );
  }
}
