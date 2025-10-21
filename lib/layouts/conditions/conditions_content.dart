import 'package:flutter/material.dart';

class ConditionsContent extends StatefulWidget {
  const ConditionsContent({super.key});

  @override
  State<ConditionsContent> createState() => _ConditionsContentState();
}

class _ConditionsContentState extends State<ConditionsContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                color: Theme.of(context).backgroundColor,
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Text("""
Conditions générales d'utilisation

Merci de lire attentivement les présentes conditions générales d'utilisation (CGU) avant d'utiliser notre application mobile.

En utilisant notre application, vous acceptez pleinement et sans réserve ces CGU. Si vous n'acceptez pas ces conditions, veuillez ne pas utiliser l'application.

1. Utilisation de l'application
L'application est destinée à être utilisée uniquement à des fins personnelles et non commerciales. Vous vous engagez à ne pas utiliser l'application à des fins illicites ou interdites par la loi.

2. Compte utilisateur
Pour utiliser certaines fonctionnalités de l'application, vous devrez créer un compte utilisateur. Vous êtes responsable de maintenir la confidentialité de vos informations de connexion et de toutes les activités qui se déroulent sous votre compte.

3. Contenu utilisateur
L'application vous permet de publier, partager et visualiser du contenu généré par les utilisateurs. En publiant du contenu, vous garantissez que vous en détenez les droits de propriété intellectuelle et que le contenu ne viole pas les droits de tiers.

4. Règles de conduite
Vous acceptez de respecter les règles de conduite suivantes :
   a. Ne pas publier de contenu illégal, diffamatoire, offensant, obscène ou frauduleux.
   b. Ne pas harceler, intimider ou menacer d'autres utilisateurs.
   c. Ne pas violer la vie privée d'autrui en publiant des informations personnelles sans autorisation.
   d. Ne pas utiliser l'application pour des activités de spam ou de marketing non sollicité.
   e. Ne pas perturber le fonctionnement normal de l'application ou tenter d'accéder illégalement à ses systèmes.

5. Propriété intellectuelle
Tous les droits de propriété intellectuelle liés à l'application (y compris le code, le design et les contenus) restent la propriété de notre entreprise. Vous n'êtes pas autorisé à copier, modifier, distribuer ou exploiter de quelque manière que ce soit le contenu de l'application sans notre consentement préalable écrit.

6. Limitation de responsabilité
L'utilisation de l'application se fait à vos propres risques. Nous déclinons toute responsabilité en cas de dommages directs, indirects, accidentels, consécutifs ou spéciaux découlant de l'utilisation de l'application ou de l'incapacité à l'utiliser.

7. Modification des CGU
Nous nous réservons le droit de modifier ces CGU à tout moment. Les modifications seront effectives dès leur publication dans l'application. Il est de votre responsabilité de consulter régulièrement les CGU pour être informé des éventuelles mises à jour.

Si vous avez des questions ou des préoccupations concernant ces CGU, veuillez nous contacter à l'adresse suivante : [adresse e-mail de contact].

Date d'entrée en vigueur : [date d'entrée en vigueur des CGU]

"""))));
  }
}
