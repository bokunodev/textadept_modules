_M['m/f'] = require('functions')

keys['ctrl+`'] = function() _M['m/f'].enclose_selection('`', '`') end
keys['ctrl+\''] = function() _M['m/f'].enclose_selection('\'', '\'') end
keys['ctrl+"'] = function() _M['m/f'].enclose_selection('"', '"') end
keys['ctrl+('] = function() _M['m/f'].enclose_selection('(', ')') end
keys['ctrl+['] = function() _M['m/f'].enclose_selection('[', ']') end
keys['ctrl+{'] = function() _M['m/f'].enclose_selection('{', '}') end

keys['ctrl+k'] = _M['m/f'].delete_line_or_lines
keys['ctrl+x'] = _M['m/f'].cut_line_or_selection
keys['ctrl+c'] = _M['m/f'].copy_line_or_selection
keys['ctrl+d'] = _M['m/f'].duplicate_line_or_selection
keys['ctrl+T'] = _M['m/f'].exo_open_terminals

keys['alt+B'] = textadept.bookmarks.toggle
keys['alt+S'] = io.save_all_files
keys['alt+a'] = textadept.snippets.insert
keys['escape'] = textadept.snippets.cancel_current

view:set_theme('nord',{font = 'Cartograph CF', fontsize = 10})
buffer.view_ws = buffer.WS_VISIBLEAFTERINDENT
buffer.tab_draw_mode = buffer.TD_STRIKEOUT
buffer.wrap_mode = buffer.WRAP_NONE
buffer.eol_mode = buffer.EOL_LF
buffer.tab_indents = false
buffer.use_tabs = false
buffer.caret_width = 2
buffer.tab_width = 4

textadept.editing.strip_trailing_spaces = true
ui.maximized = true
_SEMANATIC = true
