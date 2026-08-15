import 'player_card.dart';

class MarketListing {
  final String id;
  final PlayerCard card;
  final int price;
  final String sellerName;

  MarketListing({
    required this.id,
    required this.card,
    required this.price,
    required this.sellerName,
  });
}

final List<MarketListing> sampleMarketListings = [
  MarketListing(
    id: 'm1',
    card: allPlayers[0],
    price: 150000,
    sellerName: 'ProTrader99',
  ),
  MarketListing(
    id: 'm2',
    card: allPlayers[1],
    price: 120000,
    sellerName: 'FutMaster',
  ),
];