local M = {}

M.format_command = 'gofmt'

events.connect(events.FILE_AFTER_SAVE, function()
    if buffer:get_lexer() ~= 'go' then return end
    local file = buffer.filename
    local p = io.popen(M.format_command..' -w '..file..' 2>&1')
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
    line = tonumber(line)
    buffer.annotation_clear_all()
    buffer.annotation_visible = buffer.ANNOTATION_BOXED
    buffer.annotation_text[line] = msg
    buffer.annotation_style[line] = 6
end)

snippets.go = {
}

return M
