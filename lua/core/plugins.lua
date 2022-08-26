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

local function init_packer()
  -- If packer can't be called, then install it
  local packer_available, packer = pcall(require, "packer")
  if not packer_available then
    vim.fn.delete(packer_path, "rf")
    -- clone repo
    vim.fn.system {
      "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", packer_path
    }
    vim.api.nvim_echo({"initialising packer"}, false, {})
    -- Try to re-source after install
    vim.cmd "packadd packer.nvim"
    packer_available, packer = pcall(require, "packer")
    if not packer_available then
      vim.api.nvim_err_writeln(
        "Failed to load packer at " .. packer_path .. "\n\n" .. packer
      )
    end
  end
  return packer
end

local function init_plugins(packer)
  packer.startup {
    function (use)
      -- use all the plugins if, they haven't been init already
      for key, plugin in plugin_table do
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