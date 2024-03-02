
-- Smartly enter a directory or open a file based on what the hovered item is
return {
    entry = function()
        local h = cx.active.current.hovered
        ya.manager_emit(h and h.cha.is_dir and "enter" or "open", {})
    end,
}
