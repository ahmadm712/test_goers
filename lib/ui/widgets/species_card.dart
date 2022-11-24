import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_goers_app/data/models/starwars_species_response_model.dart';
import 'package:test_goers_app/shared/styles.dart';
import 'package:test_goers_app/ui/pages/detail_species/detail_species_page.dart';
import 'package:test_goers_app/utils/constants.dart';

class SpeciesCard extends StatelessWidget {
  const SpeciesCard({
    Key? key,
    required this.species,
  }) : super(key: key);

  final Species species;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(
            context,
            DetailSpeciesPage.routeName,
            arguments: species,
          );
        },
        leading: SizedBox(
          height: 90,
          width: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: urlPlaceholder,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        title: Text(
          '${species.name} ',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
            color: kPrimaryColor,
          ),
        ),
        subtitle: Text(
          species.classification!,
          style: blackTextStyle.copyWith(
            fontSize: 11,
            color: Colors.white,
          ),
        ),
        trailing: Text(
          species.averageLifespan!,
          style: kHeading6.copyWith(
            fontSize: 12,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
