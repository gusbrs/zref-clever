# Changelog

## [Unreleased](https://github.com/gusbrs/zref-clever/compare/v0.1.2-alpha...HEAD)

### Fixed
- Fixed handling of type names defined to be empty.

## [v0.1.2-alpha](https://github.com/gusbrs/zref-clever/compare/v0.1.1-alpha...v0.1.2-alpha) (2022-01-10)

### Added
- Provided Dutch language file (see PR
  [#5](https://github.com/gusbrs/zref-clever/pull/5)).

### Changed
- The `gender` key in `\zcLanguageSetup` and in the built-in language files
  can receive a comma separated list as value to support types with multiple
  valid genders.
- The `cap` and `abbrev` options can now be set also in `\zcRefTypeSetup` and
  `\zcLanguageSetup`, so that fine grained control per-type and per-language
  is now possible for these options.
- Abandoned the "dictionary/translation" metaphor to refer to language
  specific options.  Mostly housekeeping, affecting the name-scheme of
  functions and variables, but aiming at a clearer documentation in this area,
  specially in the longer term.

### Deprecated
- The reference format options `refpre` and `refpos` have been deprecated in
  favor or the more aptly named `preref` and `postref`, respectively.

## [v0.1.1-alpha](https://github.com/gusbrs/zref-clever/compare/v0.1.0-alpha...v0.1.1-alpha) (2021-12-07)

### Changed
- Improvements to the French dictionary (see issue
  [#1](https://github.com/gusbrs/zref-clever/issues/1)).
- Improvements to documentation.

### Removed
- Dropped the `subappendix` reference type.

## [v0.1.0-alpha](https://github.com/gusbrs/zref-clever/releases/tag/v0.1.0-alpha) (2021-00-24)

### Added
- Initial release.
