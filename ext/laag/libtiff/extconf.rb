
# -*- ruby -*-

require 'mkmf' # Ruby Standard Library

require 'laag' # MIT License
require 'laag/xz' # Public Domain

require_relative '../../../lib/laag/libtiff'

LAAG::BuildEnvironment.new(LAAG.libtiff).script do
  xz_include = File.join(LAAG.xz.install_path, "include")
  xz_lib     = File.join(LAAG.xz.install_path, "lib")

  default!(
    configure: [
      "--with-lzma-include-dir=#{xz_include}",
      "--with-lzma-lib-dir=#{xz_lib}",
    ])
end

create_makefile 'laag/libtiff'
