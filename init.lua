_M['go'] = require('go')
_M['go'].format_command = 'goimports'

_M['m/f'] = require('functions')

keys['ctrl+`'] = function() _M['m/f'].enclose_selection('`', '`') end
keys['ctrl+\''] = function() _M['m/f'].enclose_selection('\'', '\'') end
keys['ctrl+"'] = function() _M['m/f'].enclose_selection('"', '"') end
keys['ctrl+('] = function() _M['m/f'].enclose_selection('(', ')') end
keys['ctrl+['] = function() _M['m/f'].enclose_selection('[', ']') end
keys['ctrl+{'] = function() _M['m/f'].enclose_selection('{', '}') end

keys['ctrl+k'] = function() _M['m/f'].delete_line_or_lines() end
keys['ctrl+x'] = function() _M['m/f'].cut_line_or_selection() end
keys['ctrl+c'] = function() _M['m/f'].copy_line_or_selection() end
keys['ctrl+d'] = function() _M['m/f'].duplicate_line_or_selection() end

keys['alt+B'] = function() textadept.bookmarks.toggle() end
keys['alt+S'] = function()	io.save_all_files() end

events.connect(events.LEXER_LOADED, function(lang)
	if lang == 'go' then
		keys['ctrl+t'] = function() _M['go'].run_go_test() end
	elseif lang == 'css' then
		keys[':'] = function() _M['m/f'].enclose_selection(':', ';') end
	end
end)

view:set_theme('nord',{font = 'Cartograph CF', fontsize = 10})
buffer.wrap_visual_flags = buffer.WRAPVISUALFLAGLOC_START_BY_TEXT
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
