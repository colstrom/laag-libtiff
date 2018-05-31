
# -*- ruby -*-

require 'laag/library' # MIT License

module LAAG
  LIBTIFF_GEM_ROOT = File.expand_path(File.join(__dir__, %w[.. ..]))
  LIBTIFF_ORIGIN  = 'gitlab.com/libtiff/libtiff'
  LIBTIFF_VERSION = (
    $LOADED_FEATURES
      .map { |f| f.match %r{/laag-libtiff-(?<version>[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)} }
      .compact
      .map { |gem| gem['version'] }
      .uniq
      .first
  ) || (
    File
      .basename(LIBTIFF_GEM_ROOT)
      .match(%r{^laag-libtiff-(?<version>[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)})['version']
  )

  def self.libtiff
    @@libtiff ||= Library.new(
      gem_root: LIBTIFF_GEM_ROOT,
      origin:   LIBTIFF_ORIGIN,
      version:  LIBTIFF_VERSION
    )
  end
end
