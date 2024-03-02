-- Yazi lua configuration

-- Rewrite the render function to remove borders
function Manager:render(area)
    local chunks = self:layout(area)

    return ya.flat {
        -- No borders

        -- Parent
        Parent:render(chunks[1]:padding(ui.Padding.x(1))),
        -- Current
        Current:render(chunks[2]),
        -- Preview
        Preview:render(chunks[3]:padding(ui.Padding.x(1))),
    }
end
