return {
  settings = {
    tailwindCSS = {
      lint = { cssConflict = "warning", invalidApply = "error" },
      experimental = { classRegex = { "tw`([^`]*)", 'tw="([^"]*)', 'tw={"([^"}]*)' } },
    },
  },
}
