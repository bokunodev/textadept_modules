_M['m/f'] = require('functions')

keys['ctrl+`']  = function() textadept.editing.enclose('`', '`') end
keys['ctrl+\''] = function() textadept.editing.enclose('\'', '\'') end
keys['ctrl+"']  = function() textadept.editing.enclose('"', '"') end
keys['ctrl+(']  = function() textadept.editing.enclose('(', ')') end
keys['ctrl+[']  = function() textadept.editing.enclose('[', ']') end
keys['ctrl+{']  = function() textadept.editing.enclose('{', '}') end

keys['ctrl+k'] = _M['m/f'].delete_line_or_lines
keys['ctrl+x'] = _M['m/f'].cut_line_or_selection
keys['ctrl+c'] = _M['m/f'].copy_line_or_selection
keys['ctrl+d'] = _M['m/f'].duplicate_line_or_selection
keys['ctrl+T'] = _M['m/f'].exo_open_terminals

keys['ctrl+O'] = io.open_recent_file
keys['alt+O']  = function() buffer:reload() end
keys['alt+B']  = textadept.bookmarks.toggle
keys['alt+S']  = io.save_all_files
keys['alt+a']  = textadept.snippets.insert
keys['escape'] = textadept.snippets.cancel_current

view:set_theme('nord',{font = 'Cartograph CF', fontsize = 10})
view.annotation_visible = view.ANNOTATION_BOXED
view.view_ws = view.WS_VISIBLEAFTERINDENT
view.tab_draw_mode = view.TD_STRIKEOUT
view.wrap_mode = view.WRAP_NONE
view.caret_width = 2

buffer.eol_mode = buffer.EOL_LF
buffer.tab_indents = false
buffer.use_tabs = false
buffer.tab_width = 4

textadept.editing.strip_trailing_spaces = true
ui.maximized = true
_SEMANATIC = true
