local settings_table = {
    -- Options Settings; Equiv to `set key = value`
    opt = {
        copyindent = true, -- Copy the previous indentation on autoindenting
        history = 500, -- Size of history stored
        ignorecase = true, -- Case insensitive searching
        number = true, -- Show numberline
        relativenumber = true, -- Show relative numberline
    },
    -- Global vars / Settings; Equiv to `let g:key = value`
    g = {

    }
}

local function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
end

print("TABLE DUMP:" .. dump(settings_table))


local function load_settings(settings)
    -- vim.api.nvim_err_writeln(settings.toString())
    for scope, option_list in ipairs(settings) do
        vim.api.nvim_err_writeln("HERE")
        for setting, value in pairs(option_list) do
            print(setting .. value .. "\n")
            vim[scope][setting] = value
        end
    end
end

load_settings(settings_table)