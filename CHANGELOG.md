# Changelog

## [Unreleased](https://github.com/gusbrs/zref-clever/compare/v0.3.1...HEAD)

### Added
- Localization guidelines for contributors (in the Code documentation).
- Document UTF-8 input encoding requirement.
- Work-around for `beamer` in the User manual.

### Changed
- Improved consistency of the Dutch language file with `babel` captions (see
  PR [#12](https://github.com/gusbrs/zref-clever/pull/12)).

## [v0.3.1](https://github.com/gusbrs/zref-clever/compare/v0.3.0...v0.3.1) (2022-05-28)

### Added
- "`zref-clever` for the impatient" section to User manual.

## [v0.3.0](https://github.com/gusbrs/zref-clever/compare/v0.2.2-alpha...v0.3.0) (2022-04-22)

### Changed
- `zref-clever` no longer accepts package options to be set a load-time,
  `\zcsetup` must be used instead.  The use of load-time options now results
  in "Unknown option" LaTeX error.  This change requires that users adjust
  their documents, and a suitable package warning has been provided so that
  affected users know of the change directly and how to adjust.
- Option `check` has been made no-op in the preamble.  To load the
  corresponding package, just use the standard `\usepackage`.
- (Internal) Use public hyperref's commands for building links instead of the
  internal `\hyper@@link`.

### Deprecated
- Options `titleref` and `vario` have been deprecated.  To load the
  corresponding packages, just use the standard `\usepackage`.

### Fixed
- Bug which affected the typesetting with compression in case two ranges for
  the same reference type occurred.

## [v0.2.2-alpha](https://github.com/gusbrs/zref-clever/compare/v0.2.1-alpha...v0.2.2-alpha) (2022-02-11)

### Changed
- (Internal) Option variables setting was reviewed, ensuring proper scope is
  in use and that they are always properly declared.  `expl3` debugging
  enabled in regression tests.

## [v0.2.1-alpha](https://github.com/gusbrs/zref-clever/compare/v0.2.0-alpha...v0.2.1-alpha) (2022-02-07)

### Added
- Option `endrange` for typesetting terse ranges.
- Option `rangetopair` to control behavior of `range` option when a pair
  results from building a range.
- Option `vario` to load package `zref-vario`.
- Reference property `subeq` for the `amsmath` and `breqn` compatibility
  modules.

## [v0.2.0-alpha](https://github.com/gusbrs/zref-clever/compare/v0.1.2-alpha...v0.2.0-alpha) (2022-01-28)

### Added
- The reference block formatting has been generalized to allow for more
  flexibility in setting the reference structure, with the new option
  `refbounds`.

### Fixed
- Fixed handling of type names defined to be empty.
- Fixed distinction of `lastsep` and `pairsep` in cases where the type-block
  starts or ends with a range.

### Changed
- The `namefont` and `reffont` options can now be set also in
  `\zcRefTypeSetup` and `\zcLanguageSetup`.
- (Internal) Moved from property lists to individually named macros to store
  and retrieve options.

### Deprecated
- Options `preposinlink`, `preref`, and `postref` have been deprecated and
  replaced by new option `refbounds`.

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

## [v0.1.0-alpha](https://github.com/gusbrs/zref-clever/releases/tag/v0.1.0-alpha) (2021-11-24)

### Added
- Initial release.
