## Submission
This package was previously removed from CRAN. This is because I did not fix a
bug in time with the CRAN policies. The bug was causing all of the `get_*()`
functions in this package to return an error when calling 'The Rick and Morty'
API. In this release I have:

* Fixed the bug causing the API responses to fail.

## Test environments
* local macOS 10.16, R 4.0.3
* Ubuntu 16.04.6 LTS (on travis-ci), R 4.0.2
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 0 notes
