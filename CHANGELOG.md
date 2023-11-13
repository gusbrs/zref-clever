# Changelog

## [Unreleased](https://github.com/gusbrs/zref-clever/compare/v0.4.2...HEAD)

### Changed
- Don't use `expl3` public scratch temporary variables.
- Prefer `e-type` expansion.
- Require 2023-11-01 LaTeX kernel.

## [v0.4.2](https://github.com/gusbrs/zref-clever/compare/v0.4.1...v0.4.2) (2023-08-14)

### Changed
- Thanks to better support for `zref` in `memoir`, the corresponding
  compatibility module has been simplified and made more robust, without loss
  of functionality.
- Use `\label` instead of `\zlabel` in regression tests.

## [v0.4.1](https://github.com/gusbrs/zref-clever/compare/v0.4.0...v0.4.1) (2023-06-19)

### Changed
- Improved Dependencies section in User manual.

### Fixed
- Use safer method to define the `zc@pgfmt` property.

## [v0.4.0](https://github.com/gusbrs/zref-clever/compare/v0.3.6...v0.4.0) (2023-06-14)

### Added
- `labelhook` option, controlling whether to set a `\zlabel` alongside a
  standard `\label`.  This option uses the kernel's new `label` hook, which
  significantly improves and simplifies the task of setting a `\zlabel` in
  places where this is not directly supported.  The option is enabled by
  default, and strongly recommended.  It is not expected that this change will
  bring backward compatibility problems, `\zlabel`s continue to work just as
  before, and the places where a `\label` is required will also continue to
  work the same way.  The only case I see where you might need to adjust
  existing documents is if you already had both `\label`s and `\zlabel`s with
  the same names, in which case now you'll have a duplicate `zlabel` and will
  indeed have to correct it.  Also, you may be interested in taking a look at
  the "`\label` or `\zlabel`?" section of the User manual, since the option
  opens the possibility of a different approach in label setting in your
  documents.

### Changed
- Given the new `labelhook` option and the fact that it requires both the new
  `label` hook and the new hooks with options released in the latest LaTeX
  kernel, the kernel version required by `zref-clever` has been bumped to
  2023-06-01.

### Removed
- Given the new `labelhook` option, the parts of compatibility modules which
  provided for setting `\zlabel`s with `\label` in places where the former is
  not supported have been removed.  These would conflict with the new option,
  and the use of the `label` hook for this purpose renders them unnecessary
  and is superior in every aspect.  Namely, the compatibility modules changed
  in this fashion are: `amsmath`, `memoir`, and `listings`.

## [v0.3.6](https://github.com/gusbrs/zref-clever/compare/v0.3.5...v0.3.6) (2023-02-21)

### Fixed
- Avoid "Missing number, treated as zero" error for labels set before first
  call to `\refstepcounter`.

## [v0.3.5](https://github.com/gusbrs/zref-clever/compare/v0.3.4...v0.3.5) (2023-02-18)

### Fixed
- In tcolorbox how-to, `hyperref` should be loaded before any `\newtcolorbox`es.

## [v0.3.4](https://github.com/gusbrs/zref-clever/compare/v0.3.3...v0.3.4) (2023-02-13)

### Added
- `tcolorbox` how-to to the User manual.

### Changed
- The `KOMA` compatibility module has been removed, since it was rendered
  unnecessary by recent versions of KOMA Script classes.

## [v0.3.3](https://github.com/gusbrs/zref-clever/compare/v0.3.2...v0.3.3) (2023-01-03)

### Added
- New `reftype` option, to allow for local manual override of `countertype`
  settings.
- Included some new How-tos to the User manual.

## [v0.3.2](https://github.com/gusbrs/zref-clever/compare/v0.3.1...v0.3.2) (2022-12-27)

### Added
- Italian localization (see issue
  [#11](https://github.com/gusbrs/zref-clever/issues/11)).
- Localization guidelines for contributors (in the Code documentation).
- Document UTF-8 input encoding requirement.
- Work-around for `beamer` in the User manual.

### Changed
- Improved consistency of the Dutch language file with `babel` captions (see
  PRs [#12](https://github.com/gusbrs/zref-clever/pull/12) and
  [#13](https://github.com/gusbrs/zref-clever/pull/13)).

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
