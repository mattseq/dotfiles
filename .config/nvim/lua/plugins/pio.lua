return {
  "446564/pio.nvim",
  ft = { "c", "cpp", "objc", "objcpp" },
  cmd = { "PioEnv", "PioStatus", "PioDevice", "PioBuild", "PioUpload", "PioMonitor" },
  opts = {
    -- pio_cmd = "pio",
    -- auto_pick_single = true,
    -- always_show_all_envs_as_fallback = true,
  },
  keys = {
    { "<leader>pe", "<cmd>PioEnv<cr>", desc = "PIO: switch env (compile_commands.json)" },
    { "<leader>ps", "<cmd>PioStatus<cr>", desc = "PIO: status" },
    { "<leader>pd", "<cmd>PioDevice<cr>", desc = "PIO: select device" },
    { "<leader>pb", "<cmd>PioBuild<cr>", desc = "PIO: build" },
    { "<leader>pu", "<cmd>PioUpload<cr>", desc = "PIO: upload" },
    { "<leader>pm", "<cmd>PioMonitor<cr>", desc = "PIO: monitor" },
  },
  init = function()
    -- Register the <leader>p group label for which-key.
    local ok, wk = pcall(require, "which-key")
    if ok then
      wk.add({ { "<leader>p", group = "pio" } })
    end
  end,
}
