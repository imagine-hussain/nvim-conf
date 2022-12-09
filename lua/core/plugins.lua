local plugin_table = {
  -- Plugin management
  ["wbthomason/packer.nvim"] = {},

  -- speed go brrrr
  ["lewis6991/impatient.nvim"] = {},

  -- lua functions stuff
  ["nvim-lua/plenary.nvim"] = {
    module = "plenary"
  },

  -- Popup api
  ["nvim-lua/popup.nvim"] = {},
}

local packer_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

-- Bootstrap packer if it's not installed
-- https://github.com/wbthomason/packer.nvima
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

ensure_packer()

local function init_packer()
  -- If packer can't be called, then install it
  local packer_available, packer = pcall(require, "packer")
  if not packer_available then
    print("Packer not available")
    return nil
  end
  -- if not packer_available then
  --   vim.fn.delete(packer_path, "rf")
  --   -- clone repo
  --   vim.fn.system {
  --     "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", packer_path
  --   }
  --   vim.api.nvim_echo({"initialising packer"}, false, {})
  --   -- Try to re-source after install
  --   vim.cmd "packadd packer.nvim"
  --   packer_available, packer = pcall(require, "packer")
  --   if not packer_available then
  --     vim.api.nvim_err_writeln(
  --       "Failed to load packer at " .. packer_path .. "\n\n" .. packer
  --     )
  --   end
  -- end
  return packer
end

local function init_plugins(packer)
  packer.startup {
    function (use)
      -- use all the plugins if, they haven't been init already
      for key, plugin in pairs(plugin_table) do
        if type(key) == "string" and not plugin[1] then
          plugin[1] = key
        end
        use(plugin)
      end
    end
  }
end

local packer = init_packer()
init_plugins(packer)