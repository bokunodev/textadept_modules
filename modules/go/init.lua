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
	['if']     = 'if %1(err!=nil) { %0 }',
	['else']   = 'else { %0 }',
	['elseif'] = 'elseif %1 { %0 }',
	['func']   = 'func %1(main)(%2)%3 { %0 }',
	['for']    = 'for %1 { %0 }',
	['range']  = 'for %1(_,_)=range %2 { %0 }',
	['select'] = 'select {\ncase %1:\n}',
	['switch'] = 'switch %1 {\ncase %2:\ndefault:\n}',
	['defer']  = 'defer func(){ %0 }()',
	['var']    = 'var (\n%0\n)',
	['type']   = 'type (\n%0\n)',
	['const']  = 'const (\n%0\n)',

    ['logF']    = 'log.Fatal(%0)',
    ['logFf']   = 'log.Fatalf("%1", %0)',
    ['logFln']  = 'log.Fatalln(%0)',
    ['logP']    = 'log.Panic(%0)',
    ['logPf']   = 'log.Panicf("%1", %0)',
    ['logPln']  = 'log.Panicln(%0)',
    ['logPr']   = 'log.Print(%0)',
    ['logPrf']  = 'log.Printf("%1", %0)',
    ['logPrln'] = 'log.Println(%0)',
}

return M
