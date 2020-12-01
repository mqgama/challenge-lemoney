class OfferStatus < EnumerateIt::Base
  associate_values :enabled, :disabled

  sort_by :translation
end