_M.go=require("go")
_M.go.format_command="gofumports -w"

keys["ctrl+k"]=function() buffer:line_delete() end
keys["ctrl+x"]=function() if buffer.selection_empty then buffer:line_cut() else buffer:cut() end end
keys["ctrl+c"]=function() if buffer.selection_empty then buffer:line_copy() else buffer:copy() end end
keys["ctrl+d"]=function() if buffer.selection_empty then buffer:line_duplicate() else buffer:selection_duplicate() end end
keys["alt+a"]=textadept.snippets.insert
keys["esc"]=textadept.snippets.cancel_current
keys["ctrl+space"]=textadept.editing.autocomplete
keys["alt+i"]=function()
    local c=ui.dialogs.colorselect({
        title="color picker",
        color="#ff0000",
        palette=false,
        string_output=true,
        float=false,
    })
    if c~=nil then buffer:insert_text(-1,c) end
end

textadept.editing.auto_pairs={}
textadept.editing.auto_pairs[40]=")"
textadept.editing.auto_pairs[91]="]"
textadept.editing.auto_pairs[123]="}"
textadept.editing.auto_pairs[34]="\""
textadept.editing.auto_pairs[39]="'"
textadept.editing.auto_pairs[96]="`"

textadept.editing.typeover_chars={}
textadept.editing.typeover_chars[41]=true
textadept.editing.typeover_chars[93]=true
textadept.editing.typeover_chars[125]=true
textadept.editing.typeover_chars[34]=true
textadept.editing.typeover_chars[39]=true
textadept.editing.typeover_chars[96]=true

textadept.editing.strip_trailing_spaces=true
textadept.editing.auto_enclose=true
textadept.session.save_on_quit=true

view:set_theme('nord',{font='mononoki', fontsize=10})
view.annotation_visible=view.ANNOTATION_BOXED
view.view_ws=view.WS_VISIBLEAFTERINDENT
view.tab_draw_mode=view.TD_STRIKEOUT
view.wrap_mode=view.WRAP_NONE

buffer.eol_mode=buffer.EOL_LF
buffer.tab_indents=true
buffer.use_tabs=false
buffer.tab_width=4

ui.maximized=true
_SEMANATIC=true

-- try to load textadept session file in current directory, if exists.
-- to act like .workspace file in vscode or sublime.
events.connect(events.INITIALIZED, function()
	local fi = lfs.attributes(".ta_session")
	if fi~=nil and fi.mode=="file" then
		textadept.session.load(".ta_session")
	end
end)
