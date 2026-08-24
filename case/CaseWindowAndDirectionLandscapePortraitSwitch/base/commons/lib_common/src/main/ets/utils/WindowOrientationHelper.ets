import { window } from '@kit.ArkUI';

export type WindowOrientationType =
  | 'UNSPECIFIED'
    | 'PORTRAIT'
    | 'LANDSCAPE'
    | 'PORTRAIT_INVERTED'
    | 'LANDSCAPE_INVERTED';

export type AutoRotateRange =
  | 'LANDSCAPE_ONLY'
    | 'PORTRAIT_ONLY'
    | 'ALL_ORIENTATIONS';

export interface OrientationDescription {
  name: string;
  description: string;
  isRestrictedByControlCenter: boolean;
  category: string;
}

export interface OrientationOption {
  value: Orientation;
  label: string;
  category: string;
  description: string;
}

export interface FixedConfig {
  mode: 'fixed';
  orientation?: WindowOrientationType;
}

export interface AutoRotateConfig {
  mode: 'autoRotate';
  range: AutoRotateRange;
  preferred?: WindowOrientationType;
}

export interface FollowDesktopConfig {
  mode: 'followDesktop';
}

export type OrientationConfig = FixedConfig | AutoRotateConfig | FollowDesktopConfig;

export interface FixedPresets {
  UNSPECIFIED: Orientation;
  PORTRAIT: Orientation;
  LANDSCAPE: Orientation;
  PORTRAIT_INVERTED: Orientation;
  LANDSCAPE_INVERTED: Orientation;
}

export interface AllPresets {
  UNSPECIFIED: Orientation;
  PORTRAIT: Orientation;
  LANDSCAPE: Orientation;
  PORTRAIT_INVERTED: Orientation;
  LANDSCAPE_INVERTED: Orientation;
}

export interface AutoRotatePresets {
  LANDSCAPE_ONLY: Orientation;
  PORTRAIT_ONLY: Orientation;
  ALL_ORIENTATIONS: AllPresets;
}

export interface OrientationPresetsType {
  FOLLOW_DESKTOP: Orientation;
  FIXED: FixedPresets;
  AUTO_ROTATE: AutoRotatePresets;
}

export const orientationPresets: OrientationPresetsType = {
  FOLLOW_DESKTOP: window.Orientation.FOLLOW_DESKTOP,
  FIXED: {
    UNSPECIFIED: window.Orientation.LOCKED,
    PORTRAIT: window.Orientation.PORTRAIT,
    LANDSCAPE: window.Orientation.LANDSCAPE,
    PORTRAIT_INVERTED: window.Orientation.PORTRAIT_INVERTED,
    LANDSCAPE_INVERTED: window.Orientation.LANDSCAPE_INVERTED,
  },
  AUTO_ROTATE: {
    LANDSCAPE_ONLY: window.Orientation.AUTO_ROTATION_LANDSCAPE_RESTRICTED,
    PORTRAIT_ONLY: window.Orientation.AUTO_ROTATION_PORTRAIT_RESTRICTED,
    ALL_ORIENTATIONS: {
      UNSPECIFIED: window.Orientation.AUTO_ROTATION_UNSPECIFIED,
      PORTRAIT: window.Orientation.USER_ROTATION_PORTRAIT,
      LANDSCAPE: window.Orientation.USER_ROTATION_LANDSCAPE,
      PORTRAIT_INVERTED: window.Orientation.USER_ROTATION_PORTRAIT_INVERTED,
      LANDSCAPE_INVERTED: window.Orientation.USER_ROTATION_LANDSCAPE_INVERTED,
    },
  },
};

interface OrientationMeta {
  value: Orientation;
  name: string;
  description: string;
  category: string;
  isRestricted: boolean;
}

