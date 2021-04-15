local vim = vim
local gl = require("galaxyline")
local gls = gl.section
local vcs = require('galaxyline.provider_vcs')
local buffer = require('galaxyline.provider_buffer')
local fileinfo = require('galaxyline.provider_fileinfo')

GitBranch = vcs.get_git_branch
-- LineColumn = fileinfo.line_column
local LineColumn = function()
  local line = vim.fn.line('.')
  local column = vim.fn.col('.')
  return string.format("%d:%d ", line, column)
end
LinePercent = fileinfo.current_line_percent
FileFormat = fileinfo.get_file_format
FileEncode = fileinfo.get_file_encode
FileTypeName = buffer.get_buffer_filetype

-- Convert UTF-8 hex code to character
local function u(code)
    if type(code) == 'string' then code = tonumber('0x' .. code) end
    local c = string.char
    if code <= 0x7f then return c(code) end
    local t = {}
    if code <= 0x07ff then
        t[1] = c(bit.bor(0xc0, bit.rshift(code, 6)))
        t[2] = c(bit.bor(0x80, bit.band(code, 0x3f)))
    elseif code <= 0xffff then
        t[1] = c(bit.bor(0xe0, bit.rshift(code, 12)))
        t[2] = c(bit.bor(0x80, bit.band(bit.rshift(code, 6), 0x3f)))
        t[3] = c(bit.bor(0x80, bit.band(code, 0x3f)))
    else
        t[1] = c(bit.bor(0xf0, bit.rshift(code, 18)))
        t[2] = c(bit.bor(0x80, bit.band(bit.rshift(code, 12), 0x3f)))
        t[3] = c(bit.bor(0x80, bit.band(bit.rshift(code, 6), 0x3f)))
        t[4] = c(bit.bor(0x80, bit.band(code, 0x3f)))
    end
    return table.concat(t)
end

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 30 then
    return true
  end
  return false
end


local colors = {
    bg = '#282c34',
    line_bg = '#353644',
    fg = '#8FBCBB',
    fg_green = '#65a380',

    bg_green = '#98C379',
    fg_black = '#282C34',
    -- fg_black = '#98C379',

    yellow = '#fabd2f',
    cyan = '#008080',
    darkblue = '#081633',
    green = '#afd700',
    orange = '#FF8800',
    purple = '#5d4d7a',
    magenta = '#c678dd',
    blue = '#51afef';
    red = '#ec5f67'
}


local icons = {
  left_filled = u '258c',
  china_flag = u '1F1E8',
  fish = u '1F41F',
  b = ' ',
  branch = ' ',
  worker = ' ',
  -- worker = '🧑  ',
  running = 'ﰌ',
  -- car = '🚗 ',
  car = '',
  left_arrow = ' ',
}

--[[
local running_man = function()
  local max_len = 30
  local counter = 0
  local i = icons.running
  local run_icon = nil
  local timer = vim.loop.new_timer()
  timer:start(1000, 1000, vim.schedule_wrap(function()
    counter = counter + 1
    counter = counter >= max_len and counter - max_len or counter
    if counter == 0 then
      i = i == icons.car and icons.running or icons.car
      run_icon = string.format("%" .. max_len .. "s", " ") .. i
    else
      run_icon = string.format("%" .. (max_len - counter) .. "s", " ") ..
        i .. string.format("%" .. counter .. "s", " ")
    end
  end))

  return function()
    return run_icon
  end
end

local running_func = running_man()
--]]

local lower = function(f)
  return function()
    local s = f()
    return s:lower()
  end
end

gl.short_line_list = {
    'LuaTree',
    'vista',
    'dbui',
    'startify',
    'term',
    'nerdtree',
    'fugitive',
    'fugitiveblame',
    'plug'
}

