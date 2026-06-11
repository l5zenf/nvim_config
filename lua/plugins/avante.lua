return {
  "yetone/avante.nvim",
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    provider = "openai",
    auto_suggestions_provider = "openai",

    input = {
      provider = "snacks",
    },

    behaviour = {
      auto_suggestions = true,
      auto_add_current_file = false,
    },

    suggestion = {
      debounce = 600,
      throttle = 600,
    },

    providers = {
      openai = {
        endpoint = "http://127.0.0.1:1337/v1",
        model = "Qwen3_5-4B_Q4_K_M",
        api_key_name = "",
        timeout = 30000,
        extra_request_body = {
          temperature = 0.3,
          max_tokens = 4096,
        },
      },
    },
  },
}