export class WindowOrientationHelper {
  private static readonly metaList: OrientationMeta[] = [
    {
      value: window.Orientation.FOLLOW_DESKTOP,
      name: '跟随桌面',
      description: '窗口继承桌面旋转行为，不受控制中心限制',
      category: '特殊模式',
      isRestricted: false,
    },
    {
      value: window.Orientation.UNSPECIFIED,
      name: '系统默认',
      description: '由系统决定旋转策略，行为不可预测，一般不建议主动使用',
      category: '特殊模式',
      isRestricted: false,
    },
    {
      value: window.Orientation.LOCKED,
      name: '锁定当前方向',
      description: '窗口固定在当前屏幕方向，不受控制中心影响',
      category: '固定方向',
      isRestricted: false,
    },
    {
      value: window.Orientation.PORTRAIT,
      name: '固定竖屏',
      description: '窗口始终保持正向竖屏',
      category: '固定方向',
      isRestricted: false,
    },
    {
      value: window.Orientation.LANDSCAPE,
      name: '固定横屏',
      description: '窗口始终保持正向横屏',
      category: '固定方向',
      isRestricted: false,
    },
    {
      value: window.Orientation.PORTRAIT_INVERTED,
      name: '固定反向竖屏',
      description: '窗口始终保持倒置竖屏',
      category: '固定方向',
      isRestricted: false,
    },
    {
      value: window.Orientation.LANDSCAPE_INVERTED,
      name: '固定反向横屏',
      description: '窗口始终保持倒置横屏',
      category: '固定方向',
      isRestricted: false,
    },
    {
      value: window.Orientation.AUTO_ROTATION_LANDSCAPE_RESTRICTED,
      name: '自动旋转（仅横屏，受限）',
      description: '仅在横屏两个方向间旋转，受控制中心旋转锁定影响',
      category: '自动旋转（受限制）',
      isRestricted: true,
    },
    {
      value: window.Orientation.AUTO_ROTATION_PORTRAIT_RESTRICTED,
      name: '自动旋转（仅竖屏，受限）',
      description: '仅在竖屏两个方向间旋转，受控制中心旋转锁定影响',
      category: '自动旋转（受限制）',
      isRestricted: true,
    },
    {
      value: window.Orientation.AUTO_ROTATION_RESTRICTED,
      name: '自动旋转（全向，受限）',
      description: '允许所有方向旋转，但受控制中心旋转锁定影响',
      category: '自动旋转（受限制）',
      isRestricted: true,
    },
    {
      value: window.Orientation.AUTO_ROTATION_UNSPECIFIED,
      name: '系统优化的自动旋转',
      description: '系统根据设备类型智能决定可旋转的方向，受控制中心旋转锁定影响',
      category: '自动旋转（受限制）',
      isRestricted: true,
    },
    {
      value: window.Orientation.USER_ROTATION_PORTRAIT,
      name: '首选竖屏后自动旋转',
      description: '先转到竖屏方向，随后允许全向旋转，受控制中心影响',
      category: '首选方向',
      isRestricted: true,
    },
    {
      value: window.Orientation.USER_ROTATION_LANDSCAPE,
      name: '首选横屏后自动旋转',
      description: '先转到横屏方向，随后允许全向旋转，受控制中心影响',
      category: '首选方向',
      isRestricted: true,
    },
    {
      value: window.Orientation.USER_ROTATION_PORTRAIT_INVERTED,
      name: '首选反向竖屏后自动旋转',
      description: '先转到反向竖屏，随后允许全向旋转，受控制中心影响',
      category: '首选方向',
      isRestricted: true,
    },
    {
      value: window.Orientation.USER_ROTATION_LANDSCAPE_INVERTED,
      name: '首选反向横屏后自动旋转',
      description: '先转到反向横屏，随后允许全向旋转，受控制中心影响',
      category: '首选方向',
      isRestricted: true,
    },
    {
      value: window.Orientation.AUTO_ROTATION_LANDSCAPE,
      name: '自动旋转（仅横屏，不受限）',
      description: '仅在横屏方向间旋转，不受控制中心限制',
      category: '自动旋转（不受限制）',
      isRestricted: false,
    },
    {
      value: window.Orientation.AUTO_ROTATION_PORTRAIT,
      name: '自动旋转（仅竖屏，不受限）',
      description: '仅在竖屏方向间旋转，不受控制中心限制',
      category: '自动旋转（不受限制）',
      isRestricted: false,
    },
    {
      value: window.Orientation.AUTO_ROTATION,
      name: '自动旋转（全向，不受限）',
      description: '允许所有方向旋转，不受控制中心限制',
      category: '自动旋转（不受限制）',
      isRestricted: false,
    },
  ];
  private static readonly metaMap: Map<Orientation, OrientationMeta> = (() => {
    const map = new Map<Orientation, OrientationMeta>();
    for (const meta of WindowOrientationHelper.metaList) {
      map.set(meta.value, meta);
    }
    return map;
  })();

