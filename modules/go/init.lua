local M={}

M.mautocomplete_snippets=true

buffer.tab_indents=true
buffer.use_tabs=true

-- M.format_command='gofmt -s -w'
-- M.format_command='goimports -w'
M.format_command='gofumports -w'

events.connect(events.FILE_AFTER_SAVE, function(file)
    if buffer:get_lexer() ~= 'go' then return end
    local p=io.popen(('%s %s 2>&1'):format(M.format_command,file))
    local out=p:read('*a')
    local status={p:close()}
    if status[3] == 0 then
        buffer:reload()
        return
    elseif status[3] == 127 then
        ui.print(M.format_command..' not installed!.')
        return
    end
    local errors=string.gmatch(out,'(%d+):(%d+): ([^\n]+)')
    buffer:annotation_clear_all()
    for line,col,msg in errors do
        line=tonumber(line) or 1
        buffer.annotation_text[line]=msg
        buffer.annotation_style[line]=13
    end
end)

--[[ go reserved keywords
break        default      func         interface    select
case         defer        go           map          struct
chan         else         goto         package      switch
const        fallthrough  if           range        type
continue     for          import       return       var
]]

local snip=snippets.go
snip["main"]="package main\n\nfunc main(){\n%0\n}"
snip["if"]="if %1(err!=nil) {\n%0\n}"
snip["select"]="select {\ncase %1(<-c):\n%0\n}"
snip["switch"]="switch %1 {\ncase %2(true):\n%0\n}"
snip["const"]="const (\n%0\n)"
snip["type"]="type (\n%0\n)"
snip["var"]="var (\n%0\n)"
snip["err"]="var err error"

return M
