return function()
  local ls = require("luasnip")
  local s = ls.snippet
  local sn = ls.snippet_node
  local t = ls.text_node
  local i = ls.insert_node
  local f = ls.function_node
  local c = ls.choice_node
  local d = ls.dynamic_node
  local r = ls.restore_node
  local l = require("luasnip.extras").lambda
  local rep = require("luasnip.extras").rep
  local p = require("luasnip.extras").partial
  local m = require("luasnip.extras").match
  local n = require("luasnip.extras").nonempty
  local dl = require("luasnip.extras").dynamic_lambda
  local fmt = require("luasnip.extras.fmt").fmt
  local fmta = require("luasnip.extras.fmt").fmta
  local types = require("luasnip.util.types")
  local conds = require("luasnip.extras.conditions")
  local conds_expand = require("luasnip.extras.conditions.expand")

  local function copy(args)
    return args[1]
  end

  ls.add_snippets("python", {
    s("MAIN", {
      t({"","def main():", ""}),
      t("\t"),
      i(0,"pass"),
      t({"",""}),
      t({"",""}),
      t({"","if __name__ == \"__main__\":"}),
      t({"","\tmain()"})
    }),
    s('fn',{
      t("def "),
      i(1,"name"),
      t("("),
      i(2,""),
      t(") -> "),
      i(3,"None"),
      t(":"),
      t({'','\t'}),
      i(4,"pass")
    })
  })
end
