export enum ScenarioRoute {
  MEETING = 'MeetingScenario',
  FLIGHT = 'FlightScenario',
  TRIP = 'TripScenario'
}

export class ScenarioRouter {
  static stack: NavPathStack = new NavPathStack();

  static push(route: ScenarioRoute): void {
    ScenarioRouter.stack.pushPathByName(route, null);
  }

  static pop(): void {
    ScenarioRouter.stack.pop();
  }
}
