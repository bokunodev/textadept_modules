local buffer,view = buffer,view
local M = {}

buffer.tab_indents = true
buffer.use_tabs = true

M.format_command = 'pyflakes'

events.connect(events.FILE_AFTER_SAVE, function(file)
    if buffer:get_lexer() ~= 'python' then return end
    local p = io.popen(('%s %s 2>&1'):format(M.format_command,file))
    local out = p:read('*a')
    local status = {p:close()}
    if status[3] == 0 then
        buffer:reload()
        return
    elseif status[3] == 127 then
        ui.print(M.format_command..' not installed!.')
        return
    end
    local errors = string.gmatch(out,'(%d+):(%d+):? ([^\n]+)')
    buffer:annotation_clear_all()
    for line,col,msg in errors do
        line = tonumber(line) or 1
        buffer.annotation_text[line] = msg
        buffer.annotation_style[line] = 13
    end
end)

return M
