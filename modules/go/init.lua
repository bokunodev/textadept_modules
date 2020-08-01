local M = {}

M.format_command = 'gofmt'

local PATHSEP = not WIN32 and '/' or '\\'
local GOPATH = os.getenv('GOPATH')
local GOFLAGS = '-v -trimpath -ldflags=\'-s -w -buildid=\' -asmflags=-trimpath='..GOPATH..' -gcflags=-trimpath='..GOPATH
textadept.run.run_commands.go = 'go run '..GOFLAGS..' .'
textadept.run.compile_commands.go = 'go build '..GOFLAGS..' .'
textadept.run.error_patterns.go = {'^(.-):(%d+):(%d+): (.+)$'}

function M.run_go_test()
  local dir = string.gsub(buffer.filename,'[^'..PATHSEP..']+$','')
  local _,obj = lfs.dir(dir)
  local each,go_files = '',''
  each = obj:next()
  while each ~= nil do
    if lfs.attributes(each,'mode') == 'file' and string.find(each,'%.go$') then
      go_files = go_files..string.format(' "%s%s"',dir,each)
    end
    each = obj:next()
  end
  obj:close()
  local p = io.popen('cd '..dir..' && go test -v -c -vet=off '..go_files..' 2>&1')
  local out = p:read('*a')
  local status = {p:close()}
  ui.print(out)
end

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
  local line,col,msg = string.match(out,':(%d-):(%d)-:([^\n]+)')
  line = tonumber(line)
  buffer.annotation_clear_all()
  buffer.annotation_visible = buffer.ANNOTATION_BOXED
  buffer.annotation_text[line] = msg
  buffer.annotation_style[line] = 6
end)

return M
