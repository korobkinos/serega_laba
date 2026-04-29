PROGRAM PROTECT
VAR
	protect :  protect_main;
END_VAR

// === IMPLEMENTATION ===

// Привязка аналогового сигнала к защите
// Если разрежение ниже аварийного минимума или есть ошибка AI
protect.signal := GVL_SCALE.AI_IN_ALARM_MIN;

// Постановка защиты на контроль (для лабораторного проекта — постоянно)
protect.control := TRUE;

// Основной цикл вызова защиты
protect(
	enable := SETTINGS.protect_enable,
	execute_set := SETTINGS.protect_execute_set,
	execute_reset := SETTINGS.protect_execute_reset,
	alarm_reset := GVL_PROTECT.protect_alarm_reset,
	delay_time := SETTINGS.protect_delay_time,
	alarm => GVL_PROTECT.protect_alarm_out,
	warning => GVL_PROTECT.protect_warning_out,
	execute_state => GVL_PROTECT.protect_execure_state_out
);

GVL_PROTECT.protect_control := protect.control;
GVL_PROTECT.protect_signal := protect.signal;

// Общая авария: сработала хотя бы одна защита
GVL_PROTECT.main_alarm := protect.alarm;
