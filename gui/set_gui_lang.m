function set_gui_lang(handles, lang)
% SET GUI LANG
% This function set all gui lang strings.
%
% Author: Pablo Pizarro @ppizarror.com, 2017.
%
% This program is free software; you can redistribute it and/or
% modify it under the terms of the GNU General Public License
% as published by the Free Software Foundation; either version 2
% of the License, or (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

set_lang_string(handles.table_add_row, lang{1}); %#ok<*USENS>
set_lang_string(handles.menu_add_row_table, lang{1});
set_lang_string(handles.delete_last_row, lang{2});
set_lang_string(handles.menu_delete_row_table, lang{2});
set_lang_string(handles.table_import_from_excel, lang{4});
set_lang_string(handles.menu_import_table_from_excel, lang{4});
set_lang_string(handles.initial_solution_table_title, lang{15}, 'string');
set_lang_string(handles.menu_file, lang{11});
set_lang_string(handles.menu_file_new, lang{12});
set_lang_string(handles.menu_file_load, lang{13});
set_lang_string(handles.menu_edition, lang{16});
set_lang_string(handles.menu_edition_cleantable, lang{14});
set_lang_string(handles.menu_help, lang{17});
set_lang_string(handles.menu_about, lang{19});
set_lang_string(handles.menu_view_help, lang{18});
set_lang_string(handles.menu_file_save, lang{20});
set_lang_string(handles.menu_file_save_as, lang{21});
set_lang_string(handles.menu_file_close, lang{22});
set_lang_string(handles.text_dispersion_title, lang{31}, 'string');
set_lang_string(handles.btn_opendispersion, lang{32}, 'string');
set_lang_string(handles.disp_plt_viewlarger, lang{36});
set_lang_string(handles.panel_units, lang{40}, 'Title');
set_lang_string(handles.start_button, lang{42}, 'string');
set_lang_string(handles.view_sol_plot, lang{43}, 'string');
set_lang_string(handles.export_results, lang{44}, 'string');
set_lang_string(handles.inv_entry_panel, lang{45}, 'Title');
set_lang_string(handles.menu_edit_import, lang{118});
set_lang_string(handles.menu_import_dispersion_file, lang{119});
set_lang_string(handles.menu_clean_initial_invparam, lang{120});
set_lang_string(handles.menu_preferences, lang{121});
set_lang_string(handles.menu_cfg_app, lang{122});
set_lang_string(handles.menu_cfg_plot, lang{131});
set_lang_string(handles.menu_cfg_inversion, lang{130});
set_lang_string(handles.menu_cfg_solution, lang{129});

end

