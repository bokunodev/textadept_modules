local M = {}

buffer.tab_indents = true
buffer.use_tabs = true

-- M.format_command = 'gofmt -s -w'
M.format_command = 'goimports -w'

events.connect(events.FILE_AFTER_SAVE, function()
    if buffer:get_lexer() ~= 'go' then return end
    local p = io.popen(('%s %s 2>&1'):format(M.format_command,buffer.filename))
    local out = p:read('*a')
    local status = {p:close()}
    if status[3] == 0 then
        buffer.reload()
        return
    elseif status[3] == 127 then
        ui.print(M.format_command..' not installed!.')
        return
    end
    local line,col,msg = string.match(out,'.*:(%d+):(%d+):([^\n]+)')
    line = tonumber(line) or 0
    buffer.annotation_clear_all()
    buffer.annotation_visible = buffer.ANNOTATION_BOXED
    buffer.annotation_text[line] = msg
    buffer.annotation_style[line] = 6
    textadept.editing.goto_line(line)
end)

--[[ golang keywords
break        default      func         interface    select
case         defer        go           map          struct
chan         else         goto         package      switch
const        fallthrough  if           range        type
continue     for          import       return       var
]]

snippets.go = {
	['if'] = 'if err != nil {\n\t%0\n}',
	['defer'] = 'defer func(%1){\n\t%0\n}(%2)',
	['for'] = 'for %2(_),%3(_):=range %1{\n\t%0\n}',
	['var'] = 'var(\n\t%0\n)',
	['type'] = 'type(\n\t%0\n)',
	['const'] = 'const(\n\t%0\n)',
}

return M
