import { HomePage } from './HomePage';
import { ScenarioRouter } from '../routes/ScenarioRoutes';

@Entry
@ComponentV2
struct Index {
  build() {
    Navigation(ScenarioRouter.stack) {
      HomePage()
    }
    .hideTitleBar(true)
    .mode(NavigationMode.Stack)
  }
}
