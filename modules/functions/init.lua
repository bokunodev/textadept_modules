local M = {}

function M.delete_line_or_lines()
    buffer:begin_undo_action()
    if buffer.selection_empty then
        buffer:line_delete()
    else
        local start_line = buffer:line_from_position(buffer.selection_start)
        local end_line = buffer:line_from_position(buffer.selection_end)
        local start_pos = buffer:position_from_line(start_line)
        local end_pos = buffer:position_from_line(end_line + 1)
        buffer:delete_range(start_pos, end_pos - start_pos)
    end
    buffer:end_undo_action()
end

function M.cut_line_or_selection()
    buffer:begin_undo_action()
    if buffer.selection_empty then
        buffer:line_cut()
    else
        buffer:cut()
    end
    buffer:end_undo_action()
end

function M.copy_line_or_selection()
    if buffer.selection_empty then
        buffer:line_copy()
    else
        buffer:copy()
    end
end

function M.duplicate_line_or_selection()
    buffer:begin_undo_action()
    if buffer.selection_empty then
        buffer:line_duplicate()
    else
        buffer:selection_duplicate()
    end
    buffer:end_undo_action()
end

function M.exo_open_terminal()
    if buffer.filename ~= nil then
        dir,_ = buffer.filename:gsub('(.*)/([^/]*)$','%1')
    else
        dir = lfs.currentdir()
    end
    os.execute(('exo-open --launch TerminalEmulator --working-directory %s &'):format(dir))
end

return M
