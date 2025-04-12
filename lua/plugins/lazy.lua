-- [[ Install and configure lazy.nvim plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info

-- Установка lazy.nvim, если его еще нет
local function ensure_lazy()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
      error("Error cloning lazy.nvim:\n" .. out)
    end
  end
  vim.opt.rtp:prepend(lazypath)
end

-- Получение списка плагинов
local function get_plugins()
  return {
    -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
    require("plugins.sleuth"),

    -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
    --
    -- This is often very useful to both group configuration, as well as handle
    -- lazy loading plugins that don't need to be loaded immediately at startup.
    --
    -- For example, in the following configuration, we use:
    --  event = 'VimEnter'
    --
    -- which loads which-key before all the UI elements are loaded. Events can be
    -- normal autocommands events (`:help autocmd-events`).
    --
    -- Then, because we use the `opts` key (recommended), the configuration runs
    -- after the plugin has been loaded as `require(MODULE).setup(opts)`.

    require("plugins.which-key"),

    -- NOTE: Plugins can specify dependencies.
    --
    -- The dependencies are proper plugin specifications as well - anything
    -- you do for a plugin at the top level, you can do for a dependency.
    --
    -- Use the `dependencies` key to specify the dependencies of a particular plugin

    require("plugins.telescope"),
    require("plugins.lsp"),
    require("plugins.conform"),
    require("plugins.cmp"),
    require("plugins.colorscheme"),
    require("plugins.todo_comments"),
    require("plugins.mini"),
    require("plugins.treesitter"),
    require("plugins.debug"),
    require("plugins.indent_line"),
    require("plugins.lint"),
    require("plugins.autopairs"),
    require("plugins.gitsigns"),
    require("plugins.oil"),
    require("plugins.obsidian"),
    require("plugins.codesnap"),
    require("plugins.neogit"),
    require("plugins.image_nvim"),

    -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
    -- Or use telescope!
    -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
    -- you can continue same window with `<space>sr` which resumes last telescope search
  }
end

-- Настройки UI для lazy.nvim
local function get_lazy_options()
  return {
    ui = {
      -- If you are using a Nerd Font: set icons to an empty table which will use the
      -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
      icons = vim.g.have_nerd_font and {} or {
        cmd = "⌘",
        config = "🛠",
        event = "📅",
        ft = "📂",
        init = "⚙",
        keys = "🗝",
        plugin = "🔌",
        runtime = "💻",
        require = "🌙",
        source = "📄",
        start = "🚀",
        task = "📌",
        lazy = "💤 ",
      },
    },
  }
end

-- Инициализация lazy.nvim
local function setup()
  ensure_lazy()
  require("lazy").setup(get_plugins(), get_lazy_options())
end

return { setup = setup }
