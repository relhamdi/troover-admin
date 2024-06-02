import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/samples/domain_samples.dart';
import 'package:troover_admin/samples/samples.dart';

List<Demand> demandSamples = [
  Demand(
    id: 1,
    user: userSamples[0],
    title: 'Développeur Web Junior',
    duration: 6,
    startDate: DateTime(2024, 6, 1),
    place: 'Paris, France',
    enable: true,
    salary: 2000,
    schedule: 'Temps plein',
    remoteDay: 2,
    extra:
        'Offre de stage pour un développeur web junior passionné par les nouvelles technologies.',
    domains: [domainSamples[1], domainSamples[3], domainSamples[8]],
  ),
  Demand(
    id: 2,
    user: userSamples[1],
    title: 'Stage Marketing Digital',
    duration: 3,
    startDate: DateTime(2024, 7, 1),
    place: 'Lyon, France',
    enable: true,
    salary: 1500,
    schedule: 'Temps partiel',
    remoteDay: 3,
    extra:
        'Stage en marketing digital pour soutenir nos campagnes publicitaires sur les réseaux sociaux.',
    domains: [domainSamples[5], domainSamples[8]],
  ),
  Demand(
    id: 3,
    user: userSamples[2],
    title: 'Assistant Ressources Humaines',
    duration: 12,
    startDate: DateTime(2024, 8, 1),
    place: 'Marseille, France',
    enable: true,
    salary: 1800,
    schedule: 'Temps plein',
    remoteDay: 1,
    extra:
        'Nous recherchons un assistant RH dynamique pour rejoindre notre équipe et aider à la gestion du personnel.',
    domains: [domainSamples[5]],
  ),
  Demand(
    id: 4,
    user: userSamples[2],
    title: 'Développeur Mobile Senior',
    duration: 8,
    startDate: DateTime(2024, 10, 1),
    place: 'Toulouse, France',
    enable: true,
    salary: 2500,
    schedule: 'Temps plein',
    remoteDay: 4,
    extra:
        'Nous recherchons un développeur mobile expérimenté pour rejoindre notre équipe et contribuer au développement de nos applications.',
    domains: [domainSamples[2], domainSamples[7]],
  ),
];
