import 'package:troover_admin/models/_models.dart';

List<Domain> domainSamples = [
  Domain(id: 1, name: 'Développement Logiciel', domainParent: null),
  Domain(id: 2, name: 'Développement Web', domainParent: domainSamples[1]),
  Domain(id: 3, name: 'Développement Mobile', domainParent: domainSamples[1]),
  Domain(id: 4, name: 'Intelligence Artificielle', domainParent: null),
  Domain(id: 5, name: 'Apprentissage Automatique', domainParent: domainSamples[4]),
  Domain(id: 6, name: 'Vision par Ordinateur', domainParent: domainSamples[4]),
  Domain(id: 7, name: 'Sécurité des Systèmes', domainParent: null),
  Domain(id: 8, name: 'Sécurité des Réseaux', domainParent: domainSamples[7]),
  Domain(id: 9, name: 'Conception UX', domainParent: null),
  Domain(id: 10, name: 'Développement de Jeux', domainParent: domainSamples[1]),
];
