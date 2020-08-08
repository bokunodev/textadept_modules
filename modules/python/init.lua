local M = {}

M.format_command = 'pyflakes'

events.connect(events.FILE_AFTER_SAVE, function()
    if buffer:get_lexer() ~= 'python' then return end
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
    local line,col,msg = string.match(out,'(%d+):(%d+):? ([^\n]+)')
    line = tonumber(line)
    buffer.annotation_clear_all()
    buffer.annotation_visible = buffer.ANNOTATION_BOXED
    buffer.annotation_text[line] = msg
    buffer.annotation_style[line] = 6
    textadept.editing.goto_line(line)
end)

return M
