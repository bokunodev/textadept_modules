local M = {}

--M.format_command = 'gofmt -s -w'
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

local prof_templ = [[defer profile.Start(
    profile.ProfilePath("."),
    profile.MemProfileRate(1),
    %s).Stop()
]]

snippets.go = {
    ['func'] = 'func %1%(%2)%3%{\n\t%0\n}',
    ['goFunc'] = 'go func(%1){\n\t%0\n}(%2)',
    ['deferFunc'] = 'defer func(%1){\n\t%0\n}(%2)',
    ['pkg'] = 'package %1\nfunc %2(New)(%3)%4 {\n\t%0\n}',
    ['pkgMain'] = 'package main\nfunc main() {\n\t%0\n}',
    ['if'] = 'if %1 {\n\t%0\n}',
    ['ifErr'] = 'if err != nil {\n\t%0\n}',
    ['ifErrFatal'] = 'if err != nil {\n\tLog.Fatal(err)\n}',
    -- github.com/pkg/profile
    ['profCpu'] = prof_templ:format('profile.CPUProfile'),
    ['profMem'] = prof_templ:format('profile.MemProfile'),
    ['profMutex'] = prof_templ:format('profile.MutexProfile'),
    ['profTrace'] = prof_templ:format('profile.TraceProfile'),
    ['profBlock'] = prof_templ:format('profile.BlockProfile'),
    ['profHeap'] = prof_templ:format('profile.MemProfileHeap'),
    ['profAlloc'] = prof_templ:format('profile.MemProfileAllocs'),
    ['profGoroutine'] = prof_templ:format('profile.GoroutineProfile'),
    ['profThread'] = prof_templ:format('profile.ThreadcreationProfile'),
}

return M
