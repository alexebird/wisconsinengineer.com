module Admin::ContributorsHelper
  def contributor_types_select
    # Remove the 'photographer' type because it is only used for uploaded photos.
    all_types = ContributorType.all
    photographer = nil
    all_types.each do |t|
      if t.name == "photographer"
        photographer = t
      end
    end
    used_types = all_types - [photographer]
    select("contributor", "contributor_type_id", used_types.collect {|c| [ c.name.capitalize, c.id ] })
  end
end
