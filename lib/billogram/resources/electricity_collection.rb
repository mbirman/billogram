module Billogram
  class ElectricityCollection < Resource
    attr_accessor :nyttighet, :kommunkod, :slutfaktura, :kravmall,
      :frankopplad, :arsforb, :plombkod, :natom, :avflyttad_datum,
      :frankopplad_datum, :anladr, :anlid, :avflyttad, :naringsidkare
  end
end