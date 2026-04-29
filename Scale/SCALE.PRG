PROGRAM SCALE
VAR
	scale : ai_scale;
END_VAR

// Обработка единственного аналогового сигнала:
// GVL_SCALE.AI_IN_RAW[furnace_draft]   - сырое значение с AI
// GVL_SCALE.AI_IN_SCALE[furnace_draft] - значение после фильтрации и масштабирования
// GVL_SCALE.AI_IN_WARN_MIN/MAX[]       - предупреждения
// GVL_SCALE.AI_IN_ALARM_MIN/MAX[]      - аварии

// === IMPLEMENTATION ===

scale(
	in := GVL_SCALE.AI_IN_RAW,
	ch_err := GVL_SCALE.AI_IN_ERR,
	settings := SETTINGS.SENSOR_AI_SETTINGS,
	out_r => GVL_SCALE.AI_IN_SCALE,
	warning_min => GVL_SCALE.AI_IN_WARN_MIN,
	warning_max => GVL_SCALE.AI_IN_WARN_MAX,
	alarm_min => GVL_SCALE.AI_IN_ALARM_MIN,
	alarm_max => GVL_SCALE.AI_IN_ALARM_MAX
);