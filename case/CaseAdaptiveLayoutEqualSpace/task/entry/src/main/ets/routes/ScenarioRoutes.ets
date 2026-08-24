export enum ScenarioRoute {
  DIAMOND = 'DiamondAreaScenario',
  SIDEBAR = 'SidebarMenuScenario',
  REMOTE = 'RemoteControlScenario'
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
