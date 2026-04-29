SETTINGS.armature_simulation:= TRUE;


(* Состояние котла
х0: Вентиляция не проведена
x1: Опрессовка не проведена
x2: Нет готовности к розжигу (аварийный параметр)
x3: Готов к розжигу
x4: Розжиг
x5: Работа
x6: Аварийный останов
*)
//x0 - вентиляция не проведена
boiler_mode.in[1]:= NOT GVL_VENTILATION.vent_state_decoded.success;
//x1 - опрессовка не проведена
boiler_mode.in[2]:= NOT GVL_PRESSURE.Pressure_state_structure.success;
//x3 - общая неисправность
boiler_mode.in[3]:= GVL_PROTECT.main_alarm;
//x4 - розжиг
boiler_mode.in[4]:= GVL_BURNER.boiler_in_process;
//x5 - работа
boiler_mode.in[5]:= GVL_BURNER.boiler_run;


boiler_mode(state_word => GVL_MAIN.Boiler_status);



SCALE();
IGNITION();
PROTECT();
BURNER();
REGULATOR();
BLOCKS();
PRESSURE();
VENTILATION();
IGNITION_SEQUENCE();
ARMATURE();