gls.left = {
  {
    FirstElement = {
      provider = function()
        return " "
      end,
      highlight = {colors.fg_black, colors.bg_green},
    }
  },
  {
    ViMode = {
      provider = function()
        -- auto change color according the vim mode
        local alias = {
            n = 'NORMAL',
            i = 'INSERT',
            c= 'COMMAND',
            V= 'VISUAL',
            [''] = 'VISUAL',
            v ='VISUAL',
            -- c  = 'COMMAND-LINE',
            ['r?'] = ':CONFIRM',
            rm = '--MORE',
            R  = 'REPLACE',
            Rv = 'VIRTUAL',
            s  = 'SELECT',
            S  = 'SELECT',
            ['r']  = 'HIT-ENTER',
            [''] = 'SELECT',
            t  = 'TERMINAL',
            ['!']  = 'SHELL',
        }
        local mode_color = {
            n = colors.green,
            i = colors.blue,v=colors.magenta,[''] = colors.blue,V=colors.blue,
            c = colors.red,no = colors.magenta,s = colors.orange,S=colors.orange,
            [''] = colors.orange,ic = colors.yellow,R = colors.purple,Rv = colors.purple,
            cv = colors.red,ce=colors.red, r = colors.cyan,rm = colors.cyan, ['r?'] = colors.cyan,
            ['!']  = colors.green,t = colors.green,
            c  = colors.purple,
            ['r?'] = colors.red,
            ['r']  = colors.red,
            rm = colors.red,
            R  = colors.yellow,
            Rv = colors.magenta,
        }
        local vim_mode = vim.fn.mode()
        -- vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim_mode])
        return " " .. alias[vim_mode] .. " " --.. '  '
      end,
      highlight = {colors.fg_black, colors.bg_green},
      separator = " ",
    },
  },
  --
  {
    GitBranch = {
      provider = 'GitBranch',
      separator = " ",
      icon = icons.branch,
      condition = require('galaxyline.provider_vcs').check_git_workspace,
      -- highlight = {'#8FBCBB',colors.line_bg,'bold'},
    }
  },
  --
  {
    Jerry = {
      provider = function()
        return "Jerry Wang"
      end,
      icon = icons.worker,
      -- condition = checkwidth,
      separator = " ",
    }
  }
}

gls.mid = {
  --[[
  {
    RunningMan = {
      provider = running_func,
    }
  },
    --]]
}

gls.short_line_left = {
  {
    FirstElement = {
      provider = function()
        return " "
      end,
      highlight = {colors.fg_black, colors.bg_green},
    }
  },
  {
    ViMode = {
      provider = function()
        -- auto change color according the vim mode
        local alias = {
            n = 'NORMAL',
            i = 'INSERT',
            c= 'COMMAND',
            V= 'VISUAL',
            [''] = 'VISUAL',
            v ='VISUAL',
            -- c  = 'COMMAND-LINE',
            ['r?'] = ':CONFIRM',
            rm = '--MORE',
            R  = 'REPLACE',
            Rv = 'VIRTUAL',
            s  = 'SELECT',
            S  = 'SELECT',
            ['r']  = 'HIT-ENTER',
            [''] = 'SELECT',
            t  = 'TERMINAL',
            ['!']  = 'SHELL',
        }
        local mode_color = {
            n = colors.green,
            i = colors.blue,v=colors.magenta,[''] = colors.blue,V=colors.blue,
            c = colors.red,no = colors.magenta,s = colors.orange,S=colors.orange,
            [''] = colors.orange,ic = colors.yellow,R = colors.purple,Rv = colors.purple,
            cv = colors.red,ce=colors.red, r = colors.cyan,rm = colors.cyan, ['r?'] = colors.cyan,
            ['!']  = colors.green,t = colors.green,
            c  = colors.purple,
            ['r?'] = colors.red,
            ['r']  = colors.red,
            rm = colors.red,
            R  = colors.yellow,
            Rv = colors.magenta,
        }
        local vim_mode = vim.fn.mode()
        -- vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim_mode])
        return " " .. alias[vim_mode] .. " " --.. '  '
      end,
      highlight = {colors.fg_black, colors.bg_green},
      separator = " ",
    },
  },
  {
    GitBranch = {
      provider = 'GitBranch',
      separator = " ",
      icon = icons.branch,
      condition = require('galaxyline.provider_vcs').check_git_workspace,
      -- highlight = {'#8FBCBB',colors.line_bg,'bold'},
    }
  },
  --
  {
    Jerry = {
      provider = function()
        return "Jerry Wang"
      end,
      icon = icons.worker,
      condition = checkwidth,
      separator = " ",
    }
  }
}


