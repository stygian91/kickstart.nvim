vim.g.mapleader      = ' '
vim.g.maplocalleader = ' '

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch       = true
-- highlight current line
vim.o.cursorline     = true
-- relative line numbers
vim.o.rnu            = true

-- Make line numbers default
vim.wo.number        = true

-- Enable mouse mode
vim.o.mouse          = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent    = true

-- Save undo history
vim.o.undofile       = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase     = true
vim.o.smartcase      = true

-- Keep signcolumn on by default
vim.wo.signcolumn    = 'yes'

-- Decrease update time
vim.o.updatetime     = 250
vim.o.timeoutlen     = 0

-- Set completeopt to have a better completion experience
vim.o.completeopt    = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors  = true

-- spacing
vim.o.tabstop        = 2
vim.o.softtabstop    = 2
vim.o.shiftwidth     = 2
vim.o.expandtab      = true

-- display spaces/tabs
vim.o.list           = false -- off by default
vim.o.listchars      = 'tab:» ,trail:~,extends:>,precedes:<,space:·'

-- Add Laravel Blade templates as a file type
vim.filetype.add({
  pattern = {
    ['*.blade.php'] = 'blade'
  }
})

-- Map BG phonetic keyboard to English layout so we can use basic vim keybinds in normal mode without switching keyboard layouts
vim.o.langmap =
"яq,вw,еe,рr,тt,ъy,уu,иi,оo,пp,ш[,щ],аa,сs,дd,фf,гg,хh,йj,кk,лl,зz,ьx,цc,жv,бb,нn,мm,ч`,ЯQ,ВW,ЕE,РR,ТT,ЪY,УU,ИI,ОO,ПP,Ш{,Щ},АA,СS,ДD,ФF,ГG,ХH,ЙJ,КK,ЛL,ЗZ,ЬX,ЦC,ЖV,БB,НN,МM,Ч~"
