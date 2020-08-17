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
    line = tonumber(line)
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
    ['if'] = 'if %1 {\n\t%0\n}',
    ['func'] = 'func %1%(%2)%3%{\n\t%0\n}',
    ['defer_func'] = 'defer func(){\n\t%0\n}()',
    ['package'] = 'package %1\nfunc %2(New)(%3)%4 {\n\t%0\n}',
    ['package_main'] = 'package main\nfunc main() {\n\t%0\n}',
    -- github.com/pkg/profile
    ['profile_cpu'] = prof_templ:format('profile.CPUProfile'),
    ['profile_mem'] = prof_templ:format('profile.MemProfile'),
    ['profile_mutex'] = prof_templ:format('profile.MutexProfile'),
    ['profile_trace'] = prof_templ:format('profile.TraceProfile'),
    ['profile_block'] = prof_templ:format('profile.BlockProfile'),
    ['profile_heap'] = prof_templ:format('profile.MemProfileHeap'),
    ['profile_alloc'] = prof_templ:format('profile.MemProfileAllocs'),
    ['profile_goroutine'] = prof_templ:format('profile.GoroutineProfile'),
    ['profile_thread'] = prof_templ:format('profile.ThreadcreationProfile'),
}

return M