gls.right = {
  {
      LspStatus = {
          provider = function()
              local connected =
                not vim.tbl_isempty(vim.lsp.buf_get_clients(0))
              if connected then
                  return require('lsp-status').status()
              else
                  return ''
              end
          end,
          separator_highlight = 'GalaxyViModeInv',
      },
  },
  --
  {
    FileFormat  = {
      provider = lower(FileFormat),
    }
  },
  {
   FileEncode  = {
      provider = lower(FileEncode),
      separator = " |",
    }
  },
  {
    FileTypeName = {
      provider = lower(FileTypeName),
      separator = " | ",
    }
  },
  {
    LinePercent = {
      provider = LinePercent,
      separator = " |",
    }
  },
  {
    LineColumn  = {
      provider = LineColumn,
      highlight = {colors.fg_black, colors.bg_green},
      separator = " ",
      separator_highlight = {colors.fg_black, colors.bg_green},
    }
  },
}


gls.short_line_right = {
  {
    FileTypeName = {
      provider = lower(FileTypeName),
    }
  },
  {
    LinePercent = {
      provider = LinePercent,
      separator = " |",
    }
  },
  ---[[
  {
    LineColumn  = {
      provider = LineColumn,
      highlight = {colors.fg_black, colors.bg_green},
      separator = " ",
      separator_highlight = {colors.fg_black, colors.bg_green},
    }
  },
    --]]
}




--[[
-- source provider function
local diagnostic = require('galaxyline.provider_diagnostic')
local vcs = require('galaxyline.provider_vcs')
local fileinfo = require('galaxyline.provider_fileinfo')
local extension = require('galaxyline.provider_extensions')
local buffer = require('galaxyline.provider_buffer')
local whitespace = require('galaxyline.provider_whitespace')
local lspclient = require('galaxyline.provider_lsp')

-- provider
BufferIcon  = buffer.get_buffer_type_icon
BufferNumber = buffer.get_buffer_number
FileTypeName = buffer.get_buffer_filetype
-- Git Provider
GitBranch = vcs.get_git_branch
DiffAdd = vcs.diff_add,             -- support vim-gitgutter vim-signify gitsigns
DiffModified = vcs.diff_modified,   -- support vim-gitgutter vim-signify gitsigns
DiffRemove = vcs.diff_remove,       -- support vim-gitgutter vim-signify gitsigns
-- File Provider
LineColumn = fileinfo.line_column,
FileFormat = fileinfo.get_file_format,
FileEncode = fileinfo.get_file_encode,
FileSize = fileinfo.get_file_size,
FileIcon = fileinfo.get_file_icon,
FileName = fileinfo.get_current_file_name,
LinePercent = fileinfo.current_line_percent,
ScrollBar = extension.scrollbar_instance,
VistaPlugin = extension.vista_nearest,
-- Whitespace
Whitespace = whitespace.get_item,
-- Diagnostic Provider
DiagnosticError = diagnostic.get_diagnostic_error,
DiagnosticWarn = diagnostic.get_diagnostic_warn,
DiagnosticHint = diagnostic.get_diagnostic_hint,
DiagnosticInfo = diagnostic.get_diagnostic_info,
-- LSP
GetLspClient = lspclient.get_lsp_client,
--]]
