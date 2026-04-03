local normal_keys       = "qwertyuiopasdfghjkl;zxcvbnm,.QWERTYUIOPASDFGHJKLZXCVBNM"
local lang_keys         = "явертъуиопасдфгхйкл;зьцжбнм,.ЯВЕРТЪУИОПАСДФГХЙКЛЗЬЦЖБНМ"

local translation_table = {}
local len               = vim.fn.strchars(normal_keys)

for i = 0, len - 1 do
    local n_char = vim.fn.strcharpart(normal_keys, i, 1)
    local l_char = vim.fn.strcharpart(lang_keys, i, 1)
    translation_table[n_char] = l_char
end

local function translate_sequence(lhs)
    local result = ""
    local i = 1
    while i <= #lhs do
        local char = lhs:sub(i, i)
        if char == "<" then
            local end_pos = lhs:find(">", i)
            if end_pos then
                local tag = lhs:sub(i, end_pos)

                -- Check if it's a modifier like <C-x>, <M-x>, <A-x>, <D-x>
                -- The pattern looks for < followed by a letter, a dash, then the key
                local modifier, key = tag:match("<([CMAD])%-(.+)>")

                if modifier and key then
                    -- Translate the 'key' part inside the modifier
                    local translated_key = translation_table[key] or key
                    result = result .. string.format("<%s-%s>", modifier, translated_key)
                else
                    -- It's a standard tag like <leader> or <CR>, keep it as is
                    result = result .. tag
                end
                i = end_pos + 1
            else
                result = result .. char
                i = i + 1
            end
        else
            -- Standard single character translation
            result = result .. (translation_table[char] or char)
            i = i + 1
        end
    end
    return result
end

local function map(mode, left, right, opts)
    vim.keymap.set(mode, left, right, opts)

    local translated = translate_sequence(left)
    if translated ~= left then
        vim.keymap.set(mode, translated, right, opts)
    end
end

local function nmap(left, right, opts)
    return map('n', left, right, opts)
end

return {
    map = map,
    nmap = nmap,
}
