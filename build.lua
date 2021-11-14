#!/usr/bin/env texlua

-- Build script for "zref-clever" package

-- Identify the bundle and module
bundle = ""
module = "zref-clever"

-- Use a dedicated readme for CTAN to meet upload requirements
ctanreadme = "readme-ctan.md"

-- Typeset only the .tex files
typesetfiles = {"*.tex"}

-- Add dictionaries to installation files
installfiles = {"*.sty","*.cls","*.dict"}

-- Two runs for label testing
checkruns = 2

-- Include pdflatex-dev format to checkengines
-- See https://tex.stackexchange.com/q/611424
checkengines = {"pdftex","luatex","xetex","pdftexdev"}
specialformats = specialformats or {}
specialformats.latex = specialformats.latex or {}
specialformats.latex.pdftexdev =
  { binary = "pdftex", format = "pdflatex-dev" }

-- Set up different test sets
checkconfigs = {"build-moreruns","build"}

-- Use UTF-8 logs for all engines
asciiengines = {}

-- CTAN upload settings

uploadconfig = {
  version = "0.0.0", -- first line for tagging
  pkg = "zref-clever",
  author = "Gustavo Barros",
  uploader = "Gustavo Barros",
  summary = "",
  license = "lppl1.3c",
  ctanPath = "",
  repository = "",
  bugtracker = "",
  update = true,
  announcement_file = "ctan-announcement.text",
  note_file = "ctan-note.text",
}

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

-- function tag_hook(tagname)
--   local tagname_safe = string.gsub(tagname, "^v", "")
--   os.execute('git commit -a -m "Step release tag"')
--   os.execute('git tag -a -m "" v' .. tagname_safe)
-- end
