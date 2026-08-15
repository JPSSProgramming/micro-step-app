import 'dart:math';
import '../models/squad.dart';

class MatchEvent {
  final int minute;
  final String text;
  final bool isGoal;

  MatchEvent({required this.minute, required this.text, this.isGoal = false});
}

class MatchResult {
  final int homeGoals;
  final int awayGoals;
  final List<MatchEvent> events;

  MatchResult({
    required this.homeGoals,
    required this.awayGoals,
    required this.events,
  });
}

class MatchSimulator {
  static MatchResult simulateMatch(DraftSquad squad) {
    final random = Random();
    int homeGoals = 0;
    int awayGoals = 0;
    List<MatchEvent> events = [];

    int opponentRating = 75 + random.nextInt(15);
    int userPower = squad.rating + (squad.chemistry ~/ 3);

    events.add(MatchEvent(minute: 1, text: 'Match started!'));

    for (int min = 5; min <= 90; min += 5 + random.nextInt(10)) {
      int chance = random.nextInt(100);

      if (chance < 20) {
        if (userPower >= opponentRating || random.nextBool()) {
          homeGoals++;
          events.add(
            MatchEvent(
              minute: min,
              text: 'GOAL! Your team scores! ($homeGoals - $awayGoals)',
              isGoal: true,
            ),
          );
        } else {
          awayGoals++;
          events.add(
            MatchEvent(
              minute: min,
              text: 'GOAL! Opponent scores! ($homeGoals - $awayGoals)',
              isGoal: true,
            ),
          );
        }
      } else if (chance < 40) {
        events.add(
          MatchEvent(
            minute: min,
            text: 'Dangerous attack missed by ${random.nextBool() ? "your team" : "opponent"}.',
          ),
        );
      }
    }

    events.add(
      MatchEvent(
        minute: 90,
        text: 'Full time! Final score: $homeGoals - $awayGoals',
      ),
    );

    return MatchResult(
      homeGoals: homeGoals,
      awayGoals: awayGoals,
      events: events,
    );
  }
}