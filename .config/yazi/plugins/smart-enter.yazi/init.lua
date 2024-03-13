
-- Smartly enter a directory or open a file based on what the hovered item is
return {
    entry = function()

        -- Gets the hovered item
        local hovered_item = cx.active.current.hovered

        -- If no item is hovered, exit the function
        if not hovered_item then return

        -- Otherwise, if the hovered item is a directory,
        -- enter the current directory and exit the function
        elseif hovered_item.cha.is_dir then
            return ya.manager_emit("enter", {})

        -- If the hovered item is selected,
        -- open all the selected items and exit the function
        elseif hovered_item:is_selected() then
            return ya.manager_emit("open", {})
        end

        -- Otherwise, open the hovered item only
        return ya.manager_emit("open", { hovered = true })
    end,
}
