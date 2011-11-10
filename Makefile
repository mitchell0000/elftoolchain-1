# $Id$

TOP=	.

# Build configuration information first.
SUBDIR += common

# Build the base libraries next.
SUBDIR += libelf
SUBDIR += libdwarf

# Build additional APIs.
SUBDIR += libelftc

# Build tools after the libraries.
SUBDIR += addr2line
SUBDIR += ar
SUBDIR += brandelf
SUBDIR += cxxfilt
SUBDIR += elfcopy
SUBDIR += elfdump
SUBDIR += findtextrel
SUBDIR += nm
SUBDIR += readelf
SUBDIR += size
SUBDIR += strings

# Build the test suites.
.if exists(${.CURDIR}/test)
SUBDIR += test
.endif

# Build documentation at the end.
.if exists(${.CURDIR}/documentation)
SUBDIR += documentation
.endif

.include "${TOP}/mk/elftoolchain.subdir.mk"

#
# Special top-level targets.
#

# Run the test suites.
.if exists(${.CURDIR}/test)
run-tests:	all .PHONY
	(cd ${.CURDIR}/test; ${MAKE} test)
.endif
