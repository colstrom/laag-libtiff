
# -*- ruby -*-

require 'mkmf' # Ruby Standard Library

require 'laag' # MIT License
require_relative '../../../lib/laag/libtiff'

LAAG::BuildEnvironment
  .new(LAAG.libtiff)
  .script { default! }

create_makefile 'laag/libtiff'