  static describe(orientation: Orientation): OrientationDescription {
    const meta = WindowOrientationHelper.metaMap.get(orientation);
    if (meta) {
      return {
        name: meta.name,
        description: meta.description,
        isRestrictedByControlCenter: meta.isRestricted,
        category: meta.category,
      };
    }
    return {
      name: '未知策略',
      description: `未定义的策略值: ${orientation}`,
      isRestrictedByControlCenter: false,
      category: '未知',
    };
  }

  static getName(orientation: Orientation): string {
    return WindowOrientationHelper.describe(orientation).name;
  }

  static isRestricted(orientation: Orientation): boolean {
    return WindowOrientationHelper.describe(orientation).isRestrictedByControlCenter;
  }

  static getCategory(orientation: Orientation): string {
    return WindowOrientationHelper.describe(orientation).category;
  }

  static getAllOptions(): OrientationOption[] {
    return WindowOrientationHelper.metaList.map(meta => ({
      value: meta.value,
      label: meta.name,
      category: meta.category,
      description: meta.description,
    } as OrientationOption));
  }

  static get presets(): OrientationPresetsType {
    return orientationPresets;
  }

  static fixed(orientation?: WindowOrientationType): Orientation {
    if (!orientation || orientation === 'UNSPECIFIED') {
      return window.Orientation.LOCKED;
    }
    switch (orientation) {
      case 'PORTRAIT':
        return window.Orientation.PORTRAIT;
      case 'LANDSCAPE':
        return window.Orientation.LANDSCAPE;
      case 'PORTRAIT_INVERTED':
        return window.Orientation.PORTRAIT_INVERTED;
      case 'LANDSCAPE_INVERTED':
        return window.Orientation.LANDSCAPE_INVERTED;
      default:
        return window.Orientation.LOCKED;
    }
  }

  static followDesktop(): Orientation {
    return window.Orientation.FOLLOW_DESKTOP;
  }

  static autoRotate(range: AutoRotateRange, preferred?: WindowOrientationType): Orientation {
    if (range === 'LANDSCAPE_ONLY') {
      return window.Orientation.AUTO_ROTATION_LANDSCAPE_RESTRICTED;
    }
    if (range === 'PORTRAIT_ONLY') {
      return window.Orientation.AUTO_ROTATION_PORTRAIT_RESTRICTED;
    }
    if (!preferred || preferred === 'UNSPECIFIED') {
      return window.Orientation.AUTO_ROTATION_UNSPECIFIED;
    }
    switch (preferred) {
      case 'PORTRAIT':
        return window.Orientation.USER_ROTATION_PORTRAIT;
      case 'LANDSCAPE':
        return window.Orientation.USER_ROTATION_LANDSCAPE;
      case 'PORTRAIT_INVERTED':
        return window.Orientation.USER_ROTATION_PORTRAIT_INVERTED;
      case 'LANDSCAPE_INVERTED':
        return window.Orientation.USER_ROTATION_LANDSCAPE_INVERTED;
      default:
        return window.Orientation.AUTO_ROTATION_RESTRICTED;
    }
  }

  static autoRotateUnrestricted(range: AutoRotateRange): Orientation {
    switch (range) {
      case 'LANDSCAPE_ONLY':
        return window.Orientation.AUTO_ROTATION_LANDSCAPE;
      case 'PORTRAIT_ONLY':
        return window.Orientation.AUTO_ROTATION_PORTRAIT;
      case 'ALL_ORIENTATIONS':
        return window.Orientation.AUTO_ROTATION;
      default:
        return window.Orientation.AUTO_ROTATION;
    }
  }

  static select(config?: OrientationConfig): Orientation {
    switch (config?.mode) {
      case 'followDesktop':
        return WindowOrientationHelper.followDesktop();
      case 'fixed':
        return WindowOrientationHelper.fixed(config.orientation);
      case 'autoRotate':
        return WindowOrientationHelper.autoRotate(config.range, config.preferred);
      default:
        return window.Orientation.UNSPECIFIED;
    }
  }
}
