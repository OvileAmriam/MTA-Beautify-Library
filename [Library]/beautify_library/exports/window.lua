----------------------------------------------------------------
--[[ Resource: Beautify Library
     Script: exports: window.lua
     Server: -
     Author: OvileAmriam
     Developer: -
     DOC: 01/02/2021 (OvileAmriam)
     Desc: Window's Exports ]]--
----------------------------------------------------------------


----------------------------------
--[[ Function: Creates Window ]]--
----------------------------------

function createWindow(...)

    local parameters = {...}
    local elementType = "beautify_window"
    if not isUIParametersValid(parameters, elementType) then return false end
    local createdElement = createElement(elementType)
    if not createdElement then return false end

    createdElements[createdElement] = {
        gui = {},
        scroller = {}
    }
    for i, j in ipairs(availableElements[elementType].__syntax.parameters) do
        if j.name == "x" or j.name == "y" then
            createdElements[createdElement].gui[j.name] = math.max(0, parameters[i])
        elseif j.name == "width" or j.name == "height" then
            createdElements[createdElement].gui[j.name] = math.max(availableElements[elementType].__minimumSize, parameters[i])
        else
            createdElements[createdElement].gui[j.name] = parameters[i]
        end
    end
    createdElements[createdElement].gui.postGUI = (parameters[7] and true) or false
    createdElements[createdElement].gui.titleBar = {
        color = {175, 175, 175, 255},
        closeBtn = {}
    }
    createdElements[createdElement].isValid = true
    return createdElement

end