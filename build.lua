-- Build script for "zref-clever" package

-- Identify the bundle and module
bundle = ""
module = "zref-clever"

-- Typeset only the .tex files
typesetfiles = {"*.tex"}

-- Add dictionaries to installation files
installfiles = {"*.sty","*.cls","*.dict"}

-- Two runs for label testing
checkruns = 2

-- Set up different test sets
checkconfigs = {"build","build-moreruns"}

-- Use dev formats for regression tests
-- See https://tex.stackexchange.com/q/611424
checkengines = {"pdftex","luatex","xetex","pdftexdev","luatexdev","xetexdev"}
specialformats = specialformats or {}
specialformats.latex =
  {
    pdftexdev = { binary = "pdflatex-dev" , format = "" } ,
    luatexdev = { binary = "lualatex-dev" , format = "" } ,
    xetexdev  = { binary = "xelatex-dev"  , format = "" } ,
  }

-- Use UTF-8 logs for all engines
asciiengines = {}

-- Release a TDS-style zip
packtdszip = true

-- CTAN upload settings
uploadconfig = {
  version = "0.1.0-alpha", -- first line for tagging
  pkg = "zref-clever",
  author = "Gustavo Barros",
  uploader = "Gustavo Barros",
  summary = "Clever LaTeX cross-references based on zref",
  license = "lppl1.3c",
  ctanPath = "/macros/latex/contrib/zref-clever",
  repository = "https://github.com/gusbrs/zref-clever",
  bugtracker = "https://github.com/gusbrs/zref-clever/issues",
  update = true,
  announcement_file = "ctan-announcement.text",
  note_file = "ctan-note.text",
}

-- Use a dedicated readme for CTAN to meet upload requirements
ctanreadme = "readme-ctan.md"

-- Set version, release date and copyright automatically
tagfiles = {
  "zref-clever.dtx",
  "CHANGELOG.md",
  "build.lua",
  "zref-clever.ins",
  "zref-clever.tex",
  "zref-clever-code.tex"
}

function update_tag(file, content, tagname, tagdate)
  -- Handle release version tag and date.
  local tagname_safe = string.gsub(tagname, "^v", "")
  if string.match(file, "^zref%-clever%.dtx$") then
    content = string.gsub(
      content,
      "\n\\ProvidesExplPackage %{zref%-clever%} %{[^}]+%} %{[^}]+%}\n",
      "\n\\ProvidesExplPackage {zref-clever} {"
      .. tagdate .. "} {" .. tagname_safe .. "}\n"
    )
  elseif string.match(file, "^CHANGELOG%.md$") then
    local url = "https://github.com/gusbrs/zref-clever/compare/"
    content = string.gsub(
      content,
      "(## %[Unreleased%]%(.-)%.%.%.HEAD%)",
      "%1...v" .. tagname_safe .. ") (" .. tagdate .. ")"
    )
    content = string.gsub(
      content,
      "## %[Unreleased%]",
      "## [Unreleased](" .. url .. "v" .. tagname_safe .. "...HEAD)\n\n"
      .. "## [v" .. tagname_safe .. "]"
    )
    -- Handle CTAN release announcement.
    -- The `or ""` is meant to cover the case of the *first* release, for
    -- which there will be no match for that pattern.  It must be done
    -- manually.
    local announcement = string.match(
      content, "\n(## %[v" .. tagname_safe .. "%].-\n)## %[v"
    ) or ""
    announcement = string.gsub(
      announcement,
      "## %[v" .. tagname_safe .. "%]%(https.-%)",
      "## v" .. tagname_safe
    )
    -- File operations based on 'update_file_tag' function of
    -- 'l3build-tagging.lua'.
    local annfile = uploadconfig.announcement_file
    local annfilename = basename(annfile)
    local annpath = dirname(annfile)
    ren(annpath,annfilename,annfilename .. ".bak")
    local af = assert(io.open(annfile,"w"))
    af:write((string.gsub(announcement,"\n",os_newline)))
    af:close()
    rm(annpath,annfilename .. ".bak")
  elseif string.match(file, "^build%.lua$") then
    content = string.gsub(
      content,
      "(\nuploadconfig%s*=%s*%{%s*version%s*=%s*\")[^\"]*(\")",
      "%1" .. tagname_safe .. "%2"
    )
  end
  -- Handle copyright notice.
  if string.match(file, "^zref%-clever%.dtx$") or
     string.match(file, "^zref%-clever%.ins$") or
     string.match(file, "^zref%-clever%.tex$") or
     string.match(file, "^zref%-clever%-code%.tex$") then
    local tagyear = string.match(tagdate, "%d%d%d%d")
    if string.match(content, "Copyright%D-%d%d%d%d%-%d%d%d%d") then
      if not string.find(content, "Copyright%D-%d%d%d%d*%-" .. tagyear) then
        content = string.gsub(
          content,
          "Copyright(%D-)(%d%d%d%d%-)%d%d%d%d",
          "Copyright%1%2" .. tagyear
        )
      end
    else
      if not string.find(content, "Copyright%D-" .. tagyear) then
        content = string.gsub(
          content,
          "Copyright(%D-)(%d%d%d%d)",
          "Copyright%1%2-" .. tagyear
        )
      end
    end
  end
  return content
end

function tag_hook(tagname)
  local tagname_safe = string.gsub(tagname, "^v", "")
  os.execute('git commit -a -m "Step release tag"')
  os.execute('git tag -a -m "" v' .. tagname_safe)
end
