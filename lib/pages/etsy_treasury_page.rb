class EtsyTreasuryPage < BasePageClass

  expected_title "Etsy - Treasury"
  div :list_treasury, :class => "list-treasury"
  li :item_treasury, :class => "item-treasury"

  div :item_hotness do | item_treasury |
    item_treasury.div :class => "item-treasury-hotness"
  end

  div :item_info do | item_treasury |
    item_treasury.div(:class => "item-treasury-info")
  end

  div :item_stats do | item_treasury |
    item_treasury.div(:class => "item-treasury-stats")
  end

  div :item_preview do | item_treasury |
    item_treasury.div(:class => "item-treasury-preview")
  end

end