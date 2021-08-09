#!/usr/bin/env texlua

-- Build script for "zref-check" package

-- Identify the bundle and module
bundle = ""
module = "zref-clever"

-- -- Use a dedicated readme for CTAN to meet upload requirements
-- ctanreadme = "readme-ctan.md"

-- -- Typeset only the .tex files
-- typesetfiles = {"*.tex"}

-- -- Two runs for label testing
-- checkruns = 2

-- -- CTAN upload settings

-- uploadconfig = {
--   version = "0.1.0", -- first line for tagging
--   pkg = "zref-clever",
--   author = "Gustavo Barros",
--   uploader = "Gustavo Barros",
--   summary = "",
--   license = "lppl1.3c",
--   ctanPath = "",
--   repository = "",
--   bugtracker = "",
--   update = true,
--   announcement_file = "ctan-announcement.txt",
--   note_file = "ctan-note.txt",
-- }

-- -- Set version, release date and copyright automatically
-- tagfiles = {
--   "zref-check.dtx",
--   "CHANGELOG.md",
--   "build.lua",
--   "zref-check.ins",
--   "zref-check.tex",
--   "zref-check-code.tex"
-- }

-- function update_tag(file, content, tagname, tagdate)
--   -- Handle release version tag and date.
--   local tagname_safe = string.gsub(tagname, "^v", "")
--   if string.match(file, "^zref%-check%.dtx$") then
--     content = string.gsub(
--       content,
--       "\n\\ProvidesExplPackage %{zref%-check%} %{[^}]+%} %{[^}]+%}\n",
--       "\n\\ProvidesExplPackage {zref-check} {"
--       .. tagdate .. "} {" .. tagname_safe .. "}\n"
--     )
--   elseif string.match(file, "^CHANGELOG%.md$") then
--     local url = "https://github.com/gusbrs/zref-check/compare/"
--     content = string.gsub(
--       content,
--       "(## %[Unreleased%]%(.-)%.%.%.HEAD%)",
--       "%1...v" .. tagname_safe .. ") (" .. tagdate .. ")"
--     )
--     content = string.gsub(
--       content,
--       "## %[Unreleased%]",
--       "## [Unreleased](" .. url .. "v" .. tagname_safe .. "...HEAD)\n\n"
--       .. "## [v" .. tagname_safe .. "]"
--     )
--     -- Handle CTAN release announcement.
--     local announcement = string.match(
--       content, "\n(## %[v" .. tagname_safe .. "%].-\n)## %[v"
--     )
--     announcement = string.gsub(
--       announcement,
--       "## %[v" .. tagname_safe .. "%]%(https.-%)",
--       "## v" .. tagname_safe
--     )
--     -- File operations based on 'update_file_tag' function of
--     -- 'l3build-tagging.lua'.
--     local annfile = uploadconfig.announcement_file
--     local annfilename = basename(annfile)
--     local annpath = dirname(annfile)
--     ren(annpath,annfilename,annfilename .. ".bak")
--     local af = assert(io.open(annfile,"w"))
--     af:write((string.gsub(announcement,"\n",os_newline)))
--     af:close()
--     rm(annpath,annfilename .. ".bak")
--   elseif string.match(file, "^build%.lua$") then
--     content = string.gsub(
--       content,
--       "(\nuploadconfig%s*=%s*%{%s*version%s*=%s*\")[^\"]*(\")",
--       "%1" .. tagname_safe .. "%2"
--     )
--   end
--   -- Handle copyright notice.
--   if string.match(file, "^zref%-check%.dtx$") or
--      string.match(file, "^zref%-check%.ins$") or
--      string.match(file, "^zref%-check%.tex$") or
--      string.match(file, "^zref%-check%-code%.tex$") then
--     local tagyear = string.match(tagdate, "%d%d%d%d")
--     if string.match(content, "Copyright%D-%d%d%d%d%-%d%d%d%d") then
--       if not string.find(content, "Copyright%D-%d%d%d%d*%-" .. tagyear) then
--         content = string.gsub(
--           content,
--           "Copyright(%D-)(%d%d%d%d%-)%d%d%d%d",
--           "Copyright%1%2" .. tagyear
--         )
--       end
--     else
--       if not string.find(content, "Copyright%D-" .. tagyear) then
--         content = string.gsub(
--           content,
--           "Copyright(%D-)(%d%d%d%d)",
--           "Copyright%1%2-" .. tagyear
--         )
--       end
--     end
--   end
--   return content
-- end

-- function tag_hook(tagname)
--   local tagname_safe = string.gsub(tagname, "^v", "")
--   os.execute('git commit -a -m "Step release tag"')
--   os.execute('git tag -a -m "" v' .. tagname_safe)
-- end
