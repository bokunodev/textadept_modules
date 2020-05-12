local M = {}

M.format_command = "gofmt"

local PATHSEP = not WIN32 and '/' or '\\'
local GOPATH = os.getenv("GOPATH")
local GOFLAGS = '-v -trimpath -ldflags="-s -w -buildid=" -asmflags=-trimpath='..GOPATH..' -gcflags=-trimpath='..GOPATH
textadept.run.run_commands.go = 'go run '..GOFLAGS..' .'
textadept.run.compile_commands.go = 'go build '..GOFLAGS..' .'
textadept.run.error_patterns.go = {'^(.-):(%d+):(%d+): (.+)$'}

function M.run_go_test()
	local files, each = '',''
	local dir = string.gsub(buffer.filename,'[^'..PATHSEP..']+$','')
	for each in lfs.dir(dir) do
		if lfs.attributes(dir..each,'mode') == 'file' and string.find(each,'%.go$') then
			files = files..' '..each
		end
	end
	local p = io.popen('cd '..dir..' && go test -c -vet=off '..files..' 2>&1')
	print('cd '..dir..' && go test -c -vet=off '..files..' 2>&1')
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
	end
	local line, msg = out:match(':(%d-):%d-:([^\n]+)')
	line = tonumber(line)
	buffer.annotation_clear_all()
	buffer.annotation_visible = buffer.ANNOTATION_BOXED
	buffer.annotation_text[line] = msg
	buffer.annotation_style[line] = 6
end)

return M
