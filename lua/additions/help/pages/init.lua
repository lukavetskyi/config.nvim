local P = {
  pages = {
    require("additions.help.pages.normal"),
    require("additions.help.pages.insert"),
    require("additions.help.pages.visual"),
    require("additions.help.pages.terminal")
  },
  current_page = 1
}



return P
