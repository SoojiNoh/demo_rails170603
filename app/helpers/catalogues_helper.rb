module CataloguesHelper
  def setup_catalogue(catalogue)
    # ... code from above omitted

    if !catalogue.exhibitions.present?
      catalogue.exhibitions.build
    end
    
    # if !catalogue.artists.present?
    #   catalogue.build_artist
    # end
    
    if !catalogue.pages.present?
      catalogue.pages.build
    end
    # catalogue.exhibitions ||= catalogue.exhibitions.build
    # catalogue.histories ||= History.new
    # 1.times {
    #     catalogue.exhibitions.build;
    #     catalogue.exhibitions.first.spaces.build;
    # }
    catalogue
  end
end
