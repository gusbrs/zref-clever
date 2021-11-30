-- Use dev formats for regression tests
-- See https://tex.stackexchange.com/q/611424
-- Technically, this could be done directly from 'build.lua', however, leaving
-- this separate here, grants us the possibility of running just 'l3build
-- check -c build' for quicker tests, and using the full l3build' only when
-- thorough testing is indeed required.  This excludes 'build-moreruns' from
-- the dev format set, but there's really no need for it to be included.
checkengines = {"pdftexdev","luatexdev","xetexdev"}
specialformats = specialformats or {}
specialformats.latex =
  {
    pdftexdev = { binary = "pdflatex-dev" , format = "" } ,
    luatexdev = { binary = "lualatex-dev" , format = "" } ,
    xetexdev  = { binary = "xelatex-dev"  , format = "" } ,
  }
